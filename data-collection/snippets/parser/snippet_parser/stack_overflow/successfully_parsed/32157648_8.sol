
 
pragma solidity >=0.7.0 < 0.9.0;

contract test {
    function appendStrings(string memory string1, string memory string2) public pure returns(string memory) {
        return string(abi.encodePacked(string1, string2));
    }
}
