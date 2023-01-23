contract MyContractFactory is Ownable {
    function create(...) onlyOwner public returns (MyContract) {
        return new MyContract(...);
    }
}
