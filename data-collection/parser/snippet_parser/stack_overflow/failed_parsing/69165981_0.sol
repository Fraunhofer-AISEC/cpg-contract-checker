const IERC20 = ['function decimals() external view returns (uint8)',
    'function balanceOf(address account) external view returns (uint256)',
    'function allowance(address owner, address spender) external view returns (uint256)',
    'function approve(address spender, uint256 amount) external returns (bool)',
    'event Transfer(address indexed from, address indexed to, uint256 value)',
    'event Approval(address indexed owner, address indexed spender, uint256 value)'
]

const USDCAddress = "0x4DBCdF9B62e891a7cec5A2568C3F4FAF9E8Abe2b";
const YOUR_CONTRACT_ADDRESS = YOUR_CONTRACT_ADDRESS;

let provider;
let signer;
let signerAddress;
let YOUR_CONTRACT;
let USDCContract;
let eventTest;

const startFunction = async () => {
    
    await ethereum.request({ method: 'eth_requestAccounts'});
    
    await ethereum.request({ method: 'wallet_switchEthereumChain', params:[{chainId: '0x4'}]});
    
    provider = new _ethers.providers.Web3Provider(window.ethereum);
    
    signer = provider.getSigner();
    
    signerAddress = await signer.getAddress();
    
    USDCContract = await new ethers.Contract(USDCAddress, IERC20, signer);
    USDCContract.on("Approval", (from, to, amount, event) => {
        if (to == contractaddress && from == signerAddress){
            eventTest = event;
            
           
           event['logIndex'];
           event["blockNumber"];
           await event.getTransactionReceipt(); 
        }
    });
}
startFunction();

async function approve(){
    USDCContract.approve(contractaddress, BigInt("9007199254740990")**3n);
}


