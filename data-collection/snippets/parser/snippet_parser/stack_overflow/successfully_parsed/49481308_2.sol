function __callback(bytes32 myid, bool isWhitelisted ) { 
    if (msg.sender != oraclize_cbAddress()) throw;
    if (isWhitelisted) {
       callEventXYZ();
    }

}


function checkWhitelist() payable {
    newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
    oraclize_query("URL", "xml(https://YourXMLAPIEndpoint?msgaddress=" + msg.sender +").isWhitelisted.value"); 
}
