pragma solidity ^0.8.0;
contract convertingVariables{
    address private owner;
    address public owner_2;

    constructor(){
        owner= msg.sender;
        owner_2= owner;
    }

    function gettingPrivateVariable() public view returns(address){
        return owner;
    }
}
