function calc(uint256 _boughtTokenAmount) private returns (uint256) {
    
    uint256 _circle = 2;
    if(_circle == 0){
        return _boughtTokenAmount;
    }else{
        uint256 _d = safeMul(100 , safeSub(lastCircle, 1));
        uint256 _n = safeSub(_d, safeMul(safeSub(_circle, 1), safeSub(attenuationCoefficient0 ,attenuationCoefficient)));

        uint256 _ret = safeMul(_boughtTokenAmount, _n);
        testRet = _ret;

        _ret = _ret/_d;
        testRet1 = _ret;
        return uint(_ret);
    }
}
