contract TestTransfer{

    address payable defaultAddress;

    event TransferSuccess(bool success, address sender, address recepient, uint value);

    constructor(address payable _defaultAddress){
        defaultAddress = _defaulAddress;
    }

    function transferEth() payable external {
        transferEth(defaultAddress);
    }

    function transferEth(address _receipient) payable external {
        (bool success, ) = _receipient.call{value: msg.value}("");
        emit TransferSuccess(success, msg.sender, _receipient, msg.value);
    }
}
