#import "/tests/common.typ": project, renmin-ribao as names
#import "/src/lib.typ": tricorder

#let gutter = 1em
#let margin = 2em
#show: project.with(page-width: 4 * (3em + gutter) - gutter + 2 * margin)

#tricorder(columns: auto, column-gutter: gutter, ..names)
