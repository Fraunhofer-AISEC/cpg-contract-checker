contract Bar {
    function toOverride_ext() public {}
}

contract Foo is Bar {
    function toOverride() external {
        super.toOverride_ext();
    }
}
