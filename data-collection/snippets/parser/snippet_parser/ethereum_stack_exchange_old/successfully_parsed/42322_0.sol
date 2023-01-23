contract Test{
uint fee;

function Test(uint _feeNumerator, uint _feeDenominator){
    fee = _feeNumerator/_feeDenominator;
}

function updateFee(uint _numerator, uint _denominator){
    fee = _numerator / _denominator;
}

function testPayable(string _doesNothing) payable {
    require(msg.value == fee * (10**18));

}

function getFee() returns (uint fee){
    return fee;
}
}