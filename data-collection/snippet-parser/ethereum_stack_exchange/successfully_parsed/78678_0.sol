

contract ERC721Token {

 function name() external view returns (string memory);
   function symbol() external view returns (string memory);
   function totalSupply() external view returns (uint256);
   function balanceOf(address _owner) external view returns (uint balance);
   
   function ownerOf(uint256 _tokenId) external returns (address owner);
   function approve(address _to, uint256 _tokenId) external returns (bool success); 
   function takeOwnership(uint256 _tokenId) external returns (bool success); 
   function transfer(address _to, uint256 _tokenId) external returns (bool success); 
   function tokenOfOwnerByIndex(address _owner, uint256 _index) external returns (uint tokenId);
   
   function tokenMetadata(uint256 _tokenId) external returns (string memory infoUrl);
   
   event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
   event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);
}

contract TestToken is ERC721Token {

  string  public name;
  string  public symbol;
  uint8   public decimals;
  uint256 public totalTokens;
   mapping(address => uint) private balances;
   mapping(uint256 => address) private tokenOwners;
   mapping(uint256 => bool) private tokenExists;
   mapping(address => mapping (address => uint256)) private allowed;
   mapping(address => mapping(uint256 => uint256)) private ownerTokens;

  constructor(
        uint256 _totalTokens,
        string memory _tokenName,
        uint8 _decimalsPoints,
        string memory _tokenSymbol
        ) public {
        balances[msg.sender] = _totalTokens;
        symbol = _tokenSymbol;
        name = _tokenName;
        decimals = _decimalsPoints;
        totalTokens = 100000000 * (10 ** uint256(decimals));
        emit Transfer(address(0), msg.sender, totalTokens);
    }



   function totalSupply() public view returns (uint256){
       return totalTokens;
   }
   function balanceOf(address _owner) public view returns (uint){
       return balances[_owner];
   }
   function ownerOf(uint256 _tokenId) public returns (address){
       require(tokenExists[_tokenId]);
       return tokenOwners[_tokenId];
   }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
    balances[_to] += _value;
    balances[_from] -= _value;
    allowed[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function takeOwnership(uint256 _tokenId) public returns(bool success){
      require(tokenExists[_tokenId]);
      return true;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
  function tokenOfOwnerByIndex(address _owner, uint256 _index) public returns (uint _tokenId) {
      return 5;
  }
  function tokenMetadata(uint256 _tokenId) public returns (string memory infoUrl) {
     require(tokenExists[_tokenId]);
     return "ss";
  }
}



