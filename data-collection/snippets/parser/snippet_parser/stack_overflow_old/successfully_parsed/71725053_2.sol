  
  function getRecordByAddressStruct(address _patientAddress) public returns(Records[] memory) {
    Records[] storage _getstructs = getstructs;
    for (uint i = 1; i < _getstructs.length; i++) {
      if (_patientAddress == recordsarray[i].patient == true) {
        Records memory newRecord = Records({
          patient: recordsarray[i].patient,
          hospital: recordsarray[i].hospital,
          admissionDate: recordsarray[i].admissionDate,
          dischargeDate: recordsarray[i].dischargeDate,
          visitReason: recordsarray[i].visitReason
        });
        _getstructs.push(newRecord);
        } else {
          continue;
        }
    }
    return _getstructs;
  }
