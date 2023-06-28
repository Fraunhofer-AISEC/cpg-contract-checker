contract test {
    struct BB {
        mapping(uint => AA) map_2;
    }
    struct AA{
        uint val;
    }
    mapping(uint => BB) map_1;

    function test() public {
        map_1[1].map_2[1].val = 10;
    }

    function maping() public view returns(uint) {
        return map_1[1].map_2[1].val;
    }
}
