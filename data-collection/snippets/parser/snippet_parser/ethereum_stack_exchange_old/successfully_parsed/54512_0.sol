contract Mycontract{
Fuelprice o;
constructor(address Oracleaddress_){
o=Fuelprice(Oracleaddress_);
}

function getfuelPriceUSD() public view returns (uint){
      return o.fuelPriceUSD();

    }
}
