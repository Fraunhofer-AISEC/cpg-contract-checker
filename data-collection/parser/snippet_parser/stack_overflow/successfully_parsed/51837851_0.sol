contract OverloadContract {

function foo(uint256 n, uint256 m) public pure returns (uint256) {
    return n + m;
}


function foo(uint256 n) public pure returns (uint256) {
    return n;
}


function foo() public pure returns (uint256) {
    return 1;
}


function foo(uint256 i, uint256 n, uint256 m) public pure returns (uint256) {
    return i + n + m;
}
}
