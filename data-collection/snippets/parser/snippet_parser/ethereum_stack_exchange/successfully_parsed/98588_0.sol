pragma solidity 0.8.2;

contract TaxedToken {
    
    
    mapping(address => uint) internal balances;
    mapping(address => bool) internal isTokenHolder;
    uint totalTaxedAmount = 0;
    uint totalUniqueUsers = 0;
    uint tax = 10;
    address public owner;
    
    constructor() {
        owner = msg.sender;
        balances[owner] = 100;
        totalUniqueUsers = 1;
    }
    
    function balanceOf(address account) public view returns (uint) {
        return balances[account] + (totalTaxedAmount / totalUniqueUsers);
    }
    
    function transfer(address _to, uint _value) public {
        require(balanceOf(msg.sender) >= _value, "Insuficient funds");
        balances[msg.sender] =  balances[msg.sender] - _value;
        balances[_to] = balances[_to]  + _value - tax;
        if(!isTokenHolder[_to]) {
            isTokenHolder[_to] =  true;
            totalUniqueUsers++;
        }
        totalTaxedAmount += tax;
    }
}
