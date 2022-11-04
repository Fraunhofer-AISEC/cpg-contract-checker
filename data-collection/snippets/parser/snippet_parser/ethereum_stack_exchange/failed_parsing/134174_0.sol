
pragma solidity >=0.7.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
contract RoboPunksNFT is ERC721, Ownable{

    uint256 public mintprice;
    uint156 public totalsupply;
    uint156 public maxsupply;
    uint256 public maxPerWallet;
    bool public ispublicMintEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;

    mapping (address => uint256) public walletMints;

    constructor() payable ERC721('RoboPunks', 'RP') {
        mintprice = 0.02 ether;
        totalSupply = 0;
        maxSupply = 1000;
        maxPerWallet = 3;
    }

    function setIsPublicMintEnabled(bool ispublicMintEnabled_) external onlyOwner{
        ispublicMintEnabled = ispublicMintEnabled_;

    }

    function setBaseTokenUri(string calldata baseTokenUri_) external onlyOwner{
        baseTokenUri=baseTokenUri_;

    }


   function tokenURI(uint256, tokenID_) public view override returns (string memory) {
       require(_exist(tokenId_), 'Token doesnot exist');
       return string(abi.encodePacked(baseTokenUri, Strings.toString(tokenId_), ".json"));
   {

   function withdraw() external onlyOwner{
        (bool success,) = withdrawWallet.call{ value: address(this).balance}('');
        require(success, 'withdraw failed');
    }

    function mint(uint256 quantity_) public payable{
        require(isPublicMintEnabled, 'minitng not enabled');
        require(msg.value == quantity_ * mintprice, 'wrong mint price');
        require( totalSupply + quantity_ <= maxSupply, 'soldout'); 
        require(walletMints[msg.sender] + quantity_ <= maxPerWallet, 'exceed max wallet');

        for(uint256 i=0, i < quantity_; i++){
            uint256newTokenId = totalSupply + 1;
            totalSupply++;
            _safemint(msg.sender, newTokenId);
        }
    }
}
