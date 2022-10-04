pragma solidity ^0.4.24;

contract Map {
    mapping (address => bool) simpleMap;

    function add(address _address) external {
        simpleMap[_address] = true;
    }

    function isTrue(address _address) external view returns (bool _ret) {
        return simpleMap[_address];
    }
}

contract Ask {
    Map public map = Map(Map's address like 0x~~ just for test);
    function askMe() external view returns (bool _ret) {
        return map.isTrue(msg.sender);
    }

    function whoIsMsgSender() external view returns (address _address) {
        return msg.sender;
    }
}
