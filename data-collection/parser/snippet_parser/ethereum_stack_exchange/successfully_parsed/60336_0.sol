mapping(bytes32 => OraclizeQueries) public validIDs;

function fetchMatchResults(uint _matchID) payable onlyOwner {
    bytes32 queryId = oraclize_query("URL",  strConcat(firstHalfQuery, 
          uint2str(_matchID), secondHalfQuery));
    validIDs[queryId] = OraclizeQueries("");
    pickWinner(_matchID, validIDs[queryId].result);
  }

function __callback(bytes32 oracleID, string result){
    if(msg.sender != oraclize_cbAddress()) revert();
    require(bytes(validIDs[oracleID].result).length == 0);
    validIDs[oracleID].result = result;
}
