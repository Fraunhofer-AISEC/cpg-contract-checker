
pragma solidity ^0.8.9;
contract Token{
    string public name = "HARDHAT TESTING";
    string public symbol = "HHH";
    uint256 public totalsupply = 10000;
    mapping(address=>uint256) balances;
    address owner;
    constructor()
    {
        balances[msg.sender] = totalsupply;
        owner = msg.sender;
    }
    function balanceof(address _to,uint256 amount) external {
        require(balances[msg.sender] > amount,"not enought tokens");
        balances[msg.sender] -=amount;
        balances[_to] +=amount;
    }
    function showbalance(address account) external view returns(uint256)
    {
        return balances[account];
    }
}
