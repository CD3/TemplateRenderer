# test default engine (jinja) and output file naming
  $ cat << EOF > test.txt.t
  > {% set x = 10 %}
  > Value: {{x}}
  > 
  > EOF
  $ render test.txt.t
  
  Value: 10

 
  $ cat << EOF > test.txt.t
  > {% for i in range(3) %}
  > idx: {{i}}
  > {% endfor %}
  > 
  > EOF
  $ render test.txt.t
  
  idx: 0
  
  idx: 1
  
  idx: 2
  

 
  $ cat << EOF > test.txt.t
  > {% for i in range(3) -%}
  > idx: {{i}}
  > {% endfor %}
  > 
  > EOF
  $ render test.txt.t
  idx: 0
  idx: 1
  idx: 2
  

 
  $ cat << EOF > test.txt.t
  > {% set x = 10 -%}
  > Value: {{x}}
  > 
  > EOF
  $ render test.txt.t -o test.txt
  $ ls
  test.txt
  test.txt.t
  $ cat test.txt
  Value: 10


  $ rm *
  $ ls


  $ cat << EOF > test.txt.t
  > Value: {{x}}
  > 
  > EOF
  $ cat << EOF > config.yml
  > template_file: test.txt.t
  > output_file: test.txt
  > context:
  >  x: 10
  > 
  > EOF
  $ ls
  config.yml
  test.txt.t
  $ render --config config.yml
  $ ls
  config.yml
  test.txt
  test.txt.t






