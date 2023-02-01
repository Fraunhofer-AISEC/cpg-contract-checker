function isThisAddressStudent(address _studentAddress) public view returns (bool) {
        for(uint i; i < studentsArray.length; i++) {
            if(studentsArray[i] == _studentAddress) {
                return true;
            } else {
                return false;
            }
            }
    }
