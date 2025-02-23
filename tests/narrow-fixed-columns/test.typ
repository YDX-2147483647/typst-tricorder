#import "/tests/common.typ": project, renmin-ribao as names
#import "/src/lib.typ": tricorder

#show: project.with(page-width: auto)

#tricorder(columns: 4, ..names)
