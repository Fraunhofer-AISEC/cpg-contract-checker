uint counter;

function _mint(string memory _name, bool _isOnSale, uint _price) public{
    MyNft storage nft = fetchNft[_name];
    require(!nft.exists, "The Nft already Exists");        
    nft.id = ++counter;
    nft.name = _name;
    nft.isOnSale = _isOnSale;
    nft.owner = msg.sender;
    nft.price = _price * 1 ether;
    nft.exists = true;
}
