
pragma solidity ^0.8.11;

import "./Helper.sol";

contract Citizen {

    uint private _id;
    string private _firstName;
    string private _lastName;
    string private _email;
    bool private _hasVoted = false;
    uint256 private _voteDate;

    struct CitizenResult {
        uint id;
        string firstName;
        string lastName;
        string email;
        bool hasVoted;
        uint256 voteDate;
    }

    constructor() {
        Helper helper = new Helper();
        _id = helper.getRandomId();
    }

    function get() public view returns (CitizenResult memory) {
        return CitizenResult(_id, _firstName, _lastName, _email, _hasVoted, _voteDate);
    }

    function setInformation(string memory firstName, string memory lastName, string memory email) public {
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
    }

    function setVoted() public {
        _hasVoted = true;
        _voteDate = block.timestamp;
    }

    function getVoteStatus() public view returns (bool) {
        return _hasVoted;
    }

    function getVoteDate() public view returns (uint256) {
        return _voteDate;
    }

}
