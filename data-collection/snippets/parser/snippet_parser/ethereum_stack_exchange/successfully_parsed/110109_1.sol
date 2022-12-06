
pragma solidity >=0.5.0 <0.9.0;

contract A {
    uint256[] public a;
    uint256[] public b;
    uint256[] public c;
    
    function foo(uint w, uint256 x) public {
        if (w == 0) {
            bar(a, x);
        } else if (w == 1) {
            bar(b, x);
        } else if (w == 2) {
            bar(c, x);
        }
    }
    
    function bar(uint256[] storage ar, uint256 x) internal {
        ar.push(x);
    }
}
