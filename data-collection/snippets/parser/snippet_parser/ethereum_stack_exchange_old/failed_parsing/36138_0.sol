

modifier onlyLatestRocketNetworkContract() {

    

    if (msg.sender == owner) {
        require(boolStorage[keccak256("contract.storage.initialised")] == false);
    } else {
        
        require(addressStorage[keccak256("contract.address", msg.sender)] != 0x0);
    }
    _;
}
