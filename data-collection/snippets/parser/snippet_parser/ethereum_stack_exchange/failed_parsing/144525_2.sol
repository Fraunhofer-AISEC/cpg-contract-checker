function initialize
    string memory _name,
    string memory _symbol,
    uint256 _cost
) ERC721(_name, _symbol) public  {
    owner = msg.sender;
    cost = _cost;
}
