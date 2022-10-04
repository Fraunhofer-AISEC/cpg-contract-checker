pragma solidity ^0.4.10;

contract Bar {
    struct Foo{
        uint x;
    }
    mapping(address => Foo[]) foo;

    function add(address id, uint _x) public {
        foo[id].push(Foo(_x));
    }

    function get(address id, uint index) view public returns(uint){
        return foo[id][index].x;
    }
}
