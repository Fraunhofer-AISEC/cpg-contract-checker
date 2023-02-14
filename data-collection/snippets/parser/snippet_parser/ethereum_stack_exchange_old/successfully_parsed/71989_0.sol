contract test {
    struct BB {
        mapping(uint => string) map_2;
    }
    mapping(uint => BB) map_1;

    function test() public {
        map_1[1].map_2[1] = "hello"; 
    }

    function maping() public view returns(string) {
        return map_1[1].map_2[1]; 
    }
}
