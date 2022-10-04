contract PatientRecords{
  uint256 public recordID = 1;
  mapping (uint256 => mapping (address => Records)) records;

  struct Records {
      address patient;
      address hospital;
      uint256 admissionDate;
      uint256 dischargeDate;
      uint256 visitReason;
  }

  Records[] recordsarray;
  Records[] getstructs;

  constructor() {
      addRecord(0x3719dB98b075Ff10886Fc29431Ffc2006fFF0005, 
        0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 20220320, 20220330, 1);
      addRecord(0x3719dB98b075Ff10886Fc29431Ffc2006fFF0005, 
        0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 20220333, 20220333, 2);
      addRecord(0x60814DB6b62fE178d7F91239078e3c20fB857E04, 
        0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 20220310, 20220311, 3);
  }


  function addRecord (
    address _patientAddress,
    address _hospital,
    uint256 _admissionDate,
    uint256 _dischargeDate,
    uint256 _visitReason)
    public
  {
      records[recordID][_patientAddress].patient = _patientAddress;
      records[recordID][_patientAddress].hospital = _hospital;
      records[recordID][_patientAddress].admissionDate = _admissionDate;
      records[recordID][_patientAddress].dischargeDate = _dischargeDate;
      records[recordID][_patientAddress].visitReason = _visitReason;

      recordsarray.push(Records(_patientAddress, _hospital, _admissionDate, _dischargeDate, _visitReason));
      recordID++;
  }


  function getRecordByID(address _patientAddress, uint256 _recordID) public view returns(Records memory) {
    return records[_recordID][_patientAddress];
  }


  function getRecordByAddressMap(address _patientAddress) public view returns (Records[] memory){
    Records[] memory rec = new Records[](recordID);
      for (uint i = 1; i < recordID; i++) {
        if (_patientAddress == records[i][_patientAddress].patient == true) {
          rec[i] = records[i][_patientAddress];
          } else {
            continue;
          }
      }
    return rec;
  }

    
  function getRecordByAddressStruct(address _patientAddress) public returns(Records[] memory) {
    Records[] storage _getstructs = getstructs;
    for (uint i = 1; i < recordID; i++) {
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

}
