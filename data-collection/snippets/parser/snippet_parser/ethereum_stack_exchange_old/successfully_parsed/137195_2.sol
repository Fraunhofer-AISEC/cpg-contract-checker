function isThisAddressStudent(address _studentAddress) public view returns (bool) {
        for(uint i = 0; i < studentsArray.length; i++)
            if(studentsArray[i] == _studentAddress)
                return true;
        return false;
}
