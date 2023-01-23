pragma solidity ^0.4.20;

import "../tokens/MyNFToken.sol";


 contract MyContract{

address nftaddress;

function MyContract (address _nftaddress) public {
    nftaddress = _nftaddress;

}

 function createToken(address _owner,uint256 _tokenId) onlyOwner public payable returns(bool){

    MyNFToken instance = MyNFToken(nftaddress);
    instance.mint(_owner,_tokenId);
    return true;
}
}