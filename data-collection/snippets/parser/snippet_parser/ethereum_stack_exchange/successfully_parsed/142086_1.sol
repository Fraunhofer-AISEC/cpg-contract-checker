
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RaffleProxyFactory is Ownable {
    address public implementationContract;

    address[] public allClones;

    event NewClone(address _clone);

    constructor(address _implementation) {
        implementationContract = _implementation;
    }

    function createNewRaffle(uint256 _ticketPrice) payable external returns(address instance) {
        instance = Clones.clone(implementationContract);
        (bool success, ) = instance.call{value: msg.value} (abi.encodeWithSignature("initialize(uint256,address)", _ticketPrice, msg.sender));
        allClones.push(instance);
        emit NewClone(instance);
        return instance;
    }
}
