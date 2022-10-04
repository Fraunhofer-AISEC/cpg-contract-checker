pragma solidity ^0.5.0;

contract CheckBehavior {

    mapping(address => uint256) _deposits;

    function depo() public payable{
        _deposits[msg.sender]= msg.value;
    }

    function checkBalance() public returns (uint) {
        return address(this).balance;
    }

    function withdrawA(uint256 _amt) public {

        msg.sender.transfer(_amt);
    }

    function withdrawB(address payable payee, uint256 _amt) public {

        payee.transfer(_amt);
    }

    function withdrawWithGas(address payable payee) public {
        uint256 payment = _deposits[payee];

        _deposits[payee] = 0;

        payee.transfer(payment);
    }
}
