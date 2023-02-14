event transfer.balance[msg.sender] = safeSub(balances[msg.sender], tokens);

 
pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0-solc-0.7/contracts/token/ERC20/ERC20.sol";

    
    
    
contract Token is ERC20 {

    constructor () ERC20("", "") {
        _mint(msg.sender, 4000000 * (10 ** uint256(decimals())));
}
    address payable public owner;
  
uint256 public max_contribution = 50 ether; 
uint256 public min_contribution = 0.1 ether; 

function transfer(address to, uint tokens) public payable returns (bool success) {
    require(msg.value >= min_contribution);
    require(msg.value <= max_contribution);
    event transfer.balance[msg.sender] = safeSub(balances[msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens);
    emit Transfer(msg.sender, to, tokens);
    return true;

    }
}
