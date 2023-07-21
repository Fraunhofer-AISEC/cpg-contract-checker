
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.8.2/security/Pausable.sol";
import "@openzeppelin/contracts@4.8.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.2/utils/Counters.sol";

contract Farmer is ERC721, ERC721Enumerable, Pausable, Ownable {

    

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

        
    struct Batch {
        string Name;
        string CompanyInformation;
        string Variety;
        uint256 number;
        uint256 quantity;
        string certification;
        uint256 dateOfCreation;
        uint256 dateOfProduction;
    }


    uint256 public MINT_PRICE = 0.01 ether;
    uint256 public MAX_SUPPLY = 500;

    bool public publicMintOpen = false;
    bool public allowListMintOpen = false;

    mapping(address => bool) public allowList;

    

    constructor() ERC721("Farmer", "FRM") {
        
        _tokenIdCounter.increment();
    }
    
    function withdraw() public onlyOwner(){
        require(address(this).balance > 0, "Balance is zero!" );
        payable(owner()).transfer(address(this).balance);
    }

    

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    
    function editMintWindows (
        bool _publicMintOpen,
        bool _allowListMintOpen
    ) external onlyOwner {
        publicMintOpen = _publicMintOpen;
        allowListMintOpen = _allowListMintOpen;
    }
    
    
    
    function allowListMint() public payable{
        require(allowListMintOpen, "AllowList Mint is OVER!");
        require(allowList[msg.sender], "You are not eligible to mint!");
        require(msg.value == 0.001 ether, "Not enough ether sent!");
        internalMint();
    }

    
    
    
    function publicMint() public payable{
        require(publicMintOpen, "Public Mint OVER!");
        
        
        require(msg.value >= MINT_PRICE, "Not enough ether sent!");
        internalMint();
    }

    function internalMint() internal {
        require(totalSupply() < MAX_SUPPLY, "MINTING IS OVER!");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    
    function withdraw(address _addr) external onlyOwner{
        uint256 balance = address(this).balance;
        payable(_addr).transfer(balance);
    }

    
    function setAllowList(address[] calldata addresses) external onlyOwner{
        for(uint256 i = 0; i < addresses.length; i++){
        allowList[addresses[i]] = true;
        }
    }
    
    
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://FarmerBaseURI/";
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
