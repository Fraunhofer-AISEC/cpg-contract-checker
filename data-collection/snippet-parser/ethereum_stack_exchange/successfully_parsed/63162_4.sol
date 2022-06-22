import "./B.sol";

contract A {

  address[] public bList;
  event LogNewB(address creator, address contractB);

  function createB() public returns(address contractB) {
    B b = new B();
    emit LogNewB(msg.sender, b);
    bList.push(b);
    return address(b);
  }
}