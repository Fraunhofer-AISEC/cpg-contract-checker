pragma solidity ^0.4.23;

contract Season {
    function getRequestsByFilter() public returns(bool) {
        Request r = new Request();
        bool ret = r.isMatch();
        return ret;
    }
}

contract Request {  
    function isMatch() public pure returns(bool) {
        return true;
    }    
}
