pragma solidity ^0.8.0;

contract Base {

    function privateFunc() private pure returns (string memory) {
        return "private function called, ya dig";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }


}

contract A is Base {
    function test() public view returns (string memory) {
        return internalFunc();
    }
}
