function makeMedicine(string memory _batchno, string memory _medicineName,string memory _dosage, address  _originManufacturerID,address _ownerID, string memory _FactoryName, string memory _mfgdate,string memory _expdate,State,address _distributorID,address _userID) public
  
  onlyManufacturer

  {
    
    Medicine memory makeMedicine = Medicine({
      batchno:_batchno,  
      medicineName:_medicineName,
      dosage:_dosage,
      originManufacturerID:_originManufacturerID,
      ownerID:_ownerID, 
      FactoryName:_FactoryName, 
      mfgdate:_mfgdate,
      expdate:_expdate,
      medicineState: State.Made,
      distributorID: _distributorID, 
      userID: _userID

      });
    medicines[_batchno] = makeMedicine;
    medicines[_batchno].medicineState = State.Made;
}