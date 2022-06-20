function mint(uint256[] memory _tokensId, uint256 _timestamp, bytes memory _signature) public payable saleIsOpen {

    uint256 total = totalToken();
    require(_tokensId.length <= 2, "Max limit");
    require(total + _tokensId.length <= MAX_ELEMENTS, "Max limit");
    require(msg.value >= price(_tokensId.length), "Value below price");

    address wallet = _msgSender();

    address signerOwner = signatureWallet(wallet,_tokensId,_timestamp,_signature);
    require(signerOwner == owner(), "Not authorized to mint");

    require(block.timestamp >= _timestamp - 30, "Out of time");

    for(uint8 i = 0; i < _tokensId.length; i++){
        require(rawOwnerOf(_tokensId[i]) == address(0) && _tokensId[i] > 0 && _tokensId[i] <= MAX_ELEMENTS, "Token already minted");
        _mintAnElement(wallet, _tokensId[i]);
    }

}

function signatureWallet(address wallet, uint256[] memory _tokensId, uint256 _timestamp, bytes memory _signature) public view returns (address){

    return ECDSA.recover(keccak256(abi.encode(wallet, _tokensId, _timestamp)), _signature);

}
