pragma solidity ^0.4.14;

contract Mapping {
    mapping(address => uint256) map;
    mapping(address => uint256) dupe;
    address[] keys;

    function add(uint256 value) {
        map[msg.sender] = value;
        keys.push(msg.sender);
    }

    function duplicate() {
        for(uint256 i; i < keys.length; i++) {
            dupe[keys[i]] = map[keys[i]];
        }
    }
}
