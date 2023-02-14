cat <<EOF > contract.sol
contract Test {
    function f(uint256 a, uint256 b) external pure returns(uint256) {
        return a + b;
    }
}
EOF

solc contract.sol --bin --opcodes --metadata-hash none > f2.out

cat <<EOF > contract.sol
contract Test {
    function f(uint256 a, uint256 b) external pure returns(uint256 sum) {
        sum = a + b;
    }
}
EOF

solc contract.sol --bin --opcodes --metadata-hash none > f3.out

diff f2.out f3.out
