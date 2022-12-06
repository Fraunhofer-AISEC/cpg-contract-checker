pragma solidity ^0.5.7;
contract NumberContract2{

uint256 number;

event newNumberStored(uint256 number);
event calledRequestNumberFunction();

function storeNumber(uint256 num) public
{
    number = num;
    emit newNumberStored(num);
}

function requestNumber() public returns (uint256)
{
    emit calledRequestNumberFunction();
    return number;
}
}