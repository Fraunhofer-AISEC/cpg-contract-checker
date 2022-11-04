pragma solidity ^0.5.12;

contract A{

    string name="Kara";

    function caller(string memory s) public {
        <address of B>.delegatecall(abi.encodePacked(bytes4(keccak256("modify(bytes memory)")), bytes(s)));
    }
}
