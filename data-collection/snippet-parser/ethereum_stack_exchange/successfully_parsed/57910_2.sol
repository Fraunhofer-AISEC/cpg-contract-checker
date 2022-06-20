


pragma solidity ^0.8.10;

import "../contracts/Thing.sol";

contract ThingMaker {
    function makeThing(uint argument) public returns (Thing) {
        Thing thing = new Thing(argument);
        return thing;
    }
}
