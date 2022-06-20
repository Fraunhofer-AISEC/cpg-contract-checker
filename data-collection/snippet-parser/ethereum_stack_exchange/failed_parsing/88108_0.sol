struct test {
  uint x;
}

test[] all;
mappings(uint => test) map;

function bla(){
   test memory structTest = test(5);
   all.push(structTest);
   map[10] = structTest;
}
