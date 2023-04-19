


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract TokenDistributor {
    using SafeMath for uint;

    
    address  public tokenContractAddress = 0xA970cAE9Fa1D7Cca913b7C19DF45BF33d55384A9;

    
    mapping(address => uint) public balances;

    
    address [] public senderAddresses;

    
    event NewSender(address sender, uint balance);

    
    bool public distributing;

    
    function deposit() external payable {
        
        require(msg.sender == tokenContractAddress, "Incoming deposit must come from the specified token contract");

        
        require(msg.value > 0, "Invalid deposit amount");

        
        balances[msg.sender] = balances[msg.sender].add(msg.value);

        
        senderAddresses.push(msg.sender);

        
        emit NewSender(msg.sender, msg.value);
    }

    
    function distribute() external {
        
        require(!distributing, "Distribution already in progress");

        
        distributing = true;

        
        uint totalSupply = tokenContractAddress.balance;

        
        require(senderAddresses.length > 0, "No sender addresses");

        
        uint tokenAmount = totalSupply.div(senderAddresses.length);

        
        for (uint i = 0; i < senderAddresses.length; i++) {
            tokenContractAddress.transfer(senderAddresses[i], tokenAmount);
        }

        
        distributing = false;
    }
}
