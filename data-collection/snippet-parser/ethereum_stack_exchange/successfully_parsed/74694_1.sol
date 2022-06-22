pragma solidity 0.5.11;

contract UintInt {

    function asBytes32(int i, uint u) public pure returns(bytes32 _i, bytes32 _u) {
        return(bytes32(i), bytes32(u));
    }

    function asUint(int i) public pure returns(uint u) {
        return(uint(i));
    }

    function underflow() public pure returns(int i, uint u, bytes32 bi, bytes32 bu) {
        i = int(0)-int(1);
        u = uint(0)-uint(1);
        bi = bytes32(i);
        bu = bytes32(u);
    }
}
