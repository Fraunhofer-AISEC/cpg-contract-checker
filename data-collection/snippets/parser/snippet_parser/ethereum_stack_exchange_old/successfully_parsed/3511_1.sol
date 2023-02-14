contract two {
    struct A {
        address[] count;
    }

    mapping (address => A) a;

    function add(address c) {
        a[msg.sender].count.push(c);
    }
}
