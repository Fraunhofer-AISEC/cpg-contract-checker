
pragma solidity ^0.8.0;

contract main0x2 {
    string public BaseURI;

    string private _name;
    string private _symbol;

    mapping(uint256 => address) private _owners;

    mapping(address => uint256) private _balances;

    mapping(uint256 => address) private _tokenApprovals;

    mapping(address => mapping(address => bool)) private _operatorApprovals;

    uint256 Mint_price = 0.00000000003 ether;

    constructor(string memory name_, string memory symbol_, string memory URI) {
        _name = name_;
        _symbol = symbol_;
        BaseURI = URI;
    }

    function name() public view returns(string memory) {
        return _name;
    }

    function symbol() public view returns(string memory) {
        return _symbol;
    }

    function _mint(address to, uint256 tokenId) public {
        require(to != address(0), "ERC721 mint to the zero");
        require(!_exists(tokenId), "The token already minted");

        _balances[to] += 1;
        _owners[tokenId] = to;

    } 

    function ownerOf(uint256 tokenId) public view returns(address) {
        address owner_ = _owners[tokenId];
        require(owner_ != address(0), "The token is not exists");
        return owner_;
    }
    
    function _transfer(address to, address from, uint256 tokenId) public {
        require(_exists(tokenId), "The token is not exists");
        require(to != address(0), "The token will transfer to zero address");
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        
    }

    function _approve(address to,  uint256 tokenId) internal {
        address owner_ = ownerOf(tokenId);
        require(to != owner_, "Approval to current owner");
        require(owner_ == msg.sender, "You are not the token owner");
        _tokenApprovals[tokenId] = to;
    }

    function balanceOf(address owner) public view returns(uint256) {
        require(owner != address(0), "The address is zero");
        return _balances[owner];
    }

    function SetBaseURI(string memory _baseURI) public {
        BaseURI = _baseURI;
    }

    function SetMint_Price(uint256 _Mint_price) public {
        Mint_price = _Mint_price;
    }

    function tokenURI(uint256 tokenId) public view returns(string memory) {
        require(_exists(tokenId), "This token is not exist");
        return BaseURI;
    }

    function _exists(uint256 tokenId) internal view returns(bool) {
        return _owners[tokenId] != address(0);
    }
}
