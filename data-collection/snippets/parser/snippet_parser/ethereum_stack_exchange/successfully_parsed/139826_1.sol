    
    function applyUni(
        uint256 _upc,
        address _originStudentID,
        string memory _studentName,
        string memory _studentSurname,
        
        string memory _courseName,
        string memory _uniName,
        address _uniID
        
    ) public onlyStudent {
        
        persons[_upc].upc = _upc;
        persons[_upc].sku = sku;
        
        persons[_upc].ownerID = _originStudentID;
        persons[_upc].originStudentID = _originStudentID;
        persons[_upc].studentName = _studentName;
        persons[_upc].studentSurname = _studentSurname;
        persons[_upc].personID = _upc + sku; 
        persons[_upc].courseName = _courseName;
        persons[_upc].uniName = _uniName;
        persons[_upc].uniID = _uniID;
        persons[_upc].personState = State.Applied_Uni;

        
        sku = sku + 1;
        
        emit Applied_Uni(_upc);
    }
