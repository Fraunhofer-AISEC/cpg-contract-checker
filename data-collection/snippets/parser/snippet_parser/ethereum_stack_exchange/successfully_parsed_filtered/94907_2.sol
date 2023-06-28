function theCalc(uint256 aNumber) public view returns(uint256){
        uint256 pi = 3141592653589793284;
        return wmul(aNumber, pi);
}
