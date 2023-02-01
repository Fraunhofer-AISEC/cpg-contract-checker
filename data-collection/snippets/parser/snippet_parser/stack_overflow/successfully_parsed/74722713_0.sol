pragma solidity ^0.8.4;

contract DepositsWithIds {
    address owner;

    struct Deposit {
        uint256 depositAmount;
        address depositor;
        uint256 counter;
    }

    constructor() payable {
    owner = msg.sender;
    }
  
    Deposit[] public activeDeposits;

    event DepositMade(address, uint256, uint256);

    function deposit() public payable returns (uint256 counter) {

        return ++counter;

        Deposit memory newDeposit = Deposit(

        msg.value,
        msg.sender,
        counter
    );

    activeDeposits.push(newDeposit);

    emit DepositMade(msg.sender, msg.value, counter);

    }
}
