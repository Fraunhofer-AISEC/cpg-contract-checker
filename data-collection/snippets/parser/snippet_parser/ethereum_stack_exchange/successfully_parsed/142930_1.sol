
pragma solidity ^0.8.0;

contract Bytes4InMapping {
    mapping(bytes4 => address) public facets;

    function addValueInsideMapping(bytes4 _key) public {
        facets[_key] = msg.sender;
    }
}
