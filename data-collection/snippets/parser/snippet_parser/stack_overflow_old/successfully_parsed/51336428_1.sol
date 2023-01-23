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


pragma solidity ^0.4.24;

contract Map { function isTrue(address _address) external view returns (bool _ret); }

contract Ask {
    Map public map = Map(MAP_ADDRESS);
    function askMe() external view returns (bool _ret) {
        return map.isTrue(msg.sender);
    }

    function whoIsMsgSender() external view returns (address _address) {
        return msg.sender;
    }
}
