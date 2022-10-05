struct User {
    address wallet_address;  
    string userId;
    string first_name;
    string last_name;
    string email_id;
    bool set;
    string private_key;
}

mapping(address => User) users; 
mapping(string => address) walletAccount;
mapping(address => uint) public balanceOf;
User[] public registeredArray;

function createNewUser(
    address userAcc,
    string memory _id,
    string memory firstName,
    string memory lastName,
    string memory emailId,
    string memory _private_key
) public {
    User storage user = users[userAcc];
    users[userAcc] = User(
        userAcc,
        _id,
        firstName,
        lastName,
        emailId,
        true,
        _private_key
    ); 
    walletAccount[emailId] = userAcc;
    registeredArray.push(users[userAcc]);
}

function getAllUsers() public view returns (User[] memory) {
    return registeredArray;
}
