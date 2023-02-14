contract MyContract {
    mapping(bytes32 => string) public track;

    function saveDetails(bytes32 index, string _trackDetails) public {
        bytes32 key = keccak256(index);
        require(keccak256(track[key]) != keccak256(""));
        track[key] = _trackDetails;
    }
}
