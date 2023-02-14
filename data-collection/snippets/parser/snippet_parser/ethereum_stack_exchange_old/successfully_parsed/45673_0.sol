struct User {
        string firstName;
        string lastName 
        string dateOfBirth;
        string addressOfUser;
        string emailId;
        string password;
    }  
mapping (string => User) registeredUsers;  
function registerUser(string _firstName, string _lastName,string _dateOfBirth, string _addressOfUser, string _emailId, string _password) public returns (string) {
        totalRegisteredUsers++;
        string memory userId = generateId(_firstName, _lastName);
        registeredUsers[userId] = User(_firstName, _lastName, _dateOfBirth, _addressOfUser, _emailId,  _password);
        return userId;
    }
