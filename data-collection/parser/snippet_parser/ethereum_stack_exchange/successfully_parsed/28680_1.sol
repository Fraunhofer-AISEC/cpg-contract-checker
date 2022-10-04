pragma solidity ^0.4.15;

contract Storage {

    struct PlayerStruct {
        uint meaningless;
        uint[] dynamicList;
        uint[10] fixedList;
        mapping(bytes32 => uint) keyToUintMap;
    }

    mapping(address => PlayerStruct) public playerStructs;

    function getPlayerDynListLength(address player) public constant returns(uint count) {
        return playerStructs[player].dynamicList.length;
    }

    function appendPlayerDynList(address player, uint value) public returns(uint length) {
        return playerStructs[player].dynamicList.push(value);
    }

    function setPlayerDynFixedList(address player, uint index, uint value) public returns(bool success) {
        require(index <= 9);
        playerStructs[player].fixedList[index] = value;
        return true;
    }

    function getPlayerDynamicListElement(address player, uint index) public constant returns(uint value) {
        return playerStructs[player].dynamicList[index];
    }

    function setPlayerMappedElement(address player, bytes32 key, uint value) public returns(bool success) {
        playerStructs[player].keyToUintMap[key] = value;
        return true;
    }

    function getPlayerMappedElement(address player, bytes32 key) public constant returns(uint value) {
        return playerStructs[player].keyToUintMap[key];
    }

}
