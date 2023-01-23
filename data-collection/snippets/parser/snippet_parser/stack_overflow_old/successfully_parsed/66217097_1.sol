 
struct StudentAccount {
    
    string Username;
    address Metamask;
    uint Age;
    string EmailAddress;
    bool BlockchainTrackEnrolled;
    StudentType ClassLevel;
    
}

constructor() public {
    
    
}


StudentAccount [] public StudentInformation;



 enum StudentType {
        Freshman,
        Sophomore, 
        Junior,
        Senior, 
        Graduate
    }


 function AddStudent (string  memory _Username, address  _Metamask, uint _Age, string  memory _EmailAddress, bool _BlockchainTrackEnrolled, StudentType  _ClassLevel ) public {
 
 
 
 StudentAccount memory NewStudent = StudentAccount({Username:_Username, Metamask:_Metamask, Age:_Age, EmailAddress:_EmailAddress, BlockchainTrackEnrolled:_BlockchainTrackEnrolled,  ClassLevel:_ClassLevel});
 
}