## php-global-strict

### Описание

Расширение
включает [строгую проверку типов](https://www.php.net/manual/en/language.types.declarations.php#language.types.declarations.strict)
по умолчанию (a.k.a. `declare(strict_types = 1)`).

### Критика решения

По-хорошему, это надо делать через модификацию AST ( Abstract Syntax Tree).

В PHP есть на такое хук `zend_ast_process`, но у меня не получилось сделать через него D:

### Что хочется сделать

Если в файле уже присутствует `strict_types` с любым значением, то ничего не делать.

А то сейчас в файле указано `strict_types = 0`, он сделает `strict_types = 1` :/

### Сборка:

```sh
phpize
./configure
make
make test
```