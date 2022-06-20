contract PersonalInfo{
    
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
    }

    mapping(address => uint)  UserInfo;

    function createUser(address _userAddress, uint256 _userId, string _fName, string _lName, int256 _age, enum _gender, string _line1, string _line2, string _city, string _state, int256 _pincode  ) public { <------getting error here
    User storage UserInfo = users[_userAddress];
    require(!user.set);
  
    users[_userAddress] = User(
        {
        id: _userId,
        first_name: _fName,
        last_name: _lName,
        age: _age,
        gender : _gender,
        Addr line1: _line1,
        Addr line2: _line2,
        city: _city,
        state: _state,
        pincode: _pincode
        
        set: true
    }
    );

