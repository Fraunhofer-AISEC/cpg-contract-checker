function payFee(address payable _addr) external payable {
    
    (bool success,) = _addr.call{value: 250}("");
    require(success, "Ether sent to address failed");
    emit PaymentSent(success);
}
