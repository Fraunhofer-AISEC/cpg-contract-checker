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
        require(result == true, "msg");
        return result;
    }
}
