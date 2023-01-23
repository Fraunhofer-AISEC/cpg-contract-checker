
pragma solidity ^0.8.4;

import {SafeMath} from "./SafeMath.sol";

contract MetaCoin {
    mapping (address => uint) public balances;
    bool private initialized;

    function initialize(address owner) public {
        require(!initialized, "Contract instance has already been initialized");
        balances[owner] = 100;
    }

    function sendCoin(address receiver, uint amount) public {
        balances[msg.sender] = SafeMath.sub(balances[msg.sender], amount);
        balances[receiver] = SafeMath.add(balances[receiver], amount);
    }

    function getBalance() public view returns (uint){
        return balances[msg.sender];
    }   
}
