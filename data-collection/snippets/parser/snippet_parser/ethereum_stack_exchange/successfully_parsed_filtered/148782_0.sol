       
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./CustomERC20.sol";

contract FractionalNFTMarketplace is ERC721URIStorage, Ownable {
    using Strings for uint256;

    uint256 private _currentTokenId = 0;
    address public customERC20Address;

    struct FractionalToken {
        CustomERC20 token;
        uint256 totalShares;
        uint256 pricePerShare;
    }

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 totalShares;
        uint256 pricePerShare;
        bool isForSale;
    }

    mapping(uint256 => FractionalToken) private _fractionalTokens;
    mapping(uint256 => mapping(address => uint256)) private _shareOwners;
    mapping(uint256 => MarketItem) private _marketItems;

    Counters.Counter private _marketItemId;

    event TokenCreated(uint256 indexed tokenId, uint256 totalShares, uint256 pricePerShare);
    event TokenBought(uint256 indexed tokenId, address indexed buyer, uint256 shares);
    event MarketItemCreated(uint256 indexed tokenId, address indexed seller, uint256 totalShares, uint256 pricePerShare);
    event MarketItemSold(uint256 indexed marketItemId, address indexed buyer);
    event ApprovalForToken(uint256 indexed tokenId, address indexed owner, uint256 amount);

    constructor(address _customERC20Address) ERC721("Fractional NFT Marketplace", "FNFTM") {
        customERC20Address = _customERC20Address;
    }
    

    function createMarketItem(uint256 tokenId) private {
    require(_exists(tokenId), "Token ID does not exist.");

    address currentOwner = ownerOf(tokenId);

    FractionalToken storage fractionalToken = _fractionalTokens[tokenId];

    _marketItems[tokenId] = MarketItem(
        tokenId,
        payable(currentOwner),
        payable(address(this)),
        fractionalToken.totalShares,
        fractionalToken.pricePerShare,
        true
    );

    emit MarketItemCreated(tokenId, currentOwner, fractionalToken.totalShares, fractionalToken.pricePerShare);
}

    function createToken(uint256 totalShares, uint256 pricePerShare, string memory tokenURI) public payable returns (uint256) {
        require(totalShares > 0, "Total shares must be greater than 0.");
        require(pricePerShare > 0, "Price per share must be greater than 0.");
        
        uint256 newTokenId = _currentTokenId++;
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        string memory name = string(abi.encodePacked("Shares of NFT #", newTokenId.toString()));
        string memory symbol = string(abi.encodePacked("SNFT", newTokenId.toString()));
        CustomERC20 newERC20Token = new CustomERC20(name, symbol);
        newERC20Token.mint(msg.sender, totalShares);

            _fractionalTokens[newTokenId] = FractionalToken(newERC20Token, totalShares, pricePerShare);
            _shareOwners[newTokenId][msg.sender] = totalShares;
            approveContractForToken(newTokenId,totalShares,address(this));
            createMarketItem(newTokenId);
            newERC20Token.approve(address(this), totalShares);
    
            emit TokenCreated(newTokenId, totalShares, pricePerShare);
            return newTokenId;
        }
function approveContractForToken(uint256 tokenId, uint256 amount, address spender) public {
        require(_exists(tokenId), "Token ID does not exist.");
        require(ownerOf(tokenId) == msg.sender, "Caller is not the owner of the token.");

        FractionalToken storage fractionalToken = _fractionalTokens[tokenId];
        fractionalToken.token.approve(spender, amount);
        emit ApprovalForToken(tokenId, msg.sender, amount);
    }

    function getAllowance(uint256 tokenId, address owner, address spender) public view returns (uint256) {
        require(_exists(tokenId), "Token ID does not exist.");
        FractionalToken storage fractionalToken = _fractionalTokens[tokenId];
        return fractionalToken.token.allowance(owner, spender);
    }

    function buyToken(uint256 tokenId,uint256 totalPrice, uint256 shares) public payable {
        require(_exists(tokenId), "Token ID does not exist.");
        require(shares > 0, "Shares must be greater than 0.");

        FractionalToken storage fractionalToken = _fractionalTokens[tokenId];
        require(fractionalToken.totalShares >= shares, "Not enough shares available.");

        require(msg.value >= totalPrice, "Not enough Ether sent to buy the shares.");

        address seller = ownerOf(tokenId);

        CustomERC20 token = fractionalToken.token;
        uint256 allowance = token.allowance(seller, address(this));

        

        token.transferFrom(seller, msg.sender, shares);
        payable(seller).transfer(totalPrice);
        fractionalToken.totalShares -= shares;
        _shareOwners[tokenId][seller] -= shares;
        _shareOwners[tokenId][msg.sender] += shares;

        
        uint256 remainingAllowance = allowance - shares;
        approveContractForToken(tokenId, remainingAllowance, address(this)); 

        emit TokenBought(tokenId, msg.sender, shares);
    }
}