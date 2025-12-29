# test mustache engine
  $ cat << EOF > test.mustache.t
  > Value: {{x}}
  > 
  > EOF
  $ cat << EOF > context.yml
  > x: 10
  > 
  > EOF
  $ render --engine mustache test.mustache.t -c context.yml
  Value: 10
  
  $ rm test.mustache.t context.yml
