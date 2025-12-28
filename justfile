# list all tasks
list:
    just --list

# build the distribution
build:
    uv dist-build

# publish the package
publish: build
    uv publish

# render the README
readme:
    expand-macros README.md.t README.md
