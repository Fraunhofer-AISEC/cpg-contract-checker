contract C {
    Struct S {
        uint a;
        uint b;
    }

    mapping(address => s) structs;

    function updateStructs(S sInstance) private {
        structs[msg.sender] = sInstance;
    }

    function addStruct (uint _a, uint _b) payable {
        S memory s = S({a: _a, b: _b});
        updateStructs(s);
    }
}
