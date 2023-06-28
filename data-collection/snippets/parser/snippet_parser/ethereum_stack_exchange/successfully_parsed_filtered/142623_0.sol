contract MyContractFuzz is MyContract {
    function echidna_test_balance() public view returns (bool) {
        return (address(this).balance != 0);
    }
}
