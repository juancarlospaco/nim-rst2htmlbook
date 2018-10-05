import strutils, os
include "book_template.html" # Main Index HTML Template for the Book.

const page_separator* = """
-----
"""  ## Separate the pages of the book using this horizontal line.

let
  rst_file* = paramStr(1).string.strip  ## RestructuredText source file.
  rst_body* = readFile(rst_file).strip  ## RestructuredText contents.

proc main*() =
  ## Takes file path to RestructuredText source file and render HTML book static page.
  writeFile(
    rst_file & ".html",
    writeHTMLPage(rst_file.replace(".rst", ""),
    rst_body.split(page_separator))
  )

when isMainModule:
  main()
