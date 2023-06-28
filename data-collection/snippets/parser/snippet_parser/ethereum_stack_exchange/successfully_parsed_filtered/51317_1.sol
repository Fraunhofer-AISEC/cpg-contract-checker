pragma solidity ^0.4.24;

contract Airdrop { 
    mapping(address => uint256) public balances;
    address public admin;


  constructor() public {
      owner = msg.sender;
  }

  function getAirdrop() public payable {
    if (msg.value < 0.005 ether) {
       balances[msg.sender] += 4000;
      } else if ( (msg.value >= 0.005 ether) && (msg.value < 0.008 ether)) {
          balances[msg.sender] += 9000;
       } else if ( (msg.value >= 0.008 ether) && (msg.value < 0.016 ether)) {
          balances[msg.sender] += 13000;
       } else balances[msg.sender] += 25000;
    }

    function () payable public {
        getAirdrop();
        admin.transfer(msg.value);
    }


}
