contract example {
    mapping (uint => string) map;

    function example () {
        map[123] = "123";
    }

    function return1 () returns (string) {
        return map[123];
    }

    function return2 () returns (string) {
        return map[1];
    } 
}
