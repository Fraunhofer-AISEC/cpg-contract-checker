
pragma solidity ^0.8.0;

import "./erc20.sol";

contract MyEscrow {

    mapping(address => mapping(address => uint256)) public _deposits;
    address payable payee = payable(msg.sender);
    MyToken token;

    constructor(address _myToken) {
        token = MyToken(_myToken); 
    }

    function deposit(uint256 amount) public payable {
        token.transferFrom(msg.sender, address(this), amount);
        _deposits[payee][address(token)] += amount;
    }

    function depositsOf() public view returns (uint256) {
        return _deposits[payee][address(token)];
    }

    function withdraw(uint256 payment) public payable {
        _deposits[payee][address(token)] -= payment;
        token.transfer(msg.sender, payment);
    }
}
