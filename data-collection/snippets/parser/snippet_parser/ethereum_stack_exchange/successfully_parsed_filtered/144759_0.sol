contract Bar {
    function toOverride() external {}
}

contract Foo is Bar {
    function toOverride() override external {}
}
