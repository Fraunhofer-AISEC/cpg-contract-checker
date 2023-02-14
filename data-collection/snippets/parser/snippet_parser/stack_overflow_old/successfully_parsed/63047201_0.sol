pragma solidity ^0.4.25;
import "github.com/provable-things/ethereum-api/provableAPI_0.4.25.sol";


contract DateOracle is usingProvable {

    bytes32 coin_pointer; 
    bytes32 temp_ID;
    address public owner;
    bytes32 public BTC=bytes32("BTC"); 
    bytes32 public ETH=bytes32("ETH");
    bytes32 public USDT=bytes32("USD"); 
    bytes32 public USDC=bytes32("USD");
    bytes32 public TUSD=bytes32("TUSD");
    bytes32 public BUSD=bytes32("USD");
    bytes32 public BCH=bytes32("BCH");
    bytes32 public XTZ=bytes32("XTZ");
    bytes32 public COMP=bytes32("COMP");

    uint constant CUSTOM_GASLIMIT = 150000;



    mapping (bytes32 => bytes32) oraclizeIndex; 

    mapping(bytes32=>bool) validIds;


    
    event newOraclizeQuery(string description);
    event newPriceTicker(uint price);
    event LogConstructorInitiated(string nextStep);
    event LogPriceUpdated(string price);
    
        modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

        function changeOraclizeGasPrice(uint _newGasPrice) external onlyOwner {
        provable_setCustomGasPrice(_newGasPrice);
    }
    


    
    constructor()public payable {
        provable_setProof(proofType_TLSNotary | proofStorage_IPFS);
        emit LogConstructorInitiated("Constructor was initiated. Call 'updatePrice()' to send the Provable Query.");
        owner = msg.sender;
        provable_setCustomGasPrice(1000000000 wei);
    }



    
    function __callback(bytes32 myid, bytes32 result) public {
        if (!validIds[myid]) revert();
        if (msg.sender != provable_cbAddress()) revert();
        coin_pointer = oraclizeIndex[myid];
        delete validIds[myid];
        ETH = result;
        BTC = result;
        BCH = result;
        TUSD = result;
        BUSD = result;
        USDT = result;
        USDC = result;
        COMP = result;
        XTZ = result;

        updatePrice();
    }


    
    function updatePrice() onlyOwner public payable returns(bool) {
        if (provable_getPrice("URL") > (owner.balance)) {
            emit newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            emit newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            
            temp_ID = provable_query(60, "URL", "json(https://api.pro.coinbase.com/products/ETH-USD/ticker).price", CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = ETH;

            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/BTC-USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = BTC;

            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = USDT;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = USDC;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/TUSD-USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = TUSD;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = BUSD;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/BCH-USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = BCH;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/XTZ-USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = XTZ;
            
            temp_ID = provable_query(360, "URL", "json(https://api.pro.coinbase.com/products/COMP-USD/ticker).price",CUSTOM_GASLIMIT);
            oraclizeIndex[temp_ID] = COMP;
            

    
            validIds[temp_ID] = true;

        }
        return true;
    }

 


}'
