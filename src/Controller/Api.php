<?php

namespace VS\Api\Controller;

use VS\Framework\Controller\Controller;
use VS\Framework\User\Account;

class Api extends Controller
{
    const HTTP_200 = 'HTTP/1.0 200 OK';
    const HTTP_201 = 'HTTP/1.0 201 Created';
    const HTTP_404 = 'HTTP/1.0 404 Not Found';
    const HTTP_401 = 'HTTP/1.0 401 Unauthorized';

    public function __construct()
    {
        Parent::__construct();
        $this->smarty->addTemplateDir(realpath(__DIR__ . DS . '..' . DS . '..') . DS . 'templates');
    }

    public function index()
    {
        $user_id = Account::user('id');
        $stmt = $this->db->prepare('SELECT api_key FROM users_info WHERE id = :id');
        $stmt->bindParam(':id', $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        $api_key = $stmt->fetch(\PDO::FETCH_OBJ)->api_key ?? null;

        $this->smarty->display(
            'api/index.tpl',
            [
                'api_key' => $api_key
            ]
        );
    }

    public function error_404()
    {
        header(self::HTTP_404);
        self::json(
            [
                'status' => false,
                'http_code' => 404,
                'response' => self::HTTP_404
            ]
        );
    }

    public function validate()
    {
        $this->requireAuth();
        header(self::HTTP_OK);
        self::json(
            [
                'status' => true,
                'http_code' => 200,
                'response' => 'User authenticated successfully.'
            ]
        );
    }

    public function users($username)
    {
        $this->requireAuth();
		
		if (isset($username) && $username != '') {
			$this->db->prepare('SELECT id, username FROM users');
		}
		
        header(self::HTTP_OK);
        self::json(
            [
                'status' => true,
                'http_code' => 200,
                'response' => $response
            ]
        );
    }

    private function requireAuth()
    {
        if (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
            $stmt = $this->db->prepare(
                'SELECT id FROM users
                          JOIN users_info ON users.id = users_info.id
                          WHERE username = :username AND api_key = :api_key');
            $stmt->bindParam(':username', $_SERVER['PHP_AUTH_USER'], \PDO::PARAM_STR);
            $stmt->bindParam(':api_key', $_SERVER['PHP_AUTH_PW'], \PDO::PARAM_STR);
            $stmt->execute();
            if ($stmt->rowCount() > 0) {
                return true;
            }
        }
        header(self::HTTP_401);
        self::json(
            [
                'status' => false,
                'http_code' => 401,
                'response' => 'Failed to authenticate user.'
            ]
        );
        die();
        return false;
    }

    private static function json($data)
    {
        header('Content-Type: text/json, text/plain');
        echo json_encode($data);
    }
}