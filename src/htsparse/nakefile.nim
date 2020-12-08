import hparse/htreesitter/hts_wrapgen
import hmisc/other/[oswrap, colorlogger, hcligen]
import std/[uri, options]

# let rawgh = "https://raw.githubusercontent.com/"

startColorLogger()

proc build*(
  lang: string,
  grammarUrl: Url,
  scannerUrl: Option[Url] = none(Url),
  scannerFile: RelFile = RelFile(lang & "_scanner.c"),
  parserOut: RelFile = RelFile(lang & "_parser.c")) =
  mkDir RelDir(lang)
  cd RelDir(lang)
  debug lang
  grammarFromUrl(
    grammarUrl = grammarUrl,
    scannerUrl = scannerUrl,
    scannerFile = scannerFile,
    parserOut = parserOut
  )

proc tomlCompile*() =
  ## Compile sources for toml parser
  build("toml",
    Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-toml/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-toml/master/src/scanner.c"),
  )


proc cppCompile*() =
  ## Compile sources for cpp parser
  build("cpp",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-cpp/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-cpp/master/src/scanner.cc"),
    scannerFile = RelFile("cpp_scanner.cc"),
  )

proc bashCompile*() =
  build("bash",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-bash/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-bash/master/src/scanner.cc"),
    scannerFile = RelFile("bash_scanner.cc")
  )

proc cCompile*() =
  build("c",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-c/master/grammar.js")
  )

proc csharpCompile*() =
  build("csharp",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-c-sharp/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-c-sharp/master/src/scanner.c"),
  )

proc cssCompile*() =
  build(
    "css",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-css/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-css/master/src/scanner.c")
  )

proc elmCompile*() =
  build("elm",
    Url("https://raw.githubusercontent.com/Razzeee/tree-sitter-elm/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/Razzeee/tree-sitter-elm/master/src/scanner.cc"),
    scannerFile = RelFile("elm_scanner.cc")
  )

proc enoCompile*() =
  build("eno",
    Url("https://raw.githubusercontent.com/eno-lang/tree-sitter-eno/main/grammar.js"),
    some Url("https://raw.githubusercontent.com/eno-lang/tree-sitter-eno/main/src/scanner.cc"),
    scannerFile = RelFile("eno_scanner.cc")
  )

proc embeddedTemplateCompile*() =
  build("embeddedTemplate",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-embedded-template/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-embedded-template/master/src/scanner.cc"),
    scannerFile = RelFile("embeddedTemplate_scanner.cc")
  )

proc fennelCompile*() =
  build("fennel",
    Url("https://raw.githubusercontent.com/TravonteD/tree-sitter-fennel/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/TravonteD/tree-sitter-fennel/master/src/scanner.c"),
  )

proc goCompile*() =
  build("go",
    Url("tree-sitter/tree-sitter-go/master/grammar.js")
  )

proc htmlCompile*() =
  # FIXME html has multifile scanner
  discard
  # build(
  #   "html",
  #   Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/grammar.js"),
  #   some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/src/scanner.cc"),
  #   scannerFile = RelFile("html_scanner.cc")
  # )


proc javaCompile*() =
  build(
    "java",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-java/master/grammar.js")
    # some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-java/master/src/binding.cc"),
    # scannerFile = RelFile("java_scanner.cc")
  )


proc javascriptCompile*() =
  build(
    "javascript",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-javascript/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-javascript/master/src/scanner.c")
  )


proc luaCompile*() =
  build(
    "lua",
    Url("https://raw.githubusercontent.com/Azganoth/tree-sitter-lua/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/Azganoth/tree-sitter-lua/master/src/scanner.cc"),
    scannerFile = RelFile("lua_scanner.cc")
  )

# Tree-sitter markdown parser will be added later - it uses ~10 separate files for scanners

# Ocaml parser has strange grammar implementation


proc phpCompile*() =
  build(
    "php",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-php/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-php/master/src/scanner.cc"),
    scannerFile = RelFile("php_scanner.cc")
  )


proc pythonCompile*() =
  build(
    "python",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-python/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-python/master/src/scanner.cc"),
    scannerFile = RelFile("python_scanner.cc")
  )

proc rubyCompile*() =
  build(
    "ruby",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-ruby/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-ruby/master/src/scanner.cc"),
    scannerFile = RelFile("ruby_scanner.cc")
  )

proc rustCompile*() =
  build(
    "rust",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-rust/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-rust/master/src/scanner.c")
  )

