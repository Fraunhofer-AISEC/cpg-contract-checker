

pragma solidity >=0.8.0 <0.9.0;

import "./token.sol";

contract myContract {

    myToken _tokenContract;


    constructor(myToken tokenContract) {
        _tokenContract = tokenContract;
    }

    function requestTransfer(address from, address to, uint256 tokenId) public{
        _tokenContract.transferFrom(from, to, tokenId);
    }
}
