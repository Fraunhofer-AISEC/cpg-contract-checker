function createRentalRequest(bytes32 _id, address _receiver, address _asset, uint _start, uint _end) returns (bool) {
    RentalRequest memory request;

    request.receiver = _receiver;
    request.asset = _asset;
    request.start = _start;
    request.end = _end;
    request.accepted = false;
    request.rejected = false;

    requests[_id] = request;
    Notify(msg.sender, _receiver, _asset);
    return true;
}
