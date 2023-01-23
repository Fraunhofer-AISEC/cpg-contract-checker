Submission p;                          
function setp(address _addr) external {
    p = Submission(_addr);
}

function readSubmission(uint _u) public returns(uint id, address studentsaddress, Student memory student, Examiner memory examiner, Thesis memory thesis, bool accepted, bool corrected, bool verified){
        return(p.submissions(_u)); 
           }
