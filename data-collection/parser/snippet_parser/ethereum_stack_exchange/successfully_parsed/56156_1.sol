function getStudent(address _address) view public returns (string, address, string, string, string, string){
    return (Students[_address].grade, Students[_address].studentAddr, Students[_address].fName, Students[_address].lName, Students[_address].email, Students[_address].className);
}
