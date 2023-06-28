struct A {
  mapping (uint => uint) map;
}
A private a;
function foo () public {
  a.map[5]=7;
  delete a;
  assert (a.map[5]==7); 
}
