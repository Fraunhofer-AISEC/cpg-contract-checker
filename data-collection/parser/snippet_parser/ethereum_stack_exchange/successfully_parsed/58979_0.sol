pragma solidity ^0.4.18;

contract ABSTRACTING {
    function addToWhitelist(address _ad) public;
}

contract SimpleStore {

    address[] public UserList;

    function addToWhitelist(address _ad) public {
        UserList.push(_ad);
    }
}

contract TokenVote {

    ABSTRACTING tokenContract;

    constructor(address token) public {
        tokenContract = ABSTRACTING(token);
    }

    function doStuff () public  {
        tokenContract.addToWhitelist(msg.sender);
    }

}
