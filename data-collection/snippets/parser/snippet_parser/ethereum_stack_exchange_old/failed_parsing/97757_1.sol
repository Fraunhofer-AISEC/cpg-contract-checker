    function retrieve() public pure returns (uint256){
        uint256 ret = 0;
        for(uint t=0;t<1000000000000;t++){
            ret = t;
        }
        return ret;
    }
}
