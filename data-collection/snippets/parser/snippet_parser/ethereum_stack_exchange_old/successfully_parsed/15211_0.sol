pragma solidity ^0.4.6;

contract Caller {

  Constant public c;
  Writer public w;

  event LogReturnedValue(uint valueReceived);

  function Caller() {
    c = new Constant();
    w = new Writer();
  }

  

  function callConstant() 
    public
    returns(uint x)
  {
    uint gotVal = c.returnValue();
    LogReturnedValue(gotVal);
    return gotVal;
  }

  function callWriter() 
    public
    returns(uint y)
  {
    uint gotVal = w.returnValue();
    LogReturnedValue(gotVal);
    return gotVal;        
  }
}

contract Constant {

  function returnValue() 
    public
    constant 
    returns(uint X)
  {
    return 1;
  }


  uint public counter;

  function returnValue()
    public
    returns(uint Y)
  {
    counter++;
    return 2;
  }

}
