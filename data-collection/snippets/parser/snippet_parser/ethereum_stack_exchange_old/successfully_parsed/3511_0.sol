contract one {
    struct A {
        address[] count;
    }
    struct B {
        uint8[] count;
    }

    mapping (address => A) a;
    mapping (address => B) b;

    function add(address c, uint8 g) {
        a[msg.sender].count.push(c);
        b[msg.sender].count.push(g);
    }
}
