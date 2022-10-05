bool isTransferring = false;

function transferFunds(uint _value) private {
    require(isTransferring == false, "Rentrancy Detected");
    isTransferring = true;

    uint _fee = (3*_value)/(2*100);

    
    merchant.transfer(_value - _fee);
    admin.transfer(_fee);

    isTransferring = false;

    emit LogForwardedEther(_value, merchant, _value - _fee, admin, _fee);
}
