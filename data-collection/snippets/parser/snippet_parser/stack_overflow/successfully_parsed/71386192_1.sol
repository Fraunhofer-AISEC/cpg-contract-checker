pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract TigerNft is ERC721Enumerable, Ownable {

    using SafeMath for uint256;
    string public FTP_PROVENANCE = "";
    uint256 public constant MAX_SUPPLY = 10000;
    uint256 public constant MAX_PUBLIC_MINT = 2;
    uint256 public constant MINT_PRICE = 28000000000000000; 
    string private _baseTokenURI;

    uint256 public startingIndexBlock;
    uint256 public startingIndex;
    uint256 public REVEAL_TIMESTAMP;
    bool public saleIsActive = false;
    bool public isAllowListActive = false;
    mapping(address => uint256) public _allowList;

    constructor() ERC721("FortuneTigersPunk", "FTP") {
        _baseTokenURI = "ipfs://QmNm3JHSGhBgL5D5sBov2kjAtxDKEoC9SF1Rq81Tqt52jp/";
   
    }
     modifier callerIsUser() {
        require(tx.origin == msg.sender, "Caller is contract");
        _;
    }
      

    function setProvenanceHash(string memory provenanceHash) public onlyOwner
    {
        FTP_PROVENANCE = provenanceHash;
    }
    
     function setBaseURI(string memory baseURI) public onlyOwner {
        setBaseURI(baseURI);
    }
    function setIsAllowListActive(bool _isAllowListActive) external onlyOwner {
        isAllowListActive = _isAllowListActive;
    }

    function setAllowList(address[] calldata addresses, uint8 numAllowedToMint) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            _allowList[addresses[i]] = numAllowedToMint;
        }
    }
    function numAvailableToMint(address addr) external view returns (uint256) {
        return _allowList[addr];
    }
    function mintAllowList(uint8 numberOfTokens) external payable{
    uint256 ts = totalSupply();
    require(isAllowListActive, "Allow list is not active");
    require(numberOfTokens <= _allowList[msg.sender], "Exceeded max available to purchase");
    require(ts + numberOfTokens <= MAX_SUPPLY, "Purchase would exceed max tokens");
    require(MINT_PRICE.mul(numberOfTokens) <= msg.value, "Ether value sent is not correct");

        _allowList[msg.sender] -= numberOfTokens;
        for (uint256 i = 0; i < numberOfTokens; i++) {
            _safeMint(msg.sender, ts + i);
       }
   }

    function setSaleState() public onlyOwner {
        saleIsActive = !saleIsActive;
    }
    function mint(uint numberOfTokens) public payable {
        uint256 ts = totalSupply();
        require(saleIsActive, "Sale must be active to mint tokens");
        require(numberOfTokens <= MAX_PUBLIC_MINT, "Exceeded max token purchase");
        require(ts + numberOfTokens <= MAX_SUPPLY, "Purchase would exceed max tokens");
        require(MINT_PRICE.mul(numberOfTokens) <= msg.value, "Ether value sent is not correct");

        for (uint i = 0; i < numberOfTokens; i++) {
            if (totalSupply() < MAX_SUPPLY) {
            _safeMint(msg.sender, ts + i);
           }
        }
    
        
     if (startingIndexBlock == 0 && (totalSupply() == MAX_SUPPLY || block.timestamp >= REVEAL_TIMESTAMP)) {
            startingIndexBlock = block.number;
      } 
    }
    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }
}
