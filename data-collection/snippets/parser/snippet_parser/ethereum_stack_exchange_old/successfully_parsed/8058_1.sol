contract test2 is test{ 
    uint b;

    function test2() {
        b = a++;
    }

    function show() returns(uint){
        b = a++;
        return b; 
    }
}
