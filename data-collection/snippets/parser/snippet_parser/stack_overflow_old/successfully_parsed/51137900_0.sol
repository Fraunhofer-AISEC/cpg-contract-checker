pragma solidity ^0.4.13;

contract Test{         
  struct UserProfile{       
    string UserId;
  }   

  UserProfile public Profile;

  function setProfile(UserProfile newProfile) public {
    Profile  = newProfile;
  }        
}
