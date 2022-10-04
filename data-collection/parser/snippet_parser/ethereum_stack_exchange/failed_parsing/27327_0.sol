pragma solidity ^0.4.11;
Contract TestArray{
    uint[] public numbers;
    function addNumber(uint number){
        numbers.push(number);
    }
