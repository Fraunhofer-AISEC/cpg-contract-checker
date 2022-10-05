pragma solidity ^0.4.24;

import './IERC20.sol';

contract TimeLock {
    IERC20 token;

    struct LockBoxStruct {
        address beneficiary;
        uint balance;
        uint releaseTime;
    }

    LockBoxStruct[] public lockBoxStructs; 

    event LogLockBoxDeposit(address sender, uint amount, uint releaseTime);   
    event LogLockBoxWithdrawal(address receiver, uint amount);

    constructor(address tokenContract) public payable {
        token = IERC20(tokenContract);
    }

    function deposit(address beneficiary, uint amount, uint releaseTime) public payable returns(bool success) {
        require(token.transferFrom(msg.sender, address(this), amount));
        LockBoxStruct memory l;
        l.beneficiary = beneficiary;
        l.balance = amount;
        l.releaseTime = releaseTime;
        lockBoxStructs.push(l);
        emit LogLockBoxDeposit(msg.sender, amount, releaseTime);
        return true;
    }

    function withdraw(uint lockBoxNumber) public returns(bool success) {
        LockBoxStruct storage l = lockBoxStructs[lockBoxNumber];
        require(l.beneficiary == msg.sender);
        require(l.releaseTime <= now);
        uint amount = l.balance;
        l.balance = 0;
        emit LogLockBoxWithdrawal(msg.sender, amount);
        require(token.transfer(msg.sender, amount));
        return true;
    }    

}
