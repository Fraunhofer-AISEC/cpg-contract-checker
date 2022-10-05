
    struct Request {
        uint value;
        address to;
        bytes data;
        bool granted;
    }
    Request[] public requests; 


    function submitLoanRequest(address _to, uint _value, bytes calldata _data)
        external {
        requests.push(Request({
            to: _to,
            value: _value,
            data: _data,
            granted: false
        }));
    }

    function executeLoanRequest(uint _requestId) external
    {
        Request storage request = requests[_requestId];
        request.granted = true;
        require(request.granted, "not granted");
        (bool granted, ) = request.to.call{value: request.value}(
            request.data
        );

        require(granted = true, "request failed");
    } 
}```

is there another way to implement the execute function?
