#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_global_strict.h"

ZEND_API zend_op_array *(*original_compile_file)(zend_file_handle *file_handle, int type);

ZEND_API zend_op_array *global_strict_compile_file(zend_file_handle *file_handle, int type)
{
	zend_op_array *op_array = original_compile_file(file_handle, type);

	if ((op_array->fn_flags & ZEND_ACC_STRICT_TYPES) == 0) {
		op_array->fn_flags |= ZEND_ACC_STRICT_TYPES;
	}

	return op_array;
}

PHP_MINIT_FUNCTION(global_strict)
{
	original_compile_file = zend_compile_file;
	zend_compile_file = global_strict_compile_file;

	return SUCCESS;
}

PHP_MSHUTDOWN_FUNCTION(global_strict)
{
	zend_compile_file = original_compile_file;

	return SUCCESS;
}

/* {{{ PHP_RINIT_FUNCTION */
PHP_RINIT_FUNCTION(global_strict)
{
#if defined(ZTS) && defined(COMPILE_DL_GLOBAL_STRICT)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(global_strict)
{
	php_info_print_table_start();
	php_info_print_table_row(2, "global_strict support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ global_strict_module_entry */
zend_module_entry global_strict_module_entry = {
	STANDARD_MODULE_HEADER,
	"global_strict",
	NULL,
	PHP_MINIT(global_strict),
	PHP_MSHUTDOWN(global_strict),
	PHP_RINIT(global_strict),
	NULL,
	PHP_MINFO(global_strict),
	PHP_GLOBAL_STRICT_VERSION,
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_GLOBAL_STRICT
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(global_strict)
#endif
