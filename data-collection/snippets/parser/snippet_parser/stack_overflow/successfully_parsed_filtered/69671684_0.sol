contract Implement721 is ERC721URIStorage{
uint256 public tokenCounter;
mapping(address => uint[]) public dictBasic;


constructor() ERC721("alvinChris", "ACH")  {
    tokenCounter = 100;
}

function saveData(address _address_sender, string memory _tokenURI)
public returns(address, uint256){
    uint256 newItemId = tokenCounter;
    _mint(_address_sender, newItemId); 
    _setTokenURI(newItemId, _tokenURI); 
    
    
    dictBasic[_address_sender].push(tokenCounter);
    
    tokenCounter = tokenCounter + 1;
    
    return (_address_sender, newItemId);
}
}