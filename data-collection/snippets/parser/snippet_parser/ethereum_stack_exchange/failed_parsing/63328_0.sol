function test() payable{
    Log("Contract created.");
    update();
    update2();
}

 function getInitialPrice() constant returns (uint) {
   return initialPrice;
}

function getFinalPrice() constant returns (uint) {
    return finalPrice;
}

function __callback(bytes32 _myid, string _result) {
    require (msg.sender == oraclize_cbAddress());
    Log(_result);
    initialPrice = parseInt(_result, 2); 

}

 function __callback2(bytes32 _myid, string _result) {
   require (msg.sender == oraclize_cbAddress());
   Log(_result);
   finalPrice = parseInt(_result, 2);
}


function update() payable {
    Log("Oraclize query was sent, waiting for the answer..");
    oraclize_query("URL","json(https://min-api.cryptocompare.com/data/price? 
fsym=ETH&tsyms=USD).USD");
}


function update2() payable {
Log("Oraclize query was sent, waiting for the answer..");
oraclize_query(60 , "URL","json(https://min- 
api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD).USD");
}
