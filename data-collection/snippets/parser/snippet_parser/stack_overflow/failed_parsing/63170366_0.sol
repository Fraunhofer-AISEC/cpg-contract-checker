
pragma solidity 0.7.0;

contract Test {
    struct Request {
        uint256 value;
        mapping(address => bool) approvals;
    }
    Request[] public requests;
      ...

    function createRequest(
        uint256 value
    ) public {
        Request memory newRequest = Request({
            value: value
        });

        requests.push(newRequest);
    }
}
