pragma solidity 0.5.15;

contract Test {

    struct Request {
        function(uint) external callback;
    }

    Request[] private requests;

    function getAddress (uint requestID) public view returns (address) {
        return address(requests[requestID].callback);
    }
}
