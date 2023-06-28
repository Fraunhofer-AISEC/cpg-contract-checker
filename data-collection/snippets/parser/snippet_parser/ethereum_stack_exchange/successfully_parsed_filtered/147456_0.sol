

pragma solidity ^0.8.7;
import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";



 contract AccessControl is  ERC721, ERC721URIStorage, Ownable  {
     event ReturnAccessResult( address indexed _from, uint256 id, string action, string mesg);
address owwner;
struct registration {
    uint id;
    bool isValued;
}

struct  list_nfts { 
    uint256 _id;
    address subject;
    address owwner;
    string  permission  ;
    bool isValued;
   
}

mapping (uint256=> list_nfts) nfts ;
mapping (address=> list_nfts) subjectnft ;

 mapping(address => registration ) SubjectRegistration; 

 constructor()  ERC721("AccessControl", "MJT") {
        owwner = msg.sender  ;
 }

        
     function CreateNFT(uint256 tokenId , address _subject , string memory _permission ) public onlyOwner   {
        _safeMint(_subject, tokenId );
          
          nfts[tokenId].subject= _subject;
          nfts[tokenId]._id= tokenId;
         nfts[tokenId].permission= _permission;
         nfts[tokenId].isValued= true; 
          nfts[tokenId].owwner= msg.sender; 
          subjectnft[_subject].isValued=true;
      
    } 
     

 

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId); }
  
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage)  returns (string memory)
    {  return super.tokenURI(tokenId); }
   
   function accessControl(address _subject , string memory _action ) public returns (uint256 _res) {
   
  uint256 idn=1; 
  uint256 idn2;
  uint256 resultat=5;

  
      
  
if (subjectnft[_subject].isValued=false){
   
   idn2=idn+1;
CreateNFT(idn2 ,_subject, _action );
resultat=1;
emit ReturnAccessResult(_subject, idn2, _action, "jeton cree avec succes");
}
else 
resultat=2;
_res= resultat;
emit ReturnAccessResult(_subject, idn2, _action, "jeton deja cree");
}}'
