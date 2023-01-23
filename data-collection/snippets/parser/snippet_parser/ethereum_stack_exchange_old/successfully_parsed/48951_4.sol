contract D is B, C {
    constructor(uint paramForA, address paramForB, string paramForC) public  C(paramForC) B(paramForB) {}
}
