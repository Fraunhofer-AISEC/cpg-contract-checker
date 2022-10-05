pragma solidity ^0.4.10;
contract test{
    mapping (uint256 => string) uintTostring;
    function setValueOfVariable() {
        uintTostring[1] = "1";
    }
}
