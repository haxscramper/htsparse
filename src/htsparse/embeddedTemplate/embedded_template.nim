{.compile: "embeddedTemplate_parser.c".}
{.compile: "embeddedTemplate_scanner.c".}
{.passl: "-ltree-sitter".}

import embeddedTemplate_wrapper
export embeddedTemplate_wrapper
