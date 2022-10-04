contract D is C, B {
    constructor(uint paramForA, address paramForB, string paramForC) public  C(paramForC) B(paramForB)
    {
        log0(bytes32(0x00000003));  
    }
}
