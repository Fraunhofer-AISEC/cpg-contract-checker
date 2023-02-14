function SimpleCallwithGasAndValue() public returns (bool) {
    bool status = true;
    EtherBox eb = new EtherBox();
    uint balance = eb.GetBalance.gas(200000).value(1)();
    return status;
}
