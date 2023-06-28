pragma solidity ^0.4.23;

contract Season {
    address[] public requests;

    constructor() public {
        requests.push(new Request());
    }

    function getRequestsByFilter() public view returns(bool) {
        Request r = Request(requests[0]);
        bool ret = r.isMatch();
        return ret;
    }
}

contract Request {  
    function isMatch() public pure returns(bool) {
        return true;
    }    
}
