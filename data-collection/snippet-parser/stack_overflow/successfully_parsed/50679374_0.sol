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


    function insertUser(
        address walletAddress,
        string organisation,
        string fName,
        string lName,
        string email        )
      public
      returns(uint index) {
          User memory newUser = User({
            walletAddress: walletAddress,
            organisation: organisation,
            fName: fName,
            lName: lName,
            email: email,
            index: users.length
            });

            users.push(newUser);
            userIndex[walletAddress] = newUser.index;
            return newUser.index;
    }
}
