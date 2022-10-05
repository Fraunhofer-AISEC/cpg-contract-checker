   struct Airline {
        address airlineAddress;
        AirlineState state;
        string name;
        mapping(address => bool) approvals; 
        uint8 approvalCount;
   }

   address contractOwner;
   mapping(address => Airline) airlines;
   uint8 totalPaidAirlines;
   constructor()
   {
      contractOwner = msg.sender;
      Airline storage airline = airlines[contractOwner]; 
      
      airline.airlineAddress = contractOwner;
      airline.state = AirlineState.Paid;
      airline.name = "First Airline";
      airline.approvalCount = 0; 
      totalPaidAirlines++;
   }
