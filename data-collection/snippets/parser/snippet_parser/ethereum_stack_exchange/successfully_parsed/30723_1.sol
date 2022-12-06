pragma solidity ^0.4.17;

contract Thingy {
    uint public thing = 1;

    function doubler(uint input) public view returns (uint) {
        thing = input * 2;
        return thing;
    }

    function test() public {
        doubler(thing);
    }
    function getDoubler() public view returns(uint){
        return thing;
    }
}
