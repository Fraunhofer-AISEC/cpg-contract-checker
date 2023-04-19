contract ArrayExample {
    uint8[3][] public foo;

    constructor() {
        
        foo.push([1, 2, 3]);
        foo.push([0, 0, 0]);
        foo.push([4, 5, 6]);

    }

    function getFoo() public view returns(uint8[3][] memory) {
      return foo;
    }

    function getFooByIndex(uint i) public view returns(uint8[3] memory) {
      return foo[i];
    }
}
