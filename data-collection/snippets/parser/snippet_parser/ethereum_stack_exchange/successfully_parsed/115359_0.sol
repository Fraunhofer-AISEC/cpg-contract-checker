pragma solidity ^0.4.24; 

contract CrowdSale{

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) public {
        require(msg.sender == owner);
        to.transfer(amount);
    }

    mapping (address => uint) balances;

    function () external payable {
        if(msg.value < 100000000000000000) {
            revert("Minimum contribution: 0.1 BNB"); 
        } 
        else if(msg.value > 2000000000000000000) {
            revert("Maximum contribution: 2 BNB"); 
        }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }

}
