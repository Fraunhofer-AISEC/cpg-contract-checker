pragma solidity ^0.5.0;

import "./MyToken.sol";

contract TokenInteraction {

    address public tokenAddress;

    constructor(address _tokenAdd) public {
        tokenAddress = _tokenAdd;
    }

    function transferToken(address to) public {
        MyToken myToken = MyToken(tokenAddress);
        myToken.transfer(to, 1);
    }

}
