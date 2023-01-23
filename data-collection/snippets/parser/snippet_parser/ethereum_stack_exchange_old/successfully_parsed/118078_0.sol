

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";



contract Storage is Ownable {

    uint256 number;
    ERC721 nftAddress;
    uint256 NFTId;



    modifier hasNFTCollection {
        require(nftAddress.balanceOf(msg.sender) >= 1);
        _;
    }



    modifier hasNFTId {
        require(nftAddress.ownerOf(NFTId) == msg.sender);
        _;
    }



    function setNFTCollection(ERC721 _nft) public onlyOwner {
        nftAddress = _nft;
    }



    function setNFTId(uint256 _tokenId) public onlyOwner {
        NFTId = _tokenId;
    }


    
    function store(uint256 num) public hasNFTCollection {
        number = num;
    }

    
    function retrieve() public view returns (uint256){
        return number;
    }
}
