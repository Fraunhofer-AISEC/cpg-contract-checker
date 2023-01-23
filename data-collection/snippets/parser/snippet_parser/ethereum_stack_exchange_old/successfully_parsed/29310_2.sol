function getOneRecord(uint index) returns (uint, uint, address){
  return (array[index].integerData, array[index].someOtherData, array[index].addressData);
}
