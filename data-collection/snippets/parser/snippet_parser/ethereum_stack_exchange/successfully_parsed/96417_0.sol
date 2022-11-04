
pragma solidity >=0.6.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

contract CryptoGogos is Ownable, ERC721 {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; 
    uint constant total_supply =7777; 
  
    uint public entered_supply;
    string public check_name;
    string internal _tokenURI;
    address _address;
    
    constructor() ERC721("CryptoGogos", "CGG") public {
        _address = msg.sender;
    }
    
    
    
    struct Cards{
        string name;
        uint supply; 
        string cat;
        uint card_id; 
        string description;
        string image_url;
    }
    
    Cards[] private card;
    
    mapping(uint =>Cards) public tokeninfo;
    
    
    
    function drawCard(uint _supply) public {
        
        require(_supply<total_supply,
        "Input supply is not less than total supply of cards.");
        _tokenIds.increment();
        uint newNftTokenId = _tokenIds.current();
        
        Cards memory c;
    
        c.card_id = newNftTokenId;
        c.supply = _supply;
        (string memory tu, string memory n, string memory d,string memory ct,string memory i) = getTokenURI(_supply); 
        c.name = n;
        _tokenURI = tu;
        c.description = d;
        c.cat= ct;
        c.image_url = i;
        card.push(c);
        tokeninfo[newNftTokenId] = c;
  
        _safeMint(_address,newNftTokenId) ;
        _setTokenURI(newNftTokenId,_tokenURI);
    }
    
    
    function getTokenURI(uint _supply) internal view returns (string memory ,string memory , string memory , string memory , string memory ){
        string memory t1="This is token URI";
        string memory n1 = "token name";
        string memory d1= "token description";
        string memory _c1="token category";
        string memory _i ="image url";
        return (t1,n1,d1,_c1,_i);
    } 
    
    function _safeMint(address to, uint256 tokenId) internal override onlyOwner  {
        _safeMint(to, tokenId, "");
    }
    
    function viewCategory(uint _tokenid) public view returns (string memory) {
        return (tokeninfo[_tokenid].cat);
    }
    
    function viewNumberofCards() public view returns (uint) {
        return _tokenIds.current();
    }
    
    function viewName(uint _tokenid) public view returns (string memory){
        return (tokeninfo[_tokenid].name);
    }
    
    function viewDescription(uint _tokenid) public view returns (string memory){
        return (tokeninfo[_tokenid].description);
    }
    
    function viewImageUrl(uint _tokenid) public view returns (string memory){
        return (tokeninfo[_tokenid].image_url);
    }
    
    function viewtokenURI() public view returns (string memory){
        return (_tokenURI);
    }
    
     function totalSupply() public view override returns (uint256) {
        
        return _tokenIds.current();
    }
}
