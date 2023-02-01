pragma solidity ^0.8.0;

contract DecodeTest {

    function test() external pure returns (string memory s, uint n1, int n2, bool b) {

        string memory str = "testing";
        uint  number1 = 123;
        int  number2 = -321;
        bool  boolean = true;

        bytes memory data = abi.encode(str, number1, number2, boolean);

        (s, data) = abi.decode(data, (string, bytes));
        (n1, data) = abi.decode(data, (uint, bytes));
        (n2, data) = abi.decode(data, (int, bytes));
        (b, data) = abi.decode(data, (bool, bytes));

    }

}
