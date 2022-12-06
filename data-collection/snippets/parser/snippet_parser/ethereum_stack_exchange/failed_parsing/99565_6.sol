const contract = new ethers.Contract(contractAddress, [
   'function totalAllocPoint() public view returns (uint256)'
], provider)

await contract.totalAllocPoint()
