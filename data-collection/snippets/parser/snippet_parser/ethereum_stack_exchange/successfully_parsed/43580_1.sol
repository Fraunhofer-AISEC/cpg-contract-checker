uint8 public token_decimal = 18;
function chkAmt(uint _amt) view public returns(uint256){
    uint256 decfactor = 10**uint256(token_decimal);
    uint256 rtnamt = _amt.mul(decfactor);
    return rtnamt;
}
