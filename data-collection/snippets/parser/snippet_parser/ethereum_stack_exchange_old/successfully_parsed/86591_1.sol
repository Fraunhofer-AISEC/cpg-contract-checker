   function Track(
        address _patientID,
        address _doctorID,
        string memory _recordHash
    ) public {
        

        
        uint256 i;
        uint256 recordHashIndex;
        string[] memory patient_recordHashes = getPatientRecordHashes(
            _patientID
        );

        for (i = 0; i < patient_recordHashes.length; i++) {
            
            string memory patient_recordHash = patient_recordHashes[i];
          
            if (
                keccak256(abi.encodePacked(patient_recordHash)) ==
                keccak256(abi.encodePacked(_recordHash))
            ) {
                recordHashIndex = i;
            }
        }

        
        uint256 doctorIndex;
        address[] memory patient_listOfDoctors = getPatientRecordListOfDoctors(
            _patientID,
            recordHashIndex
        );
        for (i = 0; i < patient_listOfDoctors.length; i++) {
            if (patient_listOfDoctors[i] == _doctorID) {
                doctorIndex = i;
            }
        }
      

        
        IsRecordSeen[_patientID][recordHashIndex][doctorIndex] = true;

        
        delete patientToDoctorRecordNames[_patientID][_doctorID][recordHashIndex];
        delete patientToDoctorRecordHashes[_patientID][_doctorID][recordHashIndex];
        delete patientToDoctorEncKeyHashes[_patientID][_doctorID][recordHashIndex];
    } 






    function getPatientRecordHashes(address _patientID)
        public
        view
        userExists(_patientID)
        returns (string[] memory)
    {
        return patientRecordHashes[_patientID];
    }

  
    function getPatientRecordListOfDoctors(address _patientID, uint256 index)
        public
        view
        userExists(_patientID)
        returns (address[] memory)
    {
        return patientRecordListOfDoctors[_patientID][index];
    }
