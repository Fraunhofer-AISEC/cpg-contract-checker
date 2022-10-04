pragma solidity ^0.4.17;

contract Profile {
    struct User {
        string displayName;
        string displayIcon;
    }

    mapping(address => User) public users;
    string name;

    function createUser() public {
        users[msg.sender] = User({
            displayName: "pre-set name",
            displayIcon: "pre-set icon"
        });
    }

    function getDisplayName() public view returns (string) {
        return users[msg.sender].displayName;
    }

    function getDisplayIcon() public view returns (string) {
        return users[msg.sender].displayIcon;
    }

    function setDisplayName(string newDisplayName) public {
        users[msg.sender].displayName = newDisplayName;
    }

    function setDisplayIcon(string newDisplayIcon) public {
        users[msg.sender].displayIcon = newDisplayIcon;
    }

    function getName() public view returns (string) {
        return name;
    }

    function setName(string newName) public {
        name = newName;
    }
}
