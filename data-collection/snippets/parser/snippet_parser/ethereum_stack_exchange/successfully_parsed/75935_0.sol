pragma solidity ^0.4.10;

contract SimpleToken {
    mapping(address => uint) public balances;

    function buyToken() payable {
        balances[msg.sender]+=msg.value / 1 ether;
    }

    function sendToken(address _recipient, uint _amount) {
        require(balances[msg.sender]!=0);

        balances[msg.sender]-=_amount;
        balances[_recipient]+=_amount;
    }
}
