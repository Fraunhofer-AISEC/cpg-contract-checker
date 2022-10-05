function compareString(string calldata s1,string calldata s2) view public returns (bool) {
        return (keccak256(bytes(s1)) == keccak256(bytes(s2)));
 }
