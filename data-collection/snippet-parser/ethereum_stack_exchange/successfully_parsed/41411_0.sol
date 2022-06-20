pragma solidity ^0.4.18;

import "./ConvertLib.sol";

contract MetaCoin {
    mapping (address => uint) balances;

    event Transfer(address _from, address _to, uint256 _value);

    function MetaCoin() public {
        balances[tx.origin] = 10000;
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }

    function getBalanceInEth(address addr) public view returns(uint) {
        return ConvertLib.convert(getBalance(addr), 2);
    }   

    function deposit() payable {
        balances[msg.sender] += msg.value;
    }

    function deposit(uint amount) payable {
        balances[msg.sender] += amount;
    }

    function deposit(address addr) payable {
        balances[addr] += msg.value;
    }               
}
