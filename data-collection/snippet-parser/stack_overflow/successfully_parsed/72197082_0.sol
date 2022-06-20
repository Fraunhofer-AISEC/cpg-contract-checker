uint256 public pendingRequestID = 1;
mapping(uint256 => Request) public requests;

struct Request {
    uint256 id;
    address CurrentOwner;
    uint256 price;
    string details;
    string Pictures;
}

function totalAddPendingRequest() public view returns (uint256) {
    return pendingRequestID;
}

   function requestToAddProperty(address _CurrentOwner,uint256 _price,string memory _details,string memory _picture
) public {

    requests[pendingRequestID] = Request(
        pendingRequestID,
        _CurrentOwner,
        _price,
        _details,
        _picture
    );
    pendingRequestID++;
}
