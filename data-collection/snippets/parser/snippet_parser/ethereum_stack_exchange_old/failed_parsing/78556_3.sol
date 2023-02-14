pragma solidity 0.6.0;

contract Test {

    struct Request {
        function(uint) external callback;
    }

    Request[] private requests;

    function getAddress (uint requestID) public view returns (address) {
        return requests[requestID].callback.address;
    }
}
