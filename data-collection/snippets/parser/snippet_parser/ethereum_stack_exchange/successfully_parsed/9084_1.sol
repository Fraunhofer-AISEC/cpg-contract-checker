function test() {
  bytes1 variable1 = App(proxy_tester).myVar();
  bytes1 a = 0x01;
  assertEq1(variable1, a);
}
