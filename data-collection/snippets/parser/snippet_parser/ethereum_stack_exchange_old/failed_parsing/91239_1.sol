mapping(address => uint256) public withdrawableBalance;

function myfunction() external {
  address payable address1 = 0x....;
  address payable address2 = 0x....;
            
  withdrawableBalance[address1] += 1 ether;
  withdrawableBalance[address2] += 1 ether;
}

function withdraw() external {
  uint256 bal = withdrawableBalance[msg.sender];
  withdrawableBalance[msg.sender] = 0;
  msg.sender.transfer(bal);
}
