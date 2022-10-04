pragma solidity 0.5.16;

contract stringsContract {

    function takesTwo(string memory str, uint idx) public pure returns (bytes memory) {
        bytes memory bytesStr = bytes(str);
        return bytesStr;
    }
}
