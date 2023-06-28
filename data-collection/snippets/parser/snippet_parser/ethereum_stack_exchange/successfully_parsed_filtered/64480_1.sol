contract TripHistory {
  struct Trip {
    string lat;
    string lon;
  }
  mapping (string => Trip) public trips;
  uint public tripcount;

  constructor() public {
    tripcount = 0;
    storeTrip("let0","long0");
    storeTrip("let1","long1");
  }
  function storeTrip(string memory _lat, string memory _lon) public  {
    trips[tripcount] = Trip(_lat, _lon);
    tripcount++;
  }
  
  function getTrip() public view returns (Trip[] memory){
      Trip[] memory trrips = new Trip[](tripcount);
      for (uint i = 0; i < tripcount; i++) {
          Trip storage trrip = trips[i];
          trrips[i] = trrip;
      }
      return trrips;
  }
}
