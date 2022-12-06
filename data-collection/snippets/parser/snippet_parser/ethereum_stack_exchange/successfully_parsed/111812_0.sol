struct Payment {
    uint payment;
    uint256 price;
    uint256 tokenId;
    address seller;
}

mapping (address => Payment) private _payment;

function pay(address id) public payable {
    require(
        _payment[id].price > 0,
        "Not for sale."
    );

    require(
        msg.value == _payment[id].price,
        "Incorrect price."
    );   
    
    
    _payment[id].payment = msg.value;
    
    
    uint256 tokenId = _payment[id].tokenId;
    address owner = ERC721.ownerOf(tokenId);
    _transfer(owner, msg.sender, tokenId);
    _payment[id].price = 0; 
    
    emit PaymentMade(msg.sender, msg.value, id);
}
