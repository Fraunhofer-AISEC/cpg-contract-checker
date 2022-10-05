pragma solidity ^0.4.18;

contract TestString {

    string testStr;

    function TestString() {
        testStr = "this is hardcoded string";
    }

    function setString(string str) {
        testStr = str;
    }

    function getString() constant returns (string) {
        return testStr;
    }

    function() payable {
        revert();
    }
}
