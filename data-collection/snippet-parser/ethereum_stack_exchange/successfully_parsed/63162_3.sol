import "./B.sol";

contract A {

  event LogNewB(address creator, address contractB);

  function createB() public returns(address contractB) {
    B b = new B();
    emit LogNewB(msg.sender, b);
    return address(b);
  }
}