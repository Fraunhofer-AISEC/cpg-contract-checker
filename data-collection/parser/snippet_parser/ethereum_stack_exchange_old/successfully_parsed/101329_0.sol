contract Rule90 {
    bool[][] state;
    
    constructor() {
        state.push([false,false,true,false,false]);
    }
    
    function newState(bool a, bool b, bool c) private pure returns (bool y) {
        
    }
    
    function advance() public {
        uint iter = state.length;
        bool[] memory last = state[iter-1];
        uint newLength = last.length+2;
        bool[] memory next = new bool[](newLength);
        for (uint i=1; i < last.length-1; i++) {
          next[i+1] = newState(last[i-1], last[i], last[i+1]);   
        }
        state.push(next);
    }
}
