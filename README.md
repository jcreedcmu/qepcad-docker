qepcad-docker
-------------

Just a quick little dockerfile to do a hermetic build of
[qepcad](https://www.usna.edu/Users/cs/wcbrown/qepcad/B/QEPCAD.html),
"Quantifier Elimination by Partial Cylindrical Algebraic Decomposition"
The cmake file comes from [here](https://github.com/PetterS/qepcad).

What I did to run was:
```shell
make build
make debug
```
then, inside docker shell:
```shell
cd bin # so that qepcad.help is in cwd
# Make an input file
cat <<"EOF" >input.txt
[ This is the ever-popular "X Axis Ellipse" problem ]
(a,b,c,x,y)
3
Enter a prenex formula:
(A x)(A y)[ a > 0 /\ b > 0 /\ [
  [ b^2 (x - c)^2 + a^2 y^2 - a^2 b^2 = 0] ==>
  x^2 + y^2 - 1 <= 0
] ].
finish
EOF
./qepcad <input.txt
```
