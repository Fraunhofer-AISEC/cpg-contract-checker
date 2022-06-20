pragma solidity ^0.4.3;
import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract BinaryTrading is usingOraclize {
  
  
  
  address minter;

  uint balance;

  string public ethusd;

  function BinaryTrading() {
    minter = msg.sender;
    oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
  }

  
  function () payable {
    balance += msg.value;
  }

  function updatePrice(string newPrice) {
      ethusd = newPrice;
  }

  
  function __callback(bytes32 myid, string result, bytes proof) {
    if (msg.sender != oraclize_cbAddress()) throw;
    ethusd = result;
  }

  
  function getPairPrice() {
    bytes32 myid = oraclize_query("URL", "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD).USD");
  }

}
