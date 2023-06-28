

function setXYZ(address _address) external onlyOwner returns (bool success) {
 XYZ[_address] = 4;
 return true;
}
