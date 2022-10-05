pragma solidity ^0.4.18;

contract RegisterContract {

    uint public contractWeight;

    mapping(bytes32=>string) public contracts;
    bytes32[] public myHashes;

    event LogAddContract(address sender, bytes32 hashKey, string jsonInput);
    event LogAddWeight(address sender, uint weight);

    function addContract ( string jsonInput, bytes32 hashKey) public {
        contracts[hashKey] = jsonInput;
        myHashes.push(hashKey);
        LogAddContract(msg.sender, hashKey, jsonInput);
     }

    function addWeight (uint weight) public {
        contractWeight = weight;
        LogAddWeight(msg.sender, weight);
    }

    function () payable public {
    }

}
