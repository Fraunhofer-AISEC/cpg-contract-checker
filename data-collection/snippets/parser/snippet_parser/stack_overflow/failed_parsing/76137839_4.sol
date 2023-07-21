
const ABI = ["function greet() public view returns (string)"]
const contract = new ethers.Contract(contractAddress, ABI, provider);



const ABI = [
"function setGreeting(string _greeting) public",
"function deposit() public payable"
]
const contract = new ethers.Contract(contractAddress, ABI, signer)
