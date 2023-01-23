contract Bar {

    function blockingFunction() public pure returns (bool) {
        assembly {
            return(0,0x20)
        }
    }
}

contract Foo is Bar {

    function foo() public pure returns(bool) {
        bool result = blockingFunction();
        uint256 i = 0;
        if (i == 0) return result;
        else return !result;
    }
}
