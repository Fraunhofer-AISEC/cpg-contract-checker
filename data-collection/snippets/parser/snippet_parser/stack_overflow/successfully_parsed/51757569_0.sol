struct Test {
  uint ui;
  string s;
}
function test(Test t) public {
  emit Log(t.ui, t.s);
}
