struct TrackDetails {
    string details;
    bool used;
}
mapping(bytes32 => TrackDetails) track;

function saveDetails(bytes32 index, string _trackDetails) public {
    require(int(index) != 0 && bytes(_trackDetails).length != 0);
    require(track[index].used != true);
    track[index].details = _trackDetails;
    track[index].used = true;
}
