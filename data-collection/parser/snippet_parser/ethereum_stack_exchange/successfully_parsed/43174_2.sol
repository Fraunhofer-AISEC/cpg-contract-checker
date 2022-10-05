pragma solidity ^0.4.19;

contract Safe {
    function isSafe() public pure returns (bool) { return true; }
}
contract FakeSafe {
    function isSafe() public pure returns (uint) { return 12345; }
}
contract NotSafe {
    function isSafe() public pure returns (bool) { return false; }
}
contract NoFallback {
    
}
contract EmptyFallback{
    function() public {}
}

contract Caller {
    Safe safeInstance;
    NotSafe notSafeInstance;
    FakeSafe fakeSafeInstance;
    NoFallback noFallbackInstance;
    EmptyFallback emptyFallbackInstance;

    function Caller() public {
        safeInstance = new Safe();
        fakeSafeInstance = new FakeSafe();
        notSafeInstance = new NotSafe();
        noFallbackInstance = new NoFallback();
        emptyFallbackInstance = new EmptyFallback();
    }

    
    function testSafe()
        public
        returns (bool _isSafe)
    {
        return testIsSafe(address(safeInstance));
    }

    
    function testNotSafe()
        public
        returns (bool _isSafe)
    {
        return testIsSafe(address(notSafeInstance));
    }

    
    function testFakeSafe()
        public
        returns (bool _isSafe)
    {
        return testIsSafe(address(fakeSafeInstance));
    }

    
    function testNoFallback()
        public
        returns (bool _isSafe)
    {
        return testIsSafe(address(noFallbackInstance));
    }

    
    function testEmptyFallback()
        public
        returns (bool _isSafe)
    {
        return testIsSafe(address(emptyFallbackInstance));
    }



    function testIsSafe(address _addr)
        private
        returns (bool _isSafe)
    {
        bytes32 sig = bytes4(keccak256("isSafe()"));
        bool _success = false;
        assembly {
            let x := mload(0x40)    
            mstore(x, sig)          
            _success := call(
                5000,   
                _addr,  
                0,      
                x,      
                4,      
                x,      
                32      
            )
            
            _isSafe := and(_success, mload(x))
        }
    }
}
