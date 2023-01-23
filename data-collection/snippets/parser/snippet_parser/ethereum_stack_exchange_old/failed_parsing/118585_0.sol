function buy() external payable {

    _internalBuy(false);
}

function discountBuy(bytes32 signedMsg, ) external payable {

    
    require(doesPassTests(), "denied")

    _internalBuy(true);
}

function _internalBuy (bool applyDiscount) private nonReentrant() {
    
    uint _price = (applyDiscount ? (PRICE - discountValue): PRICE)

    someAddress.call{value: _price}("");
}
