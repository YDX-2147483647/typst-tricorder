#import "/tests/common.typ": project, age-of-awakening-cast as names
#import "/src/lib.typ": tricorder

#let gutter = 2em
#let n = 7
#show: project.with(page-width: n * 3em + (n - 1) * gutter)

#tricorder(columns: auto, column-gutter: gutter, ..names)
#pagebreak()
#tricorder(columns: n, column-gutter: gutter, ..names)
