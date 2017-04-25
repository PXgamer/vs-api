<?php

namespace VS\Api;

use System\Route;
use VS\Framework\Controller\Main;

/**
 * Class Routes
 */
class Routes
{
    const CONTROLLERS = '\\VS\\Api\\Controller\\';

    /**
     * @param Route $Route
     * @return Route
     */
    public static function Register(Route $Route)
    {
        return $Route;
    }
}