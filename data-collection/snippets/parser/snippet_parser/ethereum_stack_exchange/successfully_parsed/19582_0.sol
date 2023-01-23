    function recover(bytes32 _h, uint8 _v, bytes32 _r, bytes32 _s){
    ecRecovery = ecrecover(_h, _v, _r, _s);
}
