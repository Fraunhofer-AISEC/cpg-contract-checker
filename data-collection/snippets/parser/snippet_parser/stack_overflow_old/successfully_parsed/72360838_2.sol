
pragma solidity 0.8.4;

contract test {

   struct UserInfo {
        uint Age;
        bool AgeRestriction;
    }

    mapping (string => UserInfo) AllUsers;

    function SetUserInfo(string memory  _Name, uint _Age) public {
        AllUsers[_Name].Age = _Age;
        if (AllUsers[_Name].Age >= 18)  {AllUsers[_Name].AgeRestriction = false;
       }
       else AllUsers[_Name].AgeRestriction = true;
}
       function GetUserInfo(string memory _Name) public view returns (uint) {
      
        return (AllUsers[_Name].Age);
    }   
}




 
