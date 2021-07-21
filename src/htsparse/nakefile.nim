import hparse/htreesitter/hts_wrapgen
import
  hmisc/other/[oswrap, hlogger, hargparse],
  hmisc/algo/[halgorithm, clformat]

import std/[uri, options, httpclient, strutils, sequtils, strformat]

# let rawgh = "https://raw.githubusercontent.com/"

var logger: HLogger

proc build*(
    lang: string,
    grammarUrl: Url,
    scannerUrl: Option[Url] = none(Url),
    scannerFile: RelFile = RelFile(lang & "_scanner.c"),
    parserOut: RelFile = RelFile(lang & "_parser.c")
  ) =
  mkDir RelDir(lang)
  cd RelDir(lang)
  logger.debug lang
  grammarFromUrl(
    grammarUrl  = grammarUrl,
    scannerUrl  = scannerUrl,
    scannerFile = scannerFile,
    parserOut   = parserOut,
    l           = logger,
    testLink = false
  )

proc build*(
    lang: string,
    downUrls: seq[(Url, RelFile)],
    scannerMain: Option[RelFile],
    grammarJs: FsFile,
    buildDir: Option[RelDir] = none(RelDir),
    parserOut: RelFile = RelFile(lang & "_parser.c")
  ) =

  mkDir RelDir(lang)
  cd RelDir(lang)
  logger.debug lang
  let client = newHttpClient()
  var extraFiles: seq[(AbsFile, RelFile)]
  for (url, file) in downUrls:
    logger.info "Downloaded", url.string, "to", file
    mkDir file.parentDir()
    client.downloadFile(url.string, file.getStr())
    extraFiles.add((file.toAbsFile(), file))


  grammarFromFile(
    langPrefix  = lang,
    grammarJs   = grammarJs,
    scannerFile = scannerMain,
    parserOut   = some(parserOut),
    extraFiles  = extraFiles,
    l           = logger,
    testLink = false
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
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-embedded-template/master/grammar.js")
  )

proc fennelCompile*() =
  build("fennel",
    Url("https://raw.githubusercontent.com/TravonteD/tree-sitter-fennel/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/TravonteD/tree-sitter-fennel/master/src/scanner.c"),
  )

proc goCompile*() =
  build("go",
    Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-go/master/grammar.js")
  )

proc htmlCompile*() =
  # FIXME html has multifile scanner
  build(
    lang = "html",
    scannerMain = some RelFile("scanner.cc"),
    grammarJs = RelFile "grammar.js",
    downUrls = @[
      (
        Url "https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/grammar.js",
        RelFile "grammar.js"
      ),
      (
        Url "https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/src/scanner.cc",
        RelFile "scanner.cc"
      ),
      (
        Url "https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/src/tag.h",
        RelFile "tag.h"
      )
    ],

    # copyFile = @[RelFile "scanner.cc", Rel]
  )
  # build(
  #   "html",
  #   Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/grammar.js"),
  #   some Url("https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/src/scanner.cc"),
  #   scannerFile = RelFile("html_scanner.cc")
  # )

proc latexCompile*() =
  let urlPrefix = "https://raw.githubusercontent.com/haxscramper/tree-sitter-latex/master/"
  var downUrls: seq[(Url, RelFile)]
  for entry in @[
    "grammar.js",
    "src/catcode.cc",
    "src/catcode.hh",
    "src/scanner.cc",
    "src/scanner.hh",
    "src/scanner_control_sequences.cc",
    "src/scanner_environments.cc",
    "src/scanner_keywords.cc",
    "src/scanner_names.cc",
    "src/serialization.hh",
    "grammar/luatex/luatexbase/luatexbase-sty.js",
    "grammar/lualatex/luacode/luacode-sty.js",
    "grammar/latex/tools/verbatim-sty.js",
    "grammar/latex/tools/varioref-sty.js",
    "grammar/latex/tabu/tabu-sty.js",
    "grammar/latex/pgf/frontendlayer/tikz-sty.js",
    "grammar/latex/minted/minted-sty.js",
    "grammar/latex/listings/listings-sty.js",
    "grammar/latex/l3kernel/expl3-sty.js",
    "grammar/latex/hyperref/hyperref-sty.js",
    "grammar/latex/gnuplotex/gnuplotex-sty.js",
    "grammar/latex/glossaries/base/glossaries-sty.js",
    "grammar/latex/filecontents/filecontents-sty.js",
    "grammar/latex/fancyvrb/fancyvrb-sty.js",
    "grammar/latex/fancyref/fancyref-sty.js",
    "grammar/latex/breqn/breqn-sty.js",
    "grammar/latex/biblatex/biblatex-sty.js",
    "grammar/latex/base/shortvrb-sty.js",
    "grammar/latex/base/latex-ltx.js",
    "grammar/latex/base/doc-sty.js",
    "grammar/latex/amsmath/amsmath-sty.js",
    "grammar/initex.js",
  ]:
    let file =
      if entry.endsWith("cc"):
        RelFile(entry).withBasePrefix("latex_")

      else:
        RelFile(entry)

    downUrls.add((Url urlPrefix & entry, file))


  if RelDir("latex").exists:
    logger.info "Directory cleanup"
    for file in RelDir("latex").walkDir(RelFile):
      if file != RelFile("latex.nim"):
        logger.debug "Removing", file
        rmFile file


  build(
    lang = "latex",
    scannerMain = some RelFile("src/scanner.cc"),
    grammarJs = RelFile "grammar.js",
    downUrls = downUrls
  )

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
    Url("https://raw.githubusercontent.com/cstrahan/tree-sitter-nix/master/grammar.js")
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

