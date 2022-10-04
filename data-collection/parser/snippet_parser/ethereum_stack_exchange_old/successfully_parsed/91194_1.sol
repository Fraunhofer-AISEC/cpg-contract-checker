
pragma solidity ^0.7.0;

contract MijnEersteContract {
    string internal constant groet = "hallo, wereld! :o";

    function groetDeWereld() public pure returns (string memory) {
        return groet;
    }
}