proc systemrdlCompile*() =
  build(
    "systemrdl",
    Url("https://raw.githubusercontent.com/SystemRDL/tree-sitter-systemrdl/master/grammar.js")
  )

# Typescript has multiple scanner sources and non-standard grammar directory layout.

proc systemVerilogCompile*() =
  build(
    "systemVerilog",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-verilog/master/grammar.js")
  )

proc vhdlCompile*() =
  build(
    "vhdl",
    Url("https://raw.githubusercontent.com/alemuller/tree-sitter-vhdl/main/grammar.js")
  )

proc vueCompile*() =
  discard
  # FIXME has non-trivial project structure
  # build(
  #   "vue",
  #   Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-vue/master/grammar.js"),
  #   some Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-vue/master/src/scanner.cc"),
  #   scannerFile = RelFile("vue_scanner.cc")
  # )

proc yamlCompile*() =
  discard
  # FIXME multifile scanner

  # build(
  #   "yaml",
  #   Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-yaml/master/grammar.js"),
  #   some Url("https://raw.githubusercontent.com/ikatyang/tree-sitter-yaml/master/src/scanner.cc"),
  #   scannerFile = RelFile("yaml_scanner.cc")
  # )

proc wasmWatCompile*() =
  discard
  # FIXME multifile grammar
  # build(
  #   "wasmWat",
  #   Url("https://raw.githubusercontent.com/wasm-lsp/tree-sitter-wasm/main/wat/grammar.js"),
  # )

proc wasmWastCompile*() =
  discard
  # FIXME multifile grammar
  # build(
  #   "wasmWast",
  #   Url("https://raw.githubusercontent.com/wasm-lsp/tree-sitter-wasm/main/wast/grammar.js")
  # )

proc agdaCompile*() =
  # discard
  # # NOTE broken
  build(
    "agda",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-agda/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-agda/master/src/scanner.cc"),
    scannerFile = RelFile("agda_scanner.cc")
  )

proc haskellCompile*() =
  discard
  # NOTE broken grammar
  # build(
  #   "haskell",
  #   Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-haskell/master/grammar.js"),
  #   some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-haskell/master/src/scanner.cc"),
  #   scannerFile = RelFile("haskell_scanner.cc")
  # )

proc juliaCompile*() =
  build(
    "julia",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-julia/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-julia/master/src/scanner.c")
  )

proc nixCompile*() =
  build(
    "nix",
    Url("https://raw.githubusercontent.com/cstrahan/tree-sitter-nix/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/cstrahan/tree-sitter-nix/master/src/scanner.cc"),
    scannerFile = RelFile("nix_scanner.cc")
  )

proc scalaCompile*() =
  build(
    "scala",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-scala/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-scala/master/src/scanner.c")
  )

proc kotlinCompile*() =
  build(
    "kotlin",
    Url("https://raw.githubusercontent.com/fwcd/tree-sitter-kotlin/master/grammar.js")
  )


proc totalCompile*() =
  let startDir = cwd()
  for pr in [
    tomlCompile,
    cppCompile,
    bashCompile,
    cCompile,
    csharpCompile,
    cssCompile,
    enoCompile,
    embeddedTemplateCompile,
    fennelCompile,
    htmlCompile,
    javaCompile,
    javascriptCompile,
    luaCompile,
    phpCompile,
    pythonCompile,
    rubyCompile,
    rustCompile,
    systemrdlCompile,
    systemVerilogCompile,
    vhdlCompile,
    vueCompile,
    yamlCompile,
    wasmWatCompile,
    wasmWastCompile,
    agdaCompile,
    haskellCompile,
    juliaCompile,
    nixCompile,
    scalaCompile,
    kotlinCompile
  ]:
    cd startDir
    pr()

when isMainModule:
  dispatchMulti(
    [tomlCompile],
    [cppCompile],
    [bashCompile],
    [cCompile],
    [csharpCompile],
    [cssCompile],
    [enoCompile],
    [embeddedTemplateCompile],
    [fennelCompile],
    [htmlCompile],
    [javaCompile],
    [javascriptCompile],
    [luaCompile],
    [phpCompile],
    [pythonCompile],
    [rubyCompile],
    [rustCompile],
    [systemrdlCompile],
    [systemVerilogCompile],
    [vhdlCompile],
    [yamlCompile],
    [vueCompile],
    [wasmWatCompile],
    [wasmWastCompile],
    [agdaCompile],
    [haskellCompile],
    [juliaCompile],
    [nixCompile],
    [scalaCompile],
    [kotlinCompile],

    [totalCompile]
  )
