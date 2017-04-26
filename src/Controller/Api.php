<?php

namespace VS\Api\Controller;

use VS\Framework\Controller\Controller;

class Api extends Controller
{
    public function __construct()
    {
        Parent::__construct();
        $this->smarty->addTemplateDir(realpath(__DIR__ . DS . '..' . DS . '..') . DS . 'templates');
    }

    public function index()
    {

    }
}