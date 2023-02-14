contract Rule90 {
    bool[] s1;
    bool[] s2;
    
    bool useS1 = false;
    
    constructor() {
        s1 = [false, false,true,false,false];
        s2 = [false, false];
    }
    
    function newState(bool a, bool b, bool c) private pure returns (bool y) {
        
    }
    
    function advance() public {
        if (useS1) {
            advanceState(s1, s2);
        } else {
            advanceState(s2, s1);
        }
        useS1 = !useS1;
    }
    
    function advanceState(bool[] storage current, bool[] storage prev) private {
        bool x;
        uint n = current.length;
        for (uint i=1; i<prev.length-1; i++) {
            x = newState(prev[i-1], prev[i], prev[i+1]);
            if (i+1 > n-1) {
                current.push(x);
            } else {
                current[i+1] = x;
            }
        }
        current.push(false);
        current.push(false);
    }
}
