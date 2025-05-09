root := justfile_directory()

# Export env vars for tytanic
export TYPST_ROOT := root
export TYPST_FONT_PATHS := join(root, "fonts")

# List available recipes
default:
  @just --list --unsorted

# Set up the project (typically run after git clone)
setup:
  cd fonts && sha256sum --check fonts.sha256 || ( \
    curl --location --remote-name https://mirrors.cernet.edu.cn/adobe-fonts/source-han-serif/OTF/SimplifiedChinese/SourceHanSerifSC-Regular.otf && \
    curl --location --remote-name https://mirrors.cernet.edu.cn/adobe-fonts/source-han-serif/OTF/SimplifiedChinese/SourceHanSerifSC-Bold.otf && \
    sha256sum --check fonts.sha256 )
  tt util vcs ignore

# Run test suite
test *args:
  tt run {{ args }}

# Update test cases
update *args:
  tt update {{ args }}

# Package the library into the specified destination folder
package target:
  ./scripts/package "{{target}}"

# Install the library with the “@local” prefix
install: (package "@local")

# Install the library with the “@preview” prefix (for pre-release testing)
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# Uninstalls the library from the “@local” prefix
uninstall: (remove "@local")

# Uninstalls the library from the “@preview” prefix (for pre-release testing)
uninstall-preview: (remove "@preview")
