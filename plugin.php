<?php

/**
 * Plugin Name: This is big plugin
 */

require_once './vendor/bin/composer/autoload.php';

class Cheese {
  public function __construct() {

  }

  public function add($a, $b) {
    return $a + $b;
  }
}