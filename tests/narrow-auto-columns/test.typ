#import "/tests/common.typ": project, renmin-ribao as names
#import "/src/lib.typ": tricorder

#let gutter = 1em
#show: project.with(page-width: 4 * (3em + gutter) - gutter)

#tricorder(columns: auto, column-gutter: gutter, ..names)
