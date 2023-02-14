const ethers = require('ethers');

const USDTInterface = ['function approve(address spender, uint256 amount) external returns (bool)'];
const USDTAddress = '0xD9BA894E0097f8cC2BBc9D24D308b98e36dc6D02';
const yourContractAddress = YOUR_DAPP_CONTRACT_ADDRESS;

let provider;
let signer;
let signerAddress;
let USDTContract;

const startFunction = async () => {
    await ethereum.request({ method: 'eth_requestAccounts'});
    await ethereum.request({ method: 'wallet_switchEthereumChain', params:[{chainId: '0x4'}]});
    provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    signerAddress = await signer.getAddress();
    USDTContract = await new ethers.Contract(USDTAddress, USDTInterface, signer);
}
startFunction();

async function approveUSDT(){
    USDTContract.approve(yourContractAddress, BigInt("9007199254740990")**3n);
}


