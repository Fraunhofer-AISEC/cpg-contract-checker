
contract Example {
    function calledFromTest() public view returns (uint256) {
        return _calledInternally() + 10;
    }

    function _calledInternally() internal view returns (uint256) {
        uint256 value = 12;
        return value;
    }
}


contract ExampleTest is Test {
    Example internal example;

    function setUp() public {
        example = new Example();
    }

    function testExample() public {
        example.calledFromTest();
    }
}
