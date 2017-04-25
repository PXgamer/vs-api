<?php

namespace VS\Api;

use System\Route;
use VS\Framework\Routing\PluginRoute;

/**
 * Class Routes
 */
class Routes extends PluginRoute
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