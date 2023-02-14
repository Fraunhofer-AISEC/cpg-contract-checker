contract A {
    uint256 x;
    function myFunc(uint256 _x) public {
        x = _x;
    }
}

contract B is A {
    function myFunc1(uint256 _x) public {
        x = _x;
    }

}

contract Test {
    constructor() {
        A.myFunc.selector; 
        B.myFunc1.selector; 
        B.myFunc.selector; 
    }
}
