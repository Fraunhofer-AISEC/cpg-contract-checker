contract Users {
    struct UserData{
        User user;
        bool exists;
    }

    mapping (address => UserData) public users;
    NFT public nftInstance;

    constructor() {
        nftInstance = new NFT();
    }

    event UserConnect(User user);

    function connectUser() public  {
        address userAddress = msg.sender;

        if(users[userAddress].exists) emit UserConnect(users[userAddress].user);
        else {
            User user = new User(userAddress, nftInstance);
            users[userAddress].user = user;
            users[userAddress].exists = true;
            emit UserConnect(user);
        }
    }

    function getUser(address _userAddress) public view returns (User){
        return users[_userAddress].user;
    }
}
