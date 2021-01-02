{.compile: "scala_parser.c".}
{.compile: "scala_scanner.c".}
{.passl: "-ltree-sitter".}

import scala_wrapper
export scala_wrapper
