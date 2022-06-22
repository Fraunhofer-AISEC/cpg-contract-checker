contract TokenController {

Token private token;

Owned private owned;

event Mint(address indexed to, uint256 amount);



modifier onlyOwner() {
    require(msg.sender == owned.getOwner());
    _;
}

function TokenController(address _sapien, address _owned) {

    token = token(_sapien);
    owned = Owned(_owned);

}

function changeBasicToken(address _sapien) onlyOwner {

    token = Token(_sapien);

}

function changeOwnerContract(address _owned) onlyOwner {

    owned = Owned(_owned);

}


function mint(address _to, uint256 _amount) onlyOwner returns (bool) {
    token.increaseTotal(_amount);
    token.addToBalance(_to, _amount);
    Mint(_to, _amount);
    return true;
}

}
