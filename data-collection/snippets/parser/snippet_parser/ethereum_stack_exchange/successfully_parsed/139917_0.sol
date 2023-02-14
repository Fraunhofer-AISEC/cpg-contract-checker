contract Storage{
    uint snapshot;

    function NewSnap(uint data) external{
        snapshot = uint(keccak256(abi.encode(msg.sender, data)));
    }
}
