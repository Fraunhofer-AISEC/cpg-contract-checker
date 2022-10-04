function update()
  payable
  public {
  
  if (oraclize_getPrice("URL") > address(this).balance) {
    emit LogInfo("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
  } else {
    emit LogInfo("Oraclize query was sent, standing by for the answer..");

    
    oraclize_query("URL", "json(https://api.crowdscores.com/v1/matches/123945?api_key=93c4c515196741beaf5e4528b64ea511).outcome.winner");
  }
}
