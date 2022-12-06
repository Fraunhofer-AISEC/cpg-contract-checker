contract TwoStructs {
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

    function get1(address sender) constant returns (address, uint8) {
        return (a[sender].count[0], b[sender].count[0]);
    }

    function get2() constant returns (address, uint8) {
        return (a[msg.sender].count[0], b[msg.sender].count[0]);
    }

    function getMsgSender() constant returns (address) {
        return msg.sender;
    }
}
