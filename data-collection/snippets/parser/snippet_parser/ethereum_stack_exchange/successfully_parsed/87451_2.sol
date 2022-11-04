contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    Request[] public requests;

    function createRequest(string memory description, uint value, address recipient) public restricted {
      Request memory newRequest = Request({
          description: description,
          value: value,
          recipient: recipient,
          complete: false,
          approvalCount: 0
      });
      requests.push(newRequest);
    }
}
    
