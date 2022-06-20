pragma solidity 0.8.2;

contract PersonalInfo{
    
    enum gender {MALE, FEMALE}
    
    struct Pdetails {
    
        string fName;
        string lName;
        int256 age;
        gender Gender;
    }
    
    struct Addr{
    
        string line;
        string city;
        string state;
        int256 pincode;
    }
  
    struct UserInfo{
        
        Addr addr;
        Pdetails pdetails;
    }
}
