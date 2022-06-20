function updatePriceSingle(uint256 timeStamp) payable {
   if (oraclize_getPrice("URL") > this.balance) {
       emit LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
   } else {
       emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
       oraclize_query(timeStamp, "URL", "json(https://min-api.cryptocompare.com/data/histominute?fsym=ETH&tsym=USD&limit=1&aggregate=30e=CCCAGG).Data",200000);
   }
}