contract Tested1 {
    function func() public pure returns (bool) {
        return true;
    }
}

contract Tested2 {
    function() external payable {
        assert(false); 
    }
}
