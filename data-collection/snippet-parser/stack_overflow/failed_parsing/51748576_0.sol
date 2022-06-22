pragma solidity ^0.4.24;


import "../../SuperERC721Token.sol";


contract MyContract {

    SuperERC721Token internal externalToken;

    constructor(address address) public {
        externalToken = SuperERC721Token(address);
    }

    function ThirdPartyTransfer(string hashedTRX) public {
        externalToken.call(hashedTRX); 
    }
}
