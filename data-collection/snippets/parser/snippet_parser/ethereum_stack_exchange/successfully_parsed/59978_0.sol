pragma solidity ^0.4.24;

contract MemConsumption {
    uint256 a;
    uint256 b;
    uint256 c;
    uint256 d;

    struct My {
        uint256 a;
        uint256 b;
        uint256 c;
        uint256 d;
    }

    function set(uint256 _a, uint256 _b, uint256 _c, uint256 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    function test() public view returns (uint256) {
        return calc(My(a,b,c,d));
    }

    function calc(My my) private pure returns (uint256) {
        My memory m = My(my.a, my.b, my.c, my.d);

        return m.a + m.b + m.c + m.d;
    }
}
