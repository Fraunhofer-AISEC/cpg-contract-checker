cat <<EOF > test.sol
contract C {
    function f(uint n) public pure returns (bool) {
        if (n > 0)
            return true;
        else
            return false;
    }
}
EOF

solc test.sol --optimize --asm --ir-optimized --debug-info none --metadata-hash none > gt.out
sed -i 's/>/!=/' test.sol
solc test.sol --optimize --asm --ir-optimized --debug-info none --metadata-hash none > neq.out
diff --report-identical-files gt.out neq.out
