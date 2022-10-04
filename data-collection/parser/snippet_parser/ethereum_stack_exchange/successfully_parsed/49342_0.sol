contract SafeMath{    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract TestSafeMath{ 
    function test_add_10_and_max_should_return_err() {
          uint256 max = 2**256 - 1;
          uint256 expected = "revert overflow error";
          Assert.errorsEqual(SafeMathExt.add(10, max), expected, "Addition of 10 and max should revert");
    }
}
