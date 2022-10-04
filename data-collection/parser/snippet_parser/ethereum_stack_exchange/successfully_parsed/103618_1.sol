function transferOwnership(address newOwner) external onlyOwner {
  if (newOwner != address(0)) {
    owner = newOwner;
  }
} 
