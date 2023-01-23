pragma solidity ^0.4.18;

import "./ERC20Interface.sol";

contract ERC20Wrapper {
    ERC20 constant internal BAT_TOKEN_ADDRESS = ERC20(0xDb0040451F373949A4Be60dcd7b6B8D6E42658B6);
    address myAddress = address(0xAD53363200C71751FA325ED7bE483722256C3501);

    function BATSend(uint tokenAmount) public payable{
        ERC20(BAT_TOKEN_ADDRESS).transfer(myAddress,tokenAmount);
    }
}
