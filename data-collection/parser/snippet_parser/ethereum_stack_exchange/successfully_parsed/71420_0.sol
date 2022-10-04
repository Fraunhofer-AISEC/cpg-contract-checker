pragma solidity ^0.5.0;

import "../utils/math/SafeMath.sol";


contract ExampleDivisibleNFTs {
    using SafeMath for uint256;

    
    mapping(address => mapping(string => uint)) ownerToTokenShare;

    
    mapping(string => bool) mintedToken;

    modifier onlyNonExistentToken(string _tokenId) {
        require(mintedToken[_tokenId] == false, "the NFT already exists");
        _;
    }

    modifier onlyExistentToken(string _tokenId) {
        require(mintedToken[_tokenId] == true, "the NFT doesn't exists");
        _;
    }

}
