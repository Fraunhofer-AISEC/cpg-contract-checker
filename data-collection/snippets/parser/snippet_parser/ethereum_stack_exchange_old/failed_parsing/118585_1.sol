function buy() external payable nonReentrant() {

    _internalBuy(false);
}

function discountBuy(bytes32 signedMsg, ) external payable nonReentrant() {

    
    require(doesPassTests(), "denied")
    
    _internalBuy(true);
}

function _internalBuy (bool applyDiscount) private {
    
    uint _price = (applyDiscount ? (PRICE - discountValue): PRICE)

    someAddress.call{value: _price}("");
}
