const [ token, setToken ] = useState({
    bnb: {
        name: 'WBNB',
        selected: false,
        address: "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"
    },
});

const contractAddr = "<CONTRACT_ADDR_HERE>"
const trxData = {seller_wallet_address: "<WALLET_ADDRESS_HERE>"}

async function initiatePayment(){
   const provider = new ethers.providers.Web3Provider(window.ethereum)
   const signer = provider.getSigner()

   let tokenAbi = ["function approve(address _spender, uint256 _value) public returns 
   (bool success)"];
   
   let tokenContract = new ethers.Contract(token['bnb'].address, tokenAbi, signer);
   await tokenContract.approve(contractAddr, value);

   const contract = new ethers.Contract(contractAddr, ctrct.abi, signer)
   const val = await contract.createPayment(id, trxData.seller_wallet_address, 
   token['bnb'].address, {value});
}


