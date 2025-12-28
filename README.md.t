# render-template

`render-template` provides a small python script named `render` that can render stand-alone template files using several different engines.
It is useful for creating simple templates to create configuration files, source code, READMEs, etc.

## Usage

In its simplest uses `render` takes a template file, renders it using the
default template engine (jinja), and writes the it to stdout.

```Bash
> cat examples/demo-jinja-example.txt.t
\shell{cat examples/demo-jinja-example.txt.t}
> render example.txt.t
\shell{uv run render examples/demo-jinja-example.txt.t}
```

Several template engines are supported. Use the `-l` option to see a list of all supported
engines.

```Bash
> render -l
\shell{uv run render -l}
```

If a supported engine is not available, you just need to install it.

### Other Engines

Other engines can be used by specifying the `--engine` option. For example, to use the `mako` engine:
```Bash
> cat examples/demo-mako-example.txt.t
\shell{cat examples/demo-mako-example.txt.t}
> render --engine=mako examples/demo-mako-example.txt.t
\shell{uv run render --engine=mako examples/demo-mako-example.txt.t}
```

### YAML files

All template libraries render a template string using a context. The context is just
the set of variables that are available to the template. Some engines, like mako, support
setting variables directly in the template, but others to not.

`render` supports passing a template context to the template as a YAML file. Just given
the name of the context file to the `--context` option.

```Bash
> cat examples/demo-jinja-example-2.txt.t
\shell{cat examples/demo-jinja-example-2.txt.t}
> cat context.yaml
\shell{cat examples/demo-context.yaml}
> render --context=context.yaml example-2.txt.t
\shell{uv run render --context=examples/demo-context.yaml examples/demo-jinja-example-2.txt.t}
```
The output of the command is:
```
Hi! My name is John Doe.

Hi! My name is Rusty Shacklford.
```

