pragma solidity >=0.4.22 <0.9.0;

contract Ethereum {
  address private owner = msg.sender;
  
  constructor() {
  }

  function getBalance() public view returns (uint256) {
        
        return owner.balance;
    }

  function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}
