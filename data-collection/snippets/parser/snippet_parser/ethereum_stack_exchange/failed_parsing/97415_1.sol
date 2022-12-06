
function createUser(address _userAddress, uint256 _userId, string _fName, string _lName, int256 _age, enum _gender, string _line1, string _line2, string _city, string _state, int256 _pincode  ) public {
    User storage user = users[_userAddress];
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
}
i tried to map these but i dont think this is the right way to do it
