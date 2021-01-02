{.compile: "embeddedTemplate_parser.c".}
{.compile: "embeddedTemplate_scanner.cc".}
{.passl: "-ltree-sitter".}

import embedded_template_wrapper
export embedded_template_wrapper
