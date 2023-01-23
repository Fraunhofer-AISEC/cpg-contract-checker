pragma solidity ^0.8.8;

import "@openzeppelin/contracts/proxy/Clones.sol";


contract WhoopyFactory {
    address public implementationContract;

    address[] public allClones;

    event NewClone(address indexed _instance);

    mapping(address => address) public whoopyList;

    constructor(address _implementation) {
        implementationContract = _implementation;
    }

    function createClone(address _whoopyCreator) payable external returns (address instance) {
        instance = Clones.clone(implementationContract);
        (bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address)", _whoopyCreator));
        require(success==true, "initialize did not return true");
        allClones.push(instance);
        whoopyList[_whoopyCreator] = instance;
        emit NewClone(instance);
        return instance;
    }
}