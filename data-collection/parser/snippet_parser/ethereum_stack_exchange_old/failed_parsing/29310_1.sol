function getMultipleRecords() returns (uint[], uint[], address[]){
  
  uint[] integerData = [];
  uint[] someOtherData = [];
  address[] addressData = [];
  for each struct in your struct array {
    integerData.push(struct.intData);
    someOtherData.push(struct.someOtherData);
    addressData.push(struct.addressData);
  }  

  return (integerData,someOtherData,addressData);

}
