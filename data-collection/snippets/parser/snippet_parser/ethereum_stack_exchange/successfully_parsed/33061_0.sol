pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract TwoQueries is usingOraclize {
  using strings for *;
  
  uint public myresult;
  string public sentresult;
  string fileaddress;
  string hexdigest;
  string filename;
  string client;
  string password;
  string public query;
  string public query2;
  string ipfsloc;
  string hashval;
  bool public initial;

  event newOraclizeQuery(string description);
  event queryValue(string queryDescripion);

  function TwoQueries() public {
    client = "client";
    password = "password";
    filename = "QmYrg4Fjsav174qqAMqgfAZr4nhDqkcPE24cyUW1DJHNxi";
    hexdigest = "45022f343cf02c957c304c1038b87a8e690a758f8fbe9f16d2beab2e093cb073";
    initial = true;
    query = "http://<ipconfig>:9000/test1?ipfs=".toSlice().concat(filename.toSlice()).toSlice().concat("&digest=".toSlice()).toSlice().concat(hexdigest.toSlice()).toSlice().concat("&key=".toSlice()).toSlice().concat(password.toSlice());
    query2 = "http://<ipconfig>:9001/test2?client=".toSlice().concat(client.toSlice()).toSlice().concat("&password=".toSlice()).toSlice().concat(password.toSlice()).toSlice().concat("&addfile=".toSlice()).toSlice().concat("/home/test/blockchain/analysis/file.txt".toSlice());
    update();
  }

  function __callback(bytes32 myid, string result) {
    if (msg.sender != oraclize_cbAddress()) throw;
    if (initial == true) {
      initial = false;
      myresult = parseInt(result, 4); 
      query = query2;
      update();                                                                                  
    }
  }

  function update() payable {
    newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
    queryValue(query);
    oraclize_query("URL", query);
  }
}
