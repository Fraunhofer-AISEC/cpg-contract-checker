
pragma solidity ^0.7.0;

import "../openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";
import "../openzeppelin-contracts/contracts/utils/Address.sol";
import "../openzeppelin-contracts/contracts/utils/Counters.sol";
import "./ERC20Token.sol";

contract NFTtoken is ERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    ERC20Token Erc20Contract;

    constructor(address tokenAddress) ERC721("NC NFT example", "NCNFT") {
        owner = msg.sender;
        decimals = 0;
        Erc20Contract = ERC20Token(tokenAddress);
    }
    function transferNFT(address from, address to, uint256 tokenId)  public returns (bool){
        transferFrom(from, to, tokenId);
        Erc20Contract.transfer(nftInfo[from].creator, 10);
        
    }
}
