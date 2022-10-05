function isAddress(address check) public view returns(bool isIndeed) {
   return isActuallyAnAddressOnMyList[check];
}
