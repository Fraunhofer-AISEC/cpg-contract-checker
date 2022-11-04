function LoopThrough2() external pure returns (A[] memory _A) {
        _A =  new A[](5);
        for (uint256 i = 0; i< 5; ++i) {
            _A[i] = _internalReturn(); 
        } 
}
