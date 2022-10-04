
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MyNft is ERC721, Ownable {
    uint256 public mintPrice;
    uint256 public ownerMint;
    uint256 public totalSupply; 
    uint256 public maxSupply;
    uint256 public maxPerWallet;
    bool public isPublicMintEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;
    mapping(address => uint256) public walletMints;
    mapping(address => mapping(address => uint256)) private _allowances;
    ERC20 public token;
    address public spender;

constructor() payable ERC721('MyNFT', 'MYNFT10'){
        mintPrice = 10 ether;
        totalSupply = 0;
        maxSupply = 2000;
        maxPerWallet = 25;
        ownerMint = 0;
        baseTokenUri = "ipfs://Qmc3pQ2dp2Veqg7AUVvj6xEyop6MNbLq2ASg5CUbpyGXDD/";
        
        withdrawWallet = payable(0xb93D019199F57F5B38CA778E369f30F822f869e3);
        token = ERC20(0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664);
        
    }

function getTotalSupply() public view returns (uint256){
    return totalSupply;
}

function setIsPublicMintEnabled(bool isPublicMintEnabled_) external onlyOwner {
    isPublicMintEnabled = isPublicMintEnabled_;
}

function setBaseTokenUri(string calldata baseTokenUri_) external onlyOwner {
    baseTokenUri = baseTokenUri_;
}

function setTotalSupply(uint256 totalSupply_) external onlyOwner {
    totalSupply = totalSupply_;
}

function setMintingPrice(uint256 mintPrice_) external onlyOwner {
    mintPrice = mintPrice_;
}

function getMintPrice() public view returns (uint256) {
    uint256 mintingPrice = mintPrice;
    return mintingPrice;
}

function tokenURI(uint256 tokenId_) public view override returns (string memory){
    require(_exists(tokenId_), 'Token does not exist!');
    return string(abi.encodePacked(baseTokenUri, Strings.toString(tokenId_), ".json"));
}

function withdraw() external onlyOwner {
    
    
    token.transfer(withdrawWallet, token.balanceOf(address(this)));
}

function readAllowance(address owner) public view virtual returns (uint256) {
    return _allowances[owner][address(this)];
}

function approveUSDC() public {
    _allowances[msg.sender][address(this)] = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    token.approve(address(this), 115792089237316195423570985008687907853269984665640564039457584007913129639935);
}

function mint(uint256 quantity_) public {
    require(isPublicMintEnabled, 'Minting is inactive.');
    require((quantity_ * mintPrice) / 10 == quantity_, 'Wrong mint value.');
    require(totalSupply + quantity_ <= maxSupply, 'Sold out.');
    require(token.balanceOf(msg.sender) >= quantity_ * mintPrice, "Insufficient Funds");

    uint256 totalUSDC = quantity_ * mintPrice;
    
    token.transferFrom(msg.sender, address(this), totalUSDC);

    for(uint256 i = 0; i < quantity_; i++){
        uint256 newTokenId = totalSupply + 1;
        totalSupply++;
        _safeMint(msg.sender, newTokenId);
    }
    walletMints[msg.sender] = walletMints[msg.sender] + quantity_;
}

function getWalletMints() public view returns (uint256) {
    uint256 userMints = walletMints[msg.sender];
    return userMints;
}

function mintStatus() public view returns (bool) {
    bool theStatus = isPublicMintEnabled;
    return theStatus;
}
}
