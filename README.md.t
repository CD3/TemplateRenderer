# render-template

`render-template` provides a small python script named `render` that can render stand-alone template files using several different engines.
It is useful for creating simple templates to create configuration files, source code, READMEs, etc.

## Usage

In its simplest uses `render` takes a template file, renders it using the
default template engine (mako), and writes the it to stdout.

```Bash
> cat example.txt.t
\shell{cat examples/demo-example.txt.t}
> uv run render example.txt.t
\shell{uv run render examples/demo-example.txt.t}
```

Several template engines are supported. Use the `-l` option to see a list of all supported
engines.

```Bash
> uv run render -l
\shell{uv run render -l}
```

If a supported engine is not available, you just need to install it.

### YAML files

All template libraries render a template string using a context. The context is just
the set of variables that are available to the template. Some engines, like mako, support
setting variables directly in the template, but others to not.

`render` supports passing a template context to the template as a YAML file. Just given
the name of the context file to the `--context` option.

```Bash
> cat example-2.txt.t
\shell{cat examples/demo-example-2.txt.t}
> cat context.yaml
\shell{cat examples/demo-context.yaml}
> uv run render --context=context.yaml example-2.txt.t
\shell{uv run render --context=examples/demo-context.yaml examples/demo-example-2.txt.t}
```
