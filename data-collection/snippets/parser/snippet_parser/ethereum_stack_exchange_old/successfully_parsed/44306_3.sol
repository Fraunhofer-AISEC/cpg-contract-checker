contract Called {
    uint public myuint;

    function set(uint _var) {
        myuint = _var;
    }

    function get() view returns (uint){
        return myuint;
    }
}
