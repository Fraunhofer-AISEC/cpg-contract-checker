pragma solidity ^0.8.8;

import "./Whoopy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract WhoopFactory is Ownable {
    address public implementationContract;
    address instance;

    mapping(address => address[]) public allClones;

    

    event NewClone(address _clone, address _whoopyCreator);

    struct whoopy {
        uint256 index;
        address whoopyCreator;
    }

    mapping(address => whoopy) whoopyList;


    constructor(address _implementation) {
        implementationContract = _implementation;
    }

    function createClone() external {
        address instance = Clones.clone(implementationContract);
        allClones[msg.sender].push(instance);
        Whoopy(instance).initialize(msg.sender);
        emit NewClone(instance, msg.sender);
    }

    function returnClones(address _whoopCreator) external view returns (address[] memory) {
        return allClones[_whoopCreator];
    }

}