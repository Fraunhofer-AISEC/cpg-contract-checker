pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

contract Example {
    function getStringArray() public returns (string[]) {
        string[] memory resultStr = new string;
        resultStr[0] = "355555555";
        resultStr[1] = "2";
        resultStr[2] = "8888";
        return resultStr;
    }
}
