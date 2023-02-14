struct Requests {
  uint256[] amountOfRequest;
  address[] demander;
}

mapping(address => Requests) requestsPerAddress;

function issueRequest( address _from, uint _amountRequested) external {}

function acceptRequest(uint _requestIndex) external {}
