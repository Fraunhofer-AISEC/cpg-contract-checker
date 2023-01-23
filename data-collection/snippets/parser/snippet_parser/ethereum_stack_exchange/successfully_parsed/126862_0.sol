
pragma solidity ^0.8.7;
import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.2/utils/Counters.sol";

 contract NFT is ERC721, ERC721URIStorage, Ownable{

event ReturnAccessResult( address indexed _from, string _errmsg, bool _result);

struct registration {
    uint id;
    bool isValued;
}
struct NFTtable {
     bool isValued;
     uint idNFT;
      address holder;
     string permission;
   
}


 mapping(address => registration ) SubjectRegistration; 
 mapping(address => mapping(string =>NFTtable)) SubjectNFT; 
 
 constructor() ERC721("monjeton", "MJT") {  
 }
 function CreateNFT( uint256 _tokenId, address _holder, address _subject, string memory _resource,string memory _permission, string memory URI) public onlyOwner {
        _safeMint(_holder, _tokenId);
        _setTokenURI(_tokenId, URI);
        SubjectNFT[_subject][_resource].holder== _holder;
        SubjectNFT[_subject][_resource].isValued == true;
        SubjectNFT[_subject][_resource].idNFT= _tokenId;
        SubjectNFT[_subject][_resource].permission= _permission;
        NFTlistAdd(_subject, _resource,_tokenId);
    }

    
function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
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
    function deleteNFT(uint256 _tokenId, address _subject, string memory _resource) public {
         require(msg.sender == ownerOf(_tokenId), 'Not owner of this token'); 
        _burn(_tokenId); 
        delete SubjectNFT[_subject][_resource];
    }
 }
