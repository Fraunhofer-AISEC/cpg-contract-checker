pragma solidity ^0.8.4;

contract Escrow {
    address owner;

    struct Deposit {
        uint256 depositAmount;
        address buyer;
        address seller;}

    constructor() payable {
    owner = msg.sender;}

    Deposit[] public activeDeposits;

    function deposit(address seller) public payable {

        Deposit memory newDeposit = Deposit(

        msg.value,
        msg.sender,
        seller);

    activeDeposits.push(newDeposit);

    function releaseDeposit(uint256 id) public {

        require (msg.sender == activeDeposits[id].buyer,
        "Only maker of the deposit can release deposit.");

        payable(activeDeposits[id].seller).transfer(activeDeposits[id].depositAmount);}
}
