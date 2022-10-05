pragma solidity ^0.8.1;

contract A{
    uint public SubCount = 0; 
    event SubmissionCreated(uint, address,bool,bool,bool);
    
    struct Submission {
        uint id;
        address studentsaddress;
         
         
         
        
        bool accepted;
        
        bool corrected;
        
        bool verified;
    }

     
    mapping(uint => Submission) public submissions;

   function createSubmission(address _studentsaddress) public{
        SubCount ++; 
        submissions[SubCount] = Submission(SubCount,_studentsaddress, false, false, false); 
        emit SubmissionCreated(SubCount, _studentsaddress, false, false, false);
   }
   
   function changeAddress(uint _studentid, address _address) external {
       submissions[_studentid].studentsaddress=_address;
   }
}
