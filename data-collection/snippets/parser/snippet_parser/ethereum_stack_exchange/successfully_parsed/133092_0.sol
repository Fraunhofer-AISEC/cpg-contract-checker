
pragma solidity ^0.8.7;
contract SimpleStorage {
    uint256 myNumber;

    function storeNumber(uint256 newNumber) public {
        myNumber = newNumber;
    }

    function readNumber() public view returns(uint256) {
        return myNumber;
    }
}
