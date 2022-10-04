contract Betting {

  address public ac2 = 0xCB87BDB88EEF4ABC66AE6F1A131D41021C145863;
  address public myaccount = this;
  bool public transferStatus = false;

  event Transfer(address _from, uint256 _value);
  event TransferTo(address _to, uint256 _value);

  function Betting() {

  }

  function sendEther() payable returns (uint) {
    return msg.value;
  }

  function () payable {
   Transfer(msg.sender, msg.value);
  }

  function reward() payable returns (bool) {
    transferStatus = ac2.send(0.05 ether);
    TransferTo(ac2, 0.05 ether);
    return transferStatus;
  }
}