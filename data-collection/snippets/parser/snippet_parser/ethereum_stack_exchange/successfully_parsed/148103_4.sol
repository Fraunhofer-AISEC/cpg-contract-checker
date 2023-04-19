contract ArrayExample {
    uint8[][3] public foo;

    constructor() {
        
        foo[0] = [uint8(1), 2, 3];
        foo[1] = new uint8[](0);
        foo[2] = [uint8(0)];
    }

    function getFoo() public view returns(uint8[][3] memory) {
      return foo;
    }

    function getFooByIndex(uint i) public view returns(uint8[] memory) {
      return foo[i];
    }
}
