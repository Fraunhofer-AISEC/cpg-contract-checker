pragma solidity >=0.4.25 <0.6.0;

import "./ConvertLib.sol";






contract MetaCoin {


    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply

    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() public {


        symbol = "MTC";
        name = "MetaCoin Example Token";
        decimals = 18;
        _totalSupply = 10000 * 10**uint(decimals);  
        balances[tx.origin] = _totalSupply;
    }

    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) public view returns(uint){
        return ConvertLib.convert(getBalance(addr),2);
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }
}
