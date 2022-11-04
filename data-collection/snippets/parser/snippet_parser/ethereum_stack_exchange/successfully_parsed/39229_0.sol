pragma solidity ^0.4.17;

contract one{
    uint firstNum;
    uint secondNum;
    uint thirdNum;
    function getNumber(uint _num, uint _num2,uint _num3) public{
       firstNum = _num;
       secondNum = _num2;
       thirdNum = _num3;
    }
}

contract two{
    uint firstNum;
    uint secondNum;
    uint thirdNum;
    function getNumber(uint[3] numValues) public{
       firstNum = numValues[0];
       secondNum =numValues[1];
       thirdNum = numValues[2];
    }
}
