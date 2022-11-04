mapping(address => User) public _userInfoMap;
struct User{
        uint value;
        string email;
        string phoneNumber;
        string name;
        string idCard;
        Gender gender;
        int256 birthday;
        string province;
        string city;
        string area;
    }

function getUserInfoByAccount(address account) public view returns (User memory) {
    return _userInfoMap[account];
}
