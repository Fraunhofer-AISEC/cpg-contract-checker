function getValueAtMapping(address userAddress)  public  constant  returns(uint value) {
      return data_stores[userAddress];
}
