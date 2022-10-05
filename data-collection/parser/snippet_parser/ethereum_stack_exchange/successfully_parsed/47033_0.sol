pragma solidity ^0.4.18;
contract Project{
    bytes32[] array;

    function addValue(bytes32 element)public{
        
        array.push(element);
    }

    function getAll()view public returns(bytes32[]){
        return array;
    }
}
