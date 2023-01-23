contract test {
    uint128 public aPos=10;
    function updateQuota( uint128  _Quota){
        aPos = _Quota;
    }
}
