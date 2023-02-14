pragma solidity ^0.5.5;

contract Mapping {

    mapping(uint => address) map;
    uint[] ids;

    function mapAddr(address addr, uint id) public {
        map[id] = addr;
        ids.push(id);
    }

    function getAddr(uint id) public returns (address) {
        return map[id];
    }
}
