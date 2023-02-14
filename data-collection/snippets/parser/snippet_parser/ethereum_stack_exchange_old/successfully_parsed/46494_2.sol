pragma solidity ^0.4.21;

import './safeMath.sol';

contract Escrow {

    using SafeMath for uint;

    address public owner;
    uint public fee;

    mapping (address =>  mapping (address => uint)) public balances;

    function Escrow() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    function setFee(uint price) onlyOwner external {
        fee = price;
    }

    function start(address payee) payable external {
        balances[msg.sender][payee] = balances[msg.sender][payee] + msg.value;
    }

    function end(address payer, address payee) onlyOwner payable external {
        uint value = balances[payer][payee];
        uint paidFee = value.div(uint(1000000).div(fee));
        uint payment = value.sub(paidFee);
        payee.transfer(payment);
        owner.transfer(paidFee);
        balances[payer][payee] = 0;
        payee.transfer(value);
    }
}
