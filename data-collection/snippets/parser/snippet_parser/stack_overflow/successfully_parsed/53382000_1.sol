pragma solidity ^0.4.24;

contract dynamicarray { 

    uint public constant MaxNumber = 50;

    uint[] numbers;

    function randomnumber() public returns (uint){
        uint random = uint(keccak256(block.timestamp)) % MaxNumber +1;
        for(uint i = MaxNumber; i > numbers.length; i++){
            numbers.push(random);  
            return  random;
        }
    }

    function getnumbers() public view returns(uint[]){
        return  numbers;
    }
}
