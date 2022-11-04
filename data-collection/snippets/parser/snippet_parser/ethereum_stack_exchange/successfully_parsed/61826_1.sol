pragma solidity ^0.4.24;

contract GetYourSigFromMsgData {
    function f() public pure returns (bytes4) {
        return (bytes4(msg.data[0]) | bytes4(msg.data[1]) >> 8 |
            bytes4(msg.data[2]) >> 16 | bytes4(msg.data[3]) >> 24);
    }
}
