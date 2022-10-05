

pragma solidity ^0.8.0;

contract crr019_week4assignment {

 
struct StudentAccount {
    
    string Username;
    address Metamask;
    uint Age;
    string EmailAddress;
    bool BlockchainTrackEnrolled;
    StudentType ClassLevel;
    
}

constructor() {
    
    
}


StudentAccount [] public StudentInformation;



 enum StudentType {
        Freshman,
        Sophomore, 
        Junior,
        Senior, 
        Graduate
    }


 function addStudent (string memory _Username, address  _Metamask, uint _Age, string memory _EmailAddress, bool _BlockchainTrackEnrolled, StudentType  _Classlevel) public {

          StudentAccount memory NewStudent = StudentAccount(_Username, _Metamask, _Age, _EmailAddress, _BlockchainTrackEnrolled, _Classlevel);
          StudentInformation.push(NewStudent);
 }
 
}