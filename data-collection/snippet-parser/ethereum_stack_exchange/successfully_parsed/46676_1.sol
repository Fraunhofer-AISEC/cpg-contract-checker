pragma solidity ^0.4.19;

import "./EggFactory.sol";

contract EggHatching is EggFactory{

    uint hatchTime = 1 days;

    function hatchEgg(uint eggId) public {
        require(msg.sender == eggToOwner[eggId]);
        require(hasHatched(eggId) == true);
        eggs[eggId].hatched = true;
    }

    function hasHatched(uint eggId) internal view returns (bool){
        return ((now - eggs[eggId].createdAt) >= hatchTime);
    }

    function getEggType(uint eggId) internal view returns (uint){

    }
}
