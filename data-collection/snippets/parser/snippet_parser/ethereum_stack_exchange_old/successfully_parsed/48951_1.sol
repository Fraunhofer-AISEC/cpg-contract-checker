contract A {
    constructor(uint paramA) public {
        log0(bytes32(0x00000000));  
    }
}


contract C is A(0) {
    constructor(string paramC) public {
        log0(bytes32(0x00000002));  
    }
}

contract B is A{
    constructor(address paramB) public {
      log0(bytes32(0x00000001));  
    }
}

contract D is B, C {
    constructor(uint paramForA, address paramForB, string paramForC) public  C(paramForC) B(paramForB)
    {
        log0(bytes32(0x00000003));  
    }
}
