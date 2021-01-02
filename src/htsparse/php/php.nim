{.compile: "php_parser.c".}
{.compile: "php_scanner.cc".}
{.passl: "-ltree-sitter".}

import php_wrapper
export php_wrapper
