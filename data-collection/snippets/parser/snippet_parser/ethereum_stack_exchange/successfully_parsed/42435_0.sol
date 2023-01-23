pragma solidity ^0.4.17;

contract CommunityChest {
    function withdraw() public {
        msg.sender.transfer(this.balance);
    }

    function deposit(uint256 amount) payable public {
        require(msg.value == amount);
        
    }

    function getBalance() public view returns (uint256) {
        return this.balance;
    } 
}
