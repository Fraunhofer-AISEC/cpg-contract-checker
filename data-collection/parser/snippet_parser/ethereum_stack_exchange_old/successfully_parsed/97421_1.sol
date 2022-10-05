pragma solidity >=0.7.0 <0.9.0;

contract PersonalInfo {
    
    enum gender {MALE, FEMALE}
    
    struct Pdetails {
    
        string fName;
        string lName;
        int256 age;
        gender Gender;
    }
    
    struct Addr{
    
        string line1;
        string line2;
        string city;
        string state;
        int256 pincode;
    }
  
    struct UserInfo{
        
        Addr addr;
        Pdetails pdetails;
        bool set;
    }

    mapping(address => UserInfo)  users;

    function createUser(address _userAddress, uint256 _userId, string memory _fName, string memory _lName, int256 _age, gender _gender, string memory _line1, string memory _line2, string memory _city, string memory _state, int256 _pincode  ) public { 
        UserInfo storage user = users[_userAddress];
        require(!user.set);
        
        users[_userAddress] = UserInfo({
            pdetails: Pdetails({
                fName: _fName,
                lName: _lName,
                age: _age,
                Gender: _gender}),
            addr: Addr({
                line1: _line1,
                line2: _line2,
                city: _city,
                state: _state,
                pincode: _pincode}),
            set: true
        });
    }
}
