pragma solidity ^0.4.18;

contract RegisterContract {

    uint public contractWeight;
    mapping(bytes32=>string) public contracts;

    function addContract ( string jsonInput, bytes32 hashKey) public {
        contracts[hashKey] = jsonInput;
    }

    function addWeight (uint weight) public {
        contractWeight = weight;
    }
}
