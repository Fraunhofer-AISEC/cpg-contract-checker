function fetchMedicineBufferOne(string memory _batchno) public view returns 
  (
    string memory batchno,  
    string memory  medicineName, 
    address ownerID, 
    address originManufacturerID, 
    string memory dosage,
    State medicineState
    ) 
  }
return 
  (
    medicines[_batchno].batchno,
    medicines[_batchno].medicineName,
    medicines[_batchno].ownerID,
    medicines[_batchno].originManufacturerID,
    medicines[_batchno].dosage,
    medicines[_batchno].medicineState
    );
}
