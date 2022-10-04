pragma solidity ^0.4.0;

contract Test {
    mapping (bytes8 => string) public  map;
    function setMapping() public {
        map["k1"] = "yes";
    }
    function get(bytes4 a) public {
        
    }
}
