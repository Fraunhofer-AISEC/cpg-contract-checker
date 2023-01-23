
const abi = [
  "function getMessage(string) public view returns (string)",
  "function getMessage() public view returns (string)"
]
const contract = new ethers.Contract(address, abi, signer);



message = await contract['getMessage(string)']('nice');
