#ifndef PHP_GLOBAL_STRICT_H
# define PHP_GLOBAL_STRICT_H

extern zend_module_entry global_strict_module_entry;
# define phpext_global_strict_ptr &global_strict_module_entry

# define PHP_GLOBAL_STRICT_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_GLOBAL_STRICT)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_GLOBAL_STRICT_H */
