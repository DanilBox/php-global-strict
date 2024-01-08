--TEST--
Check if global_strict is loaded
--EXTENSIONS--
global_strict
--FILE--
<?php
echo 'The extension "global_strict" is available';
?>
--EXPECT--
The extension "global_strict" is available
