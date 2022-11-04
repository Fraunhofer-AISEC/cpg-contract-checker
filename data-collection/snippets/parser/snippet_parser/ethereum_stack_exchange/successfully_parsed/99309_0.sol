contract Test {
    struct A {
        uint balls;
    }
    
    struct B {
        string name;
        A[] As;
    }
    
    B[] public wow;
    
    function create(uint _n) public {
        B memory lol;
        lol.name = "poop";
        wow.push(lol);
    }
}
