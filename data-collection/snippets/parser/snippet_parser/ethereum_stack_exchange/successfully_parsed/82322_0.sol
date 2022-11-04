pragma solidity ^0.5.0;

contract MyContract {

    string Name;
    string Symbol;

    using Counters for Counters.Counter;

    mapping (address => Counters.Counter) private _ownedTokensCount;        
    mapping (uint256 => address) private _tokenOwner;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) public {
        Name = _name;
        Symbol = _symbol;


        for(uint256 i=1; i<= _totalSupply; i++){
            _tokenOwner[i] = msg.sender;
        }

        _ownedTokensCount[msg.sender].incrementBySupply(_totalSupply);               
    }

    function transferFrom(address from, address to, uint256 tokenId) public {

        _ownedTokensCount[from].decrement();
        _ownedTokensCount[to].increment();

        _tokenOwner[tokenId] = to;
    }

    function balanceOf(address owner) public view returns (uint256) {

        return _ownedTokensCount[owner].current();
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _tokenOwner[tokenId];        
        return owner;
    }

    function getName() public view returns (string memory) {
        return Name;
    }

    function getSymbol() public view returns (string memory) {
        return Symbol;
    }
}
