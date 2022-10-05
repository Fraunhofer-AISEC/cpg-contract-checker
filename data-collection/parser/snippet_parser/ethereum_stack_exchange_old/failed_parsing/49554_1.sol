contract MyContractFactory is Ownable {
    function create(...) onlyOwner public returns (MyContract) {
        MyContract myContract = new MyContract(...);
        myContract.transferOwnership(msg.sender);
        return myContract;
    }
}
