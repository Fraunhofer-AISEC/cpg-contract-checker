pragma solidity ^0.4.0;
contract MyCoin {

    string name;
    string symbol;
    uint decimals;
    uint256 totalSupply;
    uint balance;

    mapping (address => uint) blanceOf;

    function MyCoin(uint256 coinAmount) {
        name = "MyCoin";
        symbol = "MC";
        decimals = 18;
        totalSupply = coinAmount;
        balanceOf[msg.sender] = coinAmount;
    }

    function getBalance(address addr) constant returns(uint256) {
        return balanceOf[addr];
    }
}
