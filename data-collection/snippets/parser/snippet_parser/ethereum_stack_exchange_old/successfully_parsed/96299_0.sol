contract MyContract {
    struct Inner{uint foo;}
    struct Outer{Inner bar;}

    uint idx;
    mapping (uint => Outer) mapped;

    function doSomething(uint _val) public {
        mapped[idx] = Outer(Inner(_val));
    }
}
