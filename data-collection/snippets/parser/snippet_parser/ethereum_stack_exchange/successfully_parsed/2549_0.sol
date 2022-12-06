contract ClearMapping {
    mapping(uint => bool)[] state;

    
    
    
    function add() returns (bool) {
        uint pos = state.length++;
        bool curr = state[pos][0];
        state[pos][0] = true;
        return curr;
    }

    function remove() {
        state.length--;
    }
}
