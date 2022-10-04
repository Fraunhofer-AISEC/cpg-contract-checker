contract MyContract {        
    mapping(int256 => string) public track;
    mapping(address => int256) public trackOwner;
    int256 sequenceId;

    function makeTrack() public {
        sequenceId++;
        trackOwner[msg.sender] = sequenceId;
    }

    function saveDetails(string _trackDetails) public {
        require(trackOwner[msg.sender] != 0);
        track[trackOwner[msg.sender]] = _trackDetails;
    }
}
