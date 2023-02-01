contract ConA {

    function combineToFunctionPointer(address newAddress, uint newSelector) public pure returns (function() external fun) {
        assembly {
            fun.selector := newSelector
            fun.address  := newAddress
        }
        
    }
}

contract ConB {

        function test(address a) external view{
        ...do something...

    }
}
