func main() {


 
 theKey :="MyKey"
    
    privateKey, err := crypto.HexToECDSA(theKey)
    
    client, err := ethclient.Dial("/Volumes/Data/dd/tst/geth/geth.ipc")
    if err != nil {
        log.Fatal(err)
    }
    publicKey := privateKey.Public()

    publicKeyECDSA, ok := publicKey.(*ecdsa.PublicKey)

    if !ok {

        log.Fatal("error casting public key to ECDSA")

    }

    fromAddress := crypto.PubkeyToAddress(*publicKeyECDSA)
    fmt.Println("From Address :")
    fmt.Println(fromAddress)
    nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
    gasPrice, err := client.SuggestGasPrice(context.Background())
    chainId :=big.NewInt(30300)
    auth, err:= bind.NewKeyedTransactorWithChainID(privateKey, chainId)
   if err !=nil{
    fmt.Println("Son of a ")
   }
    auth.Nonce = big.NewInt(int64(nonce))

    auth.Value = big.NewInt(0)     

    auth.GasLimit = uint64(900000000) 

    auth.GasPrice = gasPrice

    

    
    
    address := common.HexToAddress("0x32795aE65397eAbF07d95D9EEe106bFedCD72E71")

    instance, err := mr.NewMinerRewardCaller(address, client)
    if err != nil {
        fmt.Println("Son of a ")
        log.Fatal(err)
    }
    fmt.Println("Contract connected")

    
    coinbase:= common.HexToAddress("0xC8E66b9f4A6065dD544Bb34d56eDDfeC7ff2B685")
    
    writer, err := mr.NewMinerRewardTransactor(address, client)
    if err != nil {
        log.Fatal(err)
    }
    writer.CreateMiner(auth, coinbase)
    
     miners, err := instance.GetMiners(&bind.CallOpts{})
    if err != nil {
        fmt.Println("Now the Contract is Gone")  
        log.Fatal(err)
    }
if len(miners)>0{
        theMiner, err :=instance.Miners(&bind.CallOpts{}, miners[0])
        fmt.Println(err)
    for i:= 0; i < len(miners); i++ {
                fmt.Println("Miner found :"+miners[i].String())
                 theMiner, err = instance.Miners(&bind.CallOpts{}, miners[i])
                if (theMiner.IsMining){
                    fmt.Println("Miner " + miners[i].String()+" is mining and will be paid ")
                }else{
                    fmt.Println("Miner " + miners[i].String()+" is not mining ")    
                
                }
            }
    }else{
        fmt.Println("No Miners Found")
    }
'''
here is my contract

'''
pragma solidity >0.4.24;

contract MinerReward {
    struct Miner{
        address     coinbase;
        bool        isMining;
        uint        blockNumber;    
    }


  event CreateMiner(address coinbase, bool isMining, uint blockNumber );

  string public version;
  mapping (address => Miner) public Miners;
  address[] public Addresses;
  
  
  constructor() {
    version = "0.1.0";
  }
  
   function getVersion()public view returns (string memory){
    return version;
  }

  function createMiner(address coinbase) external {
            Miner memory newMiner = Miner(coinbase, true, block.number);
            Miners[coinbase]=newMiner;
            bool minerExists = false;
            for (uint i = 0; i < Addresses.length; i++) {
                if (Addresses[i]==coinbase){
                    minerExists =true;
                }
            }
            if(!minerExists){
                Addresses.push(coinbase);
            }


  }
  
  function stopMining(address coinbase) external{
    Miners[coinbase].isMining = false;
  }
  
  function getMiners() public view returns (address[] memory){
        return Addresses;
  }
  
}
'''

Any ideas why it would stop performing reads but can still connect and perform a write.  
