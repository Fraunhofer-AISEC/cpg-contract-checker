pragma solidity ^0.4.18;

contract Hash {    
    string fhash;
    string comphash;
    event Instructor(string _fhash);
    event Instructors(string _comphash);

    function setinstructor(string _fhash) public {
        fhash = _fhash;  
        emit Instructor(_fhash);           
    }          

    function getinstructor() public constant returns(string){
        return(fhash);
    }

    function setinstructors(string _comphash) public {
        comphash = _comphash; 
        emit Instructors(_comphash);        
    }

    function getinstructors() public constant returns(string){
        return(comphash);
    }

    function compareStrings() public view returns (bool){
        return sha256(fhash) == sha256(comphash)? true : false;              
    }
}
