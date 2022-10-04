contract StructMapping2 {

    struct Foo {
        mapping(uint => uint) bars;
    }

    mapping(address => Foo) private fooBars;

    function getFooBar(address foo, uint bar) public view returns (uint) {
        return fooBars[foo].bars[bar];
    }
}
