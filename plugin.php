<?php

/**
 * Plugin Name: This is big plugin
 */

require_once 'vendor/autoload.php';

class Cheese {
  public function add($a, $b) {
    return $a + $b;
  }

  public function die($thingy) {
    echo $thingy;
    die();
  }
}

// $cheese = new Cheese();

// echo " 2 + 2 = {$cheese->add(2, 2)}";
// $cheese->die("whoops");