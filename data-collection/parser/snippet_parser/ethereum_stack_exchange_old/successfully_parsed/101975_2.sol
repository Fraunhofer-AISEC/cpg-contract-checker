pragma solidity ^0.8.5;

contract Test {
    mapping(string => bool) _tokenExists1;
    function test1(string memory _str) external {
        _tokenExists1[_str] = true;
    }

    mapping(bytes => bool) _tokenExists2;
    function test2(string memory _str) external {
        _tokenExists2[abi.encodePacked(_str)] = true;
    }

    mapping(bytes32 => bool) _tokenExists3;
    function test3(string memory _str) external {
        _tokenExists3[keccak256(abi.encodePacked(_str))] = true;
    }

    mapping(bytes32 => bool) _tokenExists4;
    function test4(string memory _str) external {
        _tokenExists4[bytes32(abi.encodePacked(_str))] = true;
    }
}
