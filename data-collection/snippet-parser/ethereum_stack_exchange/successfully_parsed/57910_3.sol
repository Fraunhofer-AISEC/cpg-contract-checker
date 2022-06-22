
pragma solidity ^0.8.10;

import "../contracts/Thing.sol";
import "./ThingMaker.sol";

contract TestThing {
    Thing preOwnedThing;

    function beforeEach() public {
        uint arg = 123;
        ThingMaker maker = new ThingMaker();
        preOwnedThing = maker.makeThing(arg);
    }

    function testOwnerCanDoThing() public {
        uint arg = 123;
        Thing thing = new Thing(arg);
        thing.doThing();
    }

    function testNonOwnerCannotDoThing() public {
        try preOwnedThing.doThing() {
            assert(1==2);
        } catch {}
    } 

}
