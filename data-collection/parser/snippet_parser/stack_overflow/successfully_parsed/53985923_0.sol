pragma solidity ^0.5.2;
pragma experimental ABIEncoderV2;

contract Test {

    string[] array;

    function push(string calldata _text) external {
        array.push(_text);
    }

    function get() external view returns(string[] memory) {
        return array;
    }
}
