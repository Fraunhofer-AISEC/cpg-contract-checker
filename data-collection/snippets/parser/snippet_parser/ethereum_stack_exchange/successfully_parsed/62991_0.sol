function claimPayment(uint256 _gameId, bytes32 _videoId, address _payeeAddr)
        public 
        onlyOwner
        onlyIfValidGameIdAndGameOverState(_gameId)
        whenNotPaused
        {
    require(_payeeAddr != address(0), "(claimPayment) The payee address is not set.");
    require(_videoId != "", "(claimPayment) The video ID is not set.");

    
    
    structPendingPaymentDetails memory pendingPaymentDetails =
        structPendingPaymentDetails(
            0,
            _gameId,
            _videoId,
            _payeeAddr,
            0,
            EnumPaymentType.NOTSET);

    
    bytes32 mapKey = hashPendingPaymentDetails(pendingPaymentDetails);

    
    pendingPaymentDetails.paymentAmountGwei = s_mapPendingPaymentsByGame[mapKey].paymentAmountGwei;
    require(pendingPaymentDetails.paymentAmountGwei > 0, "(claimPayment) In the context of the given game and resource ID, the payee does not have any funds waiting for them.");

    
    require(address(this).balance >= pendingPaymentDetails.paymentAmountGwei, "(claimPayment) The contract does not have enough funds to cover the payment at this time.");

    
    delete s_mapPendingPaymentsByGame[mapKey];

    
    removePaidAddressFromPendingPaymentsList(mapKey);

    
    _payeeAddr.transfer(pendingPaymentDetails.paymentAmountGwei);
}
