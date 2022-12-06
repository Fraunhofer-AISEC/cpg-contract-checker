pragma solidity ^0.4.17;

contract Test {
    struct Stonedetails {
        uint stoneweight;
        string stoneimagehash;
        string stoneidbywholesaledealer;
        string[] stoneidsbycutter;
    }

    mapping (uint=>Stonedetails) public stonedetailsTable;

    function Test() public {
        stonedetailsTable[0].stoneidsbycutter.push("hello");
    }

    function getLength() public constant returns (uint256) {
        return stonedetailsTable[0].stoneidsbycutter.length; 
    }
}
