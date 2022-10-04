contract SimpleOraclizeContract is usingOraclize {

      
    function SimpleOraclizeContract() {
      
       new thread().run(new Runnable(){
         while(true){
            sleep(10);
            if(oraclize_getPrice() > 100) {
               doSomething();
            }
         }
     })
    }

    function updatePrice() payable {
        if (oraclize_getPrice("URL") > this.balance) {
            LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query("URL", "json(https://api.kraken.com/0/public/Ticker?pair=ETHXBT).result.XETHXXBT.c.0");
        }
    }
