contract UserContract {
    struct User {
        address walletAddress;
        string organisation;
        string fName;
        string lName;
        string email;
        uint index;
    }
    User[] users;
    mapping(address => uint256) private addressMap;
    mapping(string => uint256) private emailMap; 
    address[] private userIndex;
}
