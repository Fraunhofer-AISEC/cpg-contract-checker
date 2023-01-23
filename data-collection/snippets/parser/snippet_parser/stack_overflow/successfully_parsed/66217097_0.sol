contract crr019_week4assignment {
    
     
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

    
     function AddStudent (string  _Username, address  _Metamask, uint _Age, string  _EmailAddress, bool _BlockchainTrackEnrolled, StudentType  _ClassLevel ) public {
     
     
     
     StudentAccount memory NewStudent = StudentAccount({Username:_Username, Metamask:_Metamask, Age:_Age, Email:_EmailAddress, BlockchainTrackEnrolled:_BlockchainTrackEnrolled,  Student:_ClassLevel});
     
     

 }
    


}
