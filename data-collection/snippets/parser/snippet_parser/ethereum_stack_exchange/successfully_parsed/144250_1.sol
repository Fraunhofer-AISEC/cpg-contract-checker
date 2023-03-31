  
  
    
    pragma solidity >=0.7.0 <0.9.0;
    
    contract ChatApp {
        
        struct User {
            string name;
            Friend[] friendList;
        }
        struct Friend {
            address pubkey;
            string name;
        }
    
        struct Message {
            address sender;
            uint256 timestamp;
            string msg;
        }
    
        struct AllUserStruct {
            string name;
            address accountAddress;
        }
    
        AllUserStruct[] public allUsers;
        mapping(address => User) public userList;
        mapping(bytes32 => Message[]) public allMessages;
    
        function checkUserExists(address pubkey) public view returns (bool) {
            return bytes(userList[pubkey].name).length > 0;
        }
    
        
        function createAccount(string memory name) external {
            require(checkUserExists(msg.sender) == false, "User already exists");
            require(bytes(name).length > 0, "Username cannot be empty");
            userList[msg.sender].name = name;
            allUsers.push(AllUserStruct(name, msg.sender));
        }
    
        
        function getUsername(address pubkey) external view returns (string memory) {
            return userList[pubkey].name;
        }
    
        function addFriend(address friend_key, string memory name) external {
            require(checkUserExists(msg.sender), "Create an account first");
            require(checkUserExists(friend_key), "User is not registered!");
            require(
                msg.sender != friend_key,
                "Users cannot add themselves as friend"
            );
            require(
                checkAlreadyFriend(msg.sender, friend_key) == false,
                "These users are already friends"
            );
    
            _addFriend(msg.sender, friend_key, name);
            _addFriend(friend_key, msg.sender, userList[msg.sender].name);
        }
    
        
        function checkAlreadyFriend(address pubkey1, address pubkey2)
            internal
            view
            returns (bool)
        {
            if (
                userList[pubkey1].friendList.length >
                userList[pubkey2].friendList.length
            ) {
                address tmp = pubkey1;
                pubkey1 = pubkey2;
                pubkey2 = tmp;
            }
    
            for (uint256 i = 0; i < userList[pubkey1].friendList.length; i++) {
                if (userList[pubkey1].friendList[i].pubkey == pubkey2) return true;
            }
            return false;
        }
    
        function _addFriend(
            address me,
            address friend_key,
            string memory name
        ) internal {
            Friend memory newFriend = Friend(friend_key, name);
            userList[me].friendList.push(newFriend);
        }
    
        
        function getMyFriendList() external view returns (Friend[] memory) {
            return userList[msg.sender].friendList;
        }
    
        
        function _getChatCode(address pubkey1, address pubkey2)
            internal
            pure
            returns (bytes32)
        {
            if (pubkey1 < pubkey2) {
                return keccak256(abi.encodePacked(pubkey1, pubkey2));
            } else return keccak256(abi.encodePacked(pubkey2, pubkey1));
        }
    
        
        function sendMessage(address friend_key, string memory _msg) external {
            require(checkUserExists(msg.sender), "Create an account first");
            require(checkUserExists(friend_key), "User is not registered");
            require(
                checkAlreadyFriend(msg.sender, friend_key),
                "You are not friend with the given user"
            );
            bytes32 chatCode = _getChatCode(msg.sender, friend_key);
            Message memory newMsg = Message(msg.sender, block.timestamp, _msg);
            allMessages[chatCode].push(newMsg);
        }
    
        
        function readMessage(address friend_key)
            external
            view
            returns (Message[] memory)
        {
            bytes32 chatCode = _getChatCode(msg.sender, friend_key);
            return allMessages[chatCode];
        }
    
        function getAllUsers() public view returns (AllUserStruct[] memory) {
            return getAllUsers();
        }
    }
