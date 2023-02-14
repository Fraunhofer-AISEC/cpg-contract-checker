contract Test {
  int a=999;
  function doIt() {
    assembly {
    sload(a);
    }
 }
}
