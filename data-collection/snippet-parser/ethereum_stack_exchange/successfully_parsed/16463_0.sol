contract MyRegistry {

    struct MyEvent {
        string code; 
        string desc; 
        uint count;
        bool recorded;
    }

    event Record(bytes32 hash, string desc, uint count);

    function record(bytes32 hash, string code, string desc, uint count) external {
        if (registry[hash].recorded)
            throw;
        registry[hash] = MyEvent(code, desc, count, true);
    }

    mapping (bytes32 => MyEvent) public registry;
}
