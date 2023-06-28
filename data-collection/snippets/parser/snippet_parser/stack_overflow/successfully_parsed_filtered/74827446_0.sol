pragma solidity ^0.6.12;

contract ChatGroups {
    struct Group {
        string name;
        address[] members;
        Message[] messages;
    }

    struct Message {
        uint id;
        string text;
        address author;
        bool deleted;
    }

    Group[] groups;

    address[] users;

    event GroupCreated(uint groupId, string groupName);

    event MessagePublished(uint groupId, uint messageId, string messageText, address messageAuthor);

    event MessageDeleted(uint groupId, uint messageId);

    event UserAddedToGroup(uint groupId, address user);

    event UserRemovedFromGroup(uint groupId, address user);

    function createGroup(string memory groupName) public {

        require(isUser(msg.sender), "Unauthorized user");


        groups.push(Group({
            name: groupName,
            members: new address[](1),
            messages: new Message[](0)
        }));
        groups[groups.length - 1].members[0] = msg.sender;


        emit GroupCreated(groups.length, groupName);
    }

    function publishMessage(uint groupId, string memory messageText) public {

        require(isUser(msg.sender), "Unauthorized user");


        Group storage group = groups[groupId - 1];


        require(isMember(group, msg.sender), "Unauthorized user");


        group.messages.push(Message({
            id: group.messages.length + 1,
            text: messageText,
            author: msg.sender,
            deleted: false
        }));


        emit MessagePublished(groupId, group.messages[group.messages.length - 1].id, messageText, msg.sender);
    }

    function deleteMessage(uint groupId, uint messageId) public {

        require(isUser(msg.sender), "Unauthorized user");


        Group storage group = groups[groupId - 1];


        require(isMember(group, msg.sender) && group.messages[messageId - 1].author == msg.sender, "Unauthorized user");


        group.messages[messageId - 1].deleted = true;


        emit MessageDeleted(groupId, messageId);
    }

    function removeUser(uint groupId, address user) public {

        require(isUser(msg.sender), "Unauthorized user");


        Group storage group = groups[groupId - 1];


        require(isAdmin(group, msg.sender), "Unauthorized user");


        require(isMember(group, user), "Unauthorized user");


        uint index = getMemberIndex(group, user);
        group.members[index] = group.members[group.members.length - 1];
        group.members.length--;


        emit UserRemovedFromGroup(groupId, user);
    }

    function addUser(uint groupId, address user) public {

        require(isUser(msg.sender), "Unauthorized user");


        Group storage group = groups[groupId - 1];
        require(isAdmin(group, msg.sender), "Unauthorized user");


        require(!isMember(group, user), "User already member of group");


        group.members.push(user);


        emit UserAddedToGroup(groupId, user);
    }

    function isUser(address user) private view returns (bool) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i] == user) {
                return true;
            }
        }
        return false;
    }

    function isMember(Group memory group, address user) public view returns (bool) {

        if (group.members[0] == user) {
            return true;
        }

        for (uint i = 1; i < group.members.length; i++) {
            if (group.members[i] == user) {
                return true;
            }
        }
        return false;
    }

    function isAdmin(Group memory group, address user) public view returns (bool) {
        if (group.members[0] == user) {
            return true;
        }

        for (uint i = 1; i < group.members.length; i++) {
            if (group.members[i] == user) {
                return true;
            }
        }
        return false;
    }

    function getMemberIndex(Group storage group, address user) private view returns (uint) {
        for (uint i = 0; i < group.members.length; i++) {
            if (group.members[i] == user) {
                return i;
            }
        }
        return group.members.length;
    }
}
