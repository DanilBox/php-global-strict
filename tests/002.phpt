--TEST--
check_alive() Basic test
--EXTENSIONS--
global_strict
--FILE--
<?php
function test_strict(string $str): string {
 return $str;
}
test_strict(123);
?>
--EXPECTF--
Fatal error: Uncaught TypeError: test_strict(): Argument #1 ($str) must be of type string, int given, called in %s on line %d and defined in %s:%d
Stack trace:
#0 %s(%d): test_strict(123)
#1 {main}
  thrown in %s on line %d