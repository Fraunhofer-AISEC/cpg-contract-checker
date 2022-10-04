contract Something  {
    
    uint public a = 1;
    uint constant public b = 3;
    uint immutable imm;
    
    constructor(uint _imm) {
        imm = _imm;
    }

}
