contract UserContract {
    struct User {
        address walletAddress;
        string organisation;
        string fName;
        string lName;
        string email;
        uint index;
    }
    mapping(address => User) private users;
    address[] private userIndex;
}
