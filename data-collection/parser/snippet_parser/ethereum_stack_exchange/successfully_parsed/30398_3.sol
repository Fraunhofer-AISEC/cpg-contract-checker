contract DieselPrice is usingOraclize { 

  event one(string description);
  event newDieselPrice(string price);

  function DieselPrice() {
      update(); 
  }

  function __callback(bytes32 myid, string result) {
    if (msg.sender != oraclize_cbAddress()) throw;
    newDieselPrice(result);
    DieselPriceUSD = parseInt(result, 2); 
    
  }

  function update() payable {
    one("Oraclize query was sent, standing by for the answer..");
    oraclize_query("URL", "xml(https://www.fueleconomy.gov/ws/rest/fuelprices).fuelPrices.diesel");
  }
}
