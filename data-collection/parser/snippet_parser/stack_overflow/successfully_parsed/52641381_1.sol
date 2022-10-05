contract MyToken721 is ERC721Token{                                                       
  string public name = "My ERC721 Token Product";                                         
  string public symbol = "MTP";                                                           

  mapping(uint256 => uint256) my721TokenPrice;                                            

  MyToken20 token;                                                                        

  constructor(MyToken20 _token) public ERC721Token(name, symbol){                         
    require(_token != address(0));                                                        
    token = _token;                                                                       
  }                                                                                       

  function mint(address _to, uint256 _tokenId, uint256 _price) public {                   
    _mint(_to, _tokenId);                                                                 
    my721TokenPrice[_tokenId] = _price;                                                   
  }                                                                                       

  function transferMy721(address _to, uint256 _tokenId) public returns(bool){             
    require(msg.sender == ownerOf(_tokenId));                                             

    uint256 tokenPrice = my721TokenPrice[_tokenId];                                       

    if( token.transferFrom(_to, msg.sender, tokenPrice) == false )  
      return false;                                                                       

    super.approve(_to, _tokenId);                                                         
    super.transferFrom(msg.sender, _to, _tokenId);                                        

    return true;                                                                          
  }                                                                                       

}      
