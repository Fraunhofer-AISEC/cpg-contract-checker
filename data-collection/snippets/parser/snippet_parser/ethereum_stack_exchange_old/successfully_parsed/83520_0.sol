pragma solidity >=0.4.22 <0.7.0;

interface InterfaceToken {
    function invest(address contributor) external payable;
}

contract Token {
    string public name = "Token";
    string public symbol = "TKN";
    uint public decimals = 0;
    uint tokenPrice = 1000000000000000;

    uint public supply;
    address public founder;
    address payable public deposit;

    mapping(address => uint) public balances;

    constructor(address payable _deposit, address _founder) public{
        supply = 300000;
        deposit = _deposit;
        founder = _founder;
        balances[founder] = supply;
    }

    function invest(address contributor) public payable {
        uint tokens = msg.value / tokenPrice;

        balances[contributor] += tokens;
        balances[founder] -= tokens;

        deposit.transfer(msg.value);
    }
}
