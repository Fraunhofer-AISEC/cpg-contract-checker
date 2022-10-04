function test() {
  bytes1 variable1 = app.myVar();
  bytes1 a = 0x01;
  assertEq1(variable1, a);
}
