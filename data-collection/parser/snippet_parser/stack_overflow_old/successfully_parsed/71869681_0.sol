
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract RonteNft is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    Counters.Counter private _soldTokenIdCounter;

    uint256 public constant BASE_PRICE = 0.001 ether;

    struct TokenList {
        uint256 tokenId;
        string tokenUri;
        address tokenOwner;
        bool sold;
    }

    TokenList[] public tokenList;
    

    address[] public addressList;
    mapping(address => bool) public WhiteList;

    constructor() ERC721("RonteNft", "RtNFT") {
        WhiteList[0x9ACdCfb9385810E0270afB5bFA5000d6Be0891ea] = true;
        WhiteList[0x2A5e5cc1dA717B1F076Ce04E0c7A814320C0Dc6A] = true;
        WhiteList[0xEdc64A63ae9dc338052CdF92fA4c80154e4559AE] = true;
        WhiteList[0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266] = true;
        WhiteList[0x70997970C51812dc3A010C7d01b50e0d17dc79C8] = true;
    }

    function totalSupply() external view returns (uint256){
        return _soldTokenIdCounter.current();
    }

    function safeMint(address to, string memory nftTokenURI) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        _setTokenURI(_tokenIdCounter.current(), nftTokenURI);
        tokenList.push(
            TokenList(_tokenIdCounter.current(), nftTokenURI, to, false)
        );

        _tokenIdCounter.increment();
    }

    
    function _burn(uint256 tokenId)
    internal
    override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function currentCounter() public view returns (uint256) {
        return _tokenIdCounter.current();
    }

    function freeMint(address to, string memory nftTokenURI) public {
        _safeMint(to, _tokenIdCounter.current());
        _setTokenURI(_tokenIdCounter.current(), nftTokenURI);
        tokenList.push(
            TokenList(_tokenIdCounter.current(), nftTokenURI, to, false)
        );

        _tokenIdCounter.increment();
    }

    function getTokenList() public view returns (TokenList[] memory) {
        return tokenList;
    }

    function sellToken(address buyer) public {
        
        require(WhiteList[buyer] == true, "You are not in a white list!");

        uint256 tokenId = tokenList[_soldTokenIdCounter.current()].tokenId;
        transferFrom(owner(), buyer, tokenId);
        _soldTokenIdCounter.increment();
        tokenList[_soldTokenIdCounter.current()].sold = true;
    }

    function getError() public {
        require(1 == 2, "TEST ERROR");
    }

    function deposit() public payable {
        require(1 == 2, "DEPOSIT ERROR");
    }

    receive() external payable {
        require(msg.value == BASE_PRICE, "Incoming amount is wrong!");
        require(WhiteList[msg.sender] == true, "You are not in a white list!");

        uint256 tokenId = tokenList[_soldTokenIdCounter.current()].tokenId;
        approve(msg.sender,tokenId);
        transferFrom(owner(), msg.sender, tokenId);
        _soldTokenIdCounter.increment();
        tokenList[_soldTokenIdCounter.current()].sold = true;
    }

    function checkWhiteList(address _wallet) public returns (bool) {
        return WhiteList[_wallet];
    }
 
}
