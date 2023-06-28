import "dapple/test.sol";

contract A {
    bool aHit;
    bool public aPublicHit;
    bool public aConstructorArg;
    bool cHit;

    function A(bool _aConstructorArg) {
      aHit = true;
      aPublicHit = true;
      aConstructorArg = _aConstructorArg;
    }
}

contract B is A(true) {
    bool bHit;
    bool public bConstructorArg;
    function B(bool _bConstructorArg) {
      bHit = true;
      bConstructorArg = _bConstructorArg;
    }
    function checkA() returns (bool) {
      return aHit;
    }
    function checkB() returns (bool) {
      return bHit;
    }
    function checkC() returns (bool) {
      return cHit;
    }
}

contract T is Test {

  function testConstructor() {
    B b = new B(true);
    
    
    
    
    
    
  }

}