proc zigCompile*() =
  build(
    "zig",
    Url("https://raw.githubusercontent.com/GrayJack/tree-sitter-zig/master/grammar.js")
  )

proc dartCompile*() =
  build(
    "dart",
    Url("https://raw.githubusercontent.com/UserNobody14/tree-sitter-dart/master/grammar.js"),
    some Url("https://raw.githubusercontent.com/UserNobody14/tree-sitter-dart/master/src/scanner.c")
  )
type
  Lang = enum
    lTotal = "total"

    lToml             = "toml"
    lCpp              = "cpp"
    lBash             = "bash"
    lC                = "c"
    lCsharp           = "csharp"
    lCss              = "css"
    lEno              = "eno"
    lEmbeddedTemplate = "embeddedTemplate"
    lGo               = "go"
    lFennel           = "fennel"
    lHtml             = "html"
    lLatex            = "latex"
    lJava             = "java"
    lJavascript       = "javascrip"
    lLua              = "lua"
    lPhp              = "php"
    lPython           = "python"
    lRuby             = "ruby"
    lRust             = "rust"
    lSystemrdl        = "systemrdl"
    lSystemVerilog    = "systemVer"
    lVhdl             = "vhdl"
    lVue              = "vue"
    lYaml             = "yaml"
    lWasmWat          = "wasmWat"
    lWasmWast         = "wasmWast"
    lAgda             = "agda"
    lHaskell          = "haskell"
    lJulia            = "julia"
    lNix              = "nix"
    lScala            = "scala"
    lKotlin           = "kotlin"
    lZig              = "zig"
    lDart             = "dart"

proc toClosure*(arg: proc() {.nimcall.}): proc() {.closure.} = arg

func toCbMapArray*[K; Cb: proc](map: openarray[(K, Cb)]): auto =
  var tmp: array[K, typeof(toClosure(map[0][1]))]
  for (k, v) in map:
    tmp[k] = toClosure(v)

  return tmp

proc compile*(lang: Lang) =
  var list = toCbMapArray {
    lToml: tomlCompile,
    lCpp: cppCompile,
    lBash: bashCompile,
    lC: cCompile,
    lCsharp: csharpCompile,
    lCss: cssCompile,
    lEno: enoCompile,
    lEmbeddedTemplate: embeddedTemplateCompile,
    lGo: goCompile,
    lFennel: fennelCompile,
    lHtml: htmlCompile,
    lLatex: latexCompile,
    lJava: javaCompile,
    # : # javascriptCompile,
    lLua: luaCompile,
    lPhp: phpCompile,
    lPython: pythonCompile,
    lRuby: rubyCompile,
    lRust: rustCompile,
    lSystemrdl: systemrdlCompile,
    lSystemVerilog: systemVerilogCompile,
    lVhdl: vhdlCompile,
    lVue: vueCompile,
    lYaml: yamlCompile,
    lWasmWat: wasmWatCompile,
    lWasmWast: wasmWastCompile,
    lAgda: agdaCompile,
    lHaskell: haskellCompile,
    lJulia: juliaCompile,
    lNix: nixCompile,
    lScala: scalaCompile,
    lKotlin: kotlinCompile,
    lZig: zigCompile,
    lDart: dartCompile
  }

  list[lTotal] = proc() =
    let startDir = cwd()
    var fail: seq[Lang]
    for lang, pr in list:
      if lang != lTotal and not isNil(pr):
        try:
          cd startDir
          pr()

        except:
          fail.add lang


    if fail.len > 0:
      logger.err "Failed wrapper generator for", joinWords(
        mapIt(fail, $it), "and")

  list[lang]()

proc newApp*(): CliApp =
  result = newCliApp(
    "nakefile", (0, 1, 4), "haxscramper",
    "Generate nim wrappers for tree-sitter grammars",
    noDefault = cliDefaultHelpOnly)

  result.add arg("lang", "Target language to compile", check = cliCheckFor(
    Lang, toMapArray mapIt(Lang, (it, ""))))

proc main*(args: seq[string], inLogger: HLogger = newTermLogger()) =
  var app = newApp()
  logger = inLogger
  app.acceptArgsAndRunBody(logger, args):
    compile(app.getArg() as Lang)

when isMainModule:
  main(paramStrs())
