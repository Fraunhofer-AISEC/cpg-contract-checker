contract Caller {

  test public t;

  function Caller() {
    t = new test();
  }

  function callIt(address theAddress)
    public
    returns(bool success)
  {
    t = test(t); <===== here the other contract address can be called t = test([OtherContractAddress]); example: test(0x12345);
    bool result = t.FunctionX(theAddress);
    return result;
  }
}

contract test { 

  mapping (address => uint256) public balanceOf; 

  function FunctionX(address _address) public returns(bool success)
  {
    balanceOf[_address] = 50000; 
    return true;
  }
}
