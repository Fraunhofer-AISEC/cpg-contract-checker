contract parseBytes {
  bytes test = "\x20\x00\x10";
  function f() {
    assembly{
        test 
        pop 
    }
  }
}
