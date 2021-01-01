{.passl: "-lstdc++".}
{.passl: "-ltree-sitter".}
{.compile: "latex_parser.c".}

{.compile: "src/latex_scanner.cc".}
{.compile: "src/latex_catcode.cc".}
{.compile: "src/latex_scanner_control_sequences.cc".}
{.compile: "src/latex_scanner_keywords.cc".}
{.compile: "src/latex_scanner_names.cc".}
{.compile: "src/latex_scanner_environments.cc".}

import latex_wrapper
export latex_wrapper
