# TemplateRenderer

`TemplateRenderer` provides a small python script named `render.py` that can render stand-alone template files using several different engines.
It is useful for creating simple templates to create configuration files, source code, READMEs, etc.

## Usage

In its simplest uses `render.py` takes a template file, renders it using the
default template engine (mako), and writes the it to stdout.

```Bash
> cat example.txt.t
<%
 lengths = [ 1.1, 1.2, 1.0, 1.2 ]
%>
Measurements:
% for l in lengths:
  ${l} cm
% endfor

Avg: ${ sum(lengths)/len(lengths) } cm

> render.py example.txt.t

Measurements:
  1.1 cm
  1.2 cm
  1.0 cm
  1.2 cm

Avg: 1.125 cm

```

Several template engines are supported. Use the `-l` option to see a list of all supported
engines.

```Bash
> render.py -l
    engine available?          
=========================
      mako yes                 
     jinja yes                 
    wheezy no                  
 ctemplate no                  
   Tempita yes                 
  pyratemp no                  

```

If a supported engine is not available, you just need to install it.

### YAML files

All template libraries render a template string using a context. The context is just
the set of variables that are available to the template. Some engines, like mako, support
setting variables directly in the template, but others to not.

`render.py` supports passing a template context to the template as a YAML file. Just given
the name of the context file to the `--context` option.

```Bash
> cat example-2.txt.t
% for Name in Names:
Hi! My name is ${Name['First']} ${Name['Last']}.
% endfor

> cat context.yaml
Names:
  - First: John
    Last: Doe
  - First: Rusty
    Last: Shacklford

> render.py --context=context.yaml example-2.txt.t
Hi! My name is John Doe.
Hi! My name is Rusty Shacklford.

```
