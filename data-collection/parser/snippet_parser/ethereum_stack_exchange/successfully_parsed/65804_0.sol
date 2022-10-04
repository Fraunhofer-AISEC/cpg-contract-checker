pragma solidity >= 0.4.22;

contract reg{
  address owner;
  uint256 regFee = 2 ether;
  address[] private registered;
  uint a = 0;

  mapping (address => uint256) public balance;

  constructor() public{
    owner = msg.sender;
    regFee = 2 ether;
  }

  event registeration(address indexed _to);

  
  
  
  
  

  function () payable external{
    balance[(msg.sender)] -= 2 ether;
    balance[address(this)] += 2 ether;
    registered.push(msg.sender);
    a++;
    emit registeration(msg.sender);
  }

  function list() public view returns(address, address, address){
    return (registered[0], registered[1], registered[2]);
  }
}
