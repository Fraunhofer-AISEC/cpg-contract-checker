
   import "./ERC165.sol";
   import "./IERC721.sol";
   import "./SafeMath.sol";

   contract ERC721 is ERC165, IERC721 {
       using SafeMath for uint256;

       uint256 _totalSupply;
      

       mapping (address => uint256[]) private _ownerTokens;
       mapping (address => mapping (uint256 => uint256)) private _ownerTokenIndex;
       mapping (uint256 => address) private _tokenOwners;
       mapping (uint256 => address) private _tokenApprovals;
       mapping (address => mapping (address => bool)) private _operatorApprovals;

       string private _name;
       string private _symbol;

       mapping (uint256 => string) private _tokenURIs;
       string private _baseURI;

       bytes4 private constant _INTERFACE_ID_ERC721 = 0x80ac58cd;
       bytes4 private constant _INTERFACE_ID_ERC721_METADATA = 0x5b5e139f;
       bytes4 private constant _INTERFACE_ID_ERC721_ENUMERABLE = 0x780e9d63;

       constructor (string memory name, string memory symbol) public {
           _name = name;
           _symbol = symbol;

            _registerInterface(_INTERFACE_ID_ERC721);
     }

       function balanceOf(address owner) public view override returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");

        return _ownerTokens[owner].length;
       }

       function ownerOf(uint256 tokenId) public view override returns (address) {
        address owner = _tokenOwners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");

        return owner;
     }

       function indexOf(address owner, uint256 tokenId) public view returns (uint256){
        require(tokenId > 0,"ERC721: Query for non existent token");
        require(owner != address(0), "ERC721: owner query for nonexistent token");

        return _ownerTokenIndex[owner][tokenId];
     }

       function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256) {
        return _ownerTokens[owner][index];
     }

       function name() public view  returns (string memory) {
        return _name;
     }

       function symbol() public view  returns (string memory) {
        return _symbol;
     }

       function totalSupply() public view  returns (uint256) {
        return _totalSupply;
     }

       function approve(address to, uint256 tokenId) public virtual override {
        address owner = ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(msg.sender == owner || isApprovedForAll(owner, msg.sender),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
     }

       function getApproved(uint256 tokenId) public view override returns (address) {
        require(_exists(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
     }

       function setApprovalForAll(address operator, bool approved) public virtual override {
        require(operator != msg.sender, "ERC721: approve to caller");

        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
     }

       function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return _operatorApprovals[owner][operator];
     }

       function transfer(address to, uint256 tokenId) public virtual {
        
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");
        address from = msg.sender;
        _transfer(from, to, tokenId);
     }

       function transferFrom(address from, address to, uint256 tokenId) public virtual override {
        
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
     }

       function _exists(uint256 tokenId) internal view returns (bool) {
        require(tokenId > 0,"ERC721: Token does not exist");
        address owner = _tokenOwners[tokenId];

        if(owner != address(0))
            return true;
        else
            return false;
     }

       function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
     }

       function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        

        _totalSupply = _totalSupply.add(1);


        _addToken(to,tokenId);

        emit Transfer(address(0), to, tokenId);
     }

       function _burn(uint256 tokenId) internal virtual {
        address owner = ownerOf(tokenId);


        
        _approve(address(0), tokenId);

        
        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
        _totalSupply = _totalSupply.sub(1);

        
        _deleteToken(owner,tokenId);

        emit Transfer(owner, address(0), tokenId);
     }

       function _transfer(address from, address to, uint256 tokenId) internal virtual {
        require(tokenId > 0, "ERC721: Invalid tokenId - tokenId can't be 0");
        require(ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");



        
        _approve(address(0), tokenId);

        
        _deleteToken(from,tokenId);

        
        _addToken(to,tokenId);

        emit Transfer(from, to, tokenId);
     }

       function _addToken(address owner, uint tokenId) internal virtual returns(bool success, uint256 newIndex){
        
        require(!_exists(tokenId),"ERC721: Token already exist");
        require(_tokenOwners[tokenId] != owner,"ERC721: Owner already owned token");

        
        _tokenOwners[tokenId] =  owner;

        
        _ownerTokens[owner].push(tokenId);

        
        newIndex = _ownerTokens[owner].length-1;
        _ownerTokenIndex[owner][tokenId]= newIndex;

        success = true;
     }

       function _deleteToken(address owner, uint tokenId) internal virtual returns(bool success, uint256 index){
        require(_exists(tokenId),"ERC721:Invalid Token - Token not exist");
        require(_tokenOwners[tokenId] == owner,"ERC721: Invalid ownership - Token is not owned by owner");

        index = _ownerTokenIndex[owner][tokenId];

        
        if(_ownerTokens[owner].length>1){
            uint lastToken = _ownerTokens[owner][_ownerTokens[owner].length-1];   
            _ownerTokens[owner][index] = lastToken;
            _ownerTokenIndex[owner][lastToken] = index;
        }
        
        _ownerTokens[owner].pop();
        
        delete _ownerTokenIndex[owner][tokenId];
        
        delete _tokenOwners[tokenId];
        success = true;
     }

       function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
     }

       function _approve(address to, uint256 tokenId) private {
        _tokenApprovals[tokenId] = to;
        emit Approval(ownerOf(tokenId), to, tokenId);
     }
   }```

 ## implementing code ##

`pragma solidity ^0.6.7;

 import "./ERC721.sol";

   contract S5Implement is ERC721 {

       uint256 private _tokenId;

       constructor() ERC721("Entry Level Token","ELT") public {

    }

    function assignToken(address plotte) public returns(uint256) {
        _tokenId++;
        uint256 newItem = _tokenId;
        _mint(plotte, newItem);

        _setTokenURI(newItem, TokenURI);

        return newItem;
    } 
   }`


