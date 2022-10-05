    pragma solidity ^0.4.19;
contract UserRegistry {

    address owner;

    struct user {
        uint dateAdded;
        uint repuation;
    }

    mapping(address => user) users;

    modifier IsUser(address account) {
        require(
            users[account].dateAdded != 0   
        );
        _;
    }

    modifier OwnerApproved() {
        require(
            msg.sender == owner
        );
        _;
    }

     constructor(address _owner) public {
        owner = _owner;
    }
}

contract User is UserRegistry {

    event EventAddUser(address account);

    function addUser(address account) public {
        users[account].dateAdded = now;

        emit EventAddUser(account);
    }

    function updateUserRep(address _user) public IsUser(_user) OwnerApproved {
        users[_user].repuation +=  1;
    }

}
