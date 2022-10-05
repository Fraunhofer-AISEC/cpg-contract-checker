
  function getRecordByAddressMap(address _patientAddress) public view returns (Records[] memory){
    Records[] memory rec = new Records[](recordID);
      for (uint i = 1; i <= rec.length; i++) {
        if (_patientAddress == records[i][_patientAddress].patient == true) {
          rec[i] = records[i][_patientAddress];
          } else {
            continue;
          }
      }
    return rec;
  }
