contract HelloWorld {

    uint public x;   

    function HelloWorld() {
        x = 5;
    }

    function set_x(uint _x) returns(uint x) {
        x = _x;
        return x;
    }

}
