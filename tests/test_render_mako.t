# test mako engine
  $ cat << 'EOF' > test.mako.t
  > Value: ${x}
  > 
  > EOF
  $ cat << 'EOF' > context.yml
  > x: 10
  > 
  > EOF
  $ render --engine mako test.mako.t -c context.yml
  Value: 10
  
  $ rm test.mako.t context.yml
