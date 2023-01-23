  pragma solidity ^0.4.18;

  contract TEST {

  struct Test {
    string a;
    string b;
    string c;
    string d;
    string e;
    string f;
    string g;
    string h;
    string i;
    string j;
    string k;
    string l;
    string m;
  }

  mapping (uint => Test) test;
  uint totalTests;

  function totalTestsCount() view public returns (uint) {
    return totalTests;
  }

  function createTest(string a, string b, string c, string d, string e, string f, string g, string h, string i, string j, string k, string l, string m) public returns (uint) {

    uint test_id = totalTests++;

    test[test_id] = Test(a, b, c, d, e, f, g, h, i, j, k, l, m);

    return test_id;
  } 

  function showTest(uint test_id) view public returns (string, string, string, string, string, string, string, string, string, string, string, string, string){

    Test t_test;
    t_test = test[test_id];

    return (t_test.a, t_test.b, t_test.c, t_test.d, t_test.e, t_test.f, t_test.g, t_test.h, t_test.i, t_test.j, t_test.k, t_test.l, t_test.m);
  } 

}
