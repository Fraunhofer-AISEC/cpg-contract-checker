

pragma solidity 0.8.8;

contract Test3 {
    struct A {
        uint256 a;
        uint256 b;
    }
    
    
    function LoopThrough() external pure returns (A[] memory _A) {
        _A =  new A[](5);
        for (uint256 i = 0; i< 5; ++i) {
            A memory _memoryA = _A[i];
            _memoryA.a = 123;
            _memoryA.b = 456;
        } 
    }

    
    function LoopThrough2() external pure returns (A[] memory _A) {
        _A =  new A[](5);
        for (uint256 i = 0; i< 5; ++i) {
            A memory _memoryA = _A[i];
            _memoryA = _internalReturn();
        } 
    }

    
    function _internalReturn() internal pure returns (A memory _a) {
        _a.a = 123;
        _a.b = 456;
    }
}
