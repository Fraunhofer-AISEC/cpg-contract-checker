const {ethers} = require('ethers');

let price;
let soldAmount;
let maxAmount;
let provider;
let signer;
let signerAddress;
let contract;

const contractAddress = ICO_CONTRACT_ADDRESS;
const contractABI = {'function showsoldAmount() external view returns(uint256)',
  'function showPrice() external view returns(uint256)',
  'function buyToken(uint256 _amount) external maximumReached(_amount)',
  'function showMaxAmount() external view returns(uint256)'}
  

async () => {
  await ethereum.request({ method: 'eth_requestAccounts' });
  provider = new ethers.providers.Web3Provider(window.ethereum);
  signer = provider.getSigner();
  signerAddress = await signer.getAddress();
  contract = await new ethers.Contract(contractAddress, contractABI, signer);
  price = await contract.showPrice();
  soldAmount= await contract.showSoldAmount();
  maxAmount = contract.showMaxAmount();
  
}


function buyToken(){
  let amount = document.getElementById("INPUT_TO_KNOW_AMOUNT_ID").value;
  contract.buyToken(ethers.utils.parseEther(amount));
}
