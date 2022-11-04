contract Hub {

  Spoke public A;
  Spoke public B;

  event LogTXNSent(address spoke);

  function Hub() {
    A = new Spoke();
    B = new Spoke();
  }

  function local(address spokeAddress)
    public
    returns(bool success)
  {
    if(spokeAddress != address(A) && spokeAddress != address(B)) throw;
    if(!Spoke(spokeAddress).logEvent()) throw;
    LogTXNSent(spokeAddress);
    return true;
  }

}

contract Spoke {

  event LogTXNFrom(address sender);

  function logEvent()
    public
    returns(bool success)
  {
    LogTXNFrom(msg.sender);
    return true;
  }
}
