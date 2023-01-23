contract Foo {
    struct Post() {
        ....
    }
    mapping (uint256 => Post) private posts;
    mapping (uint256 => address) private owners;
}
