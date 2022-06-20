 struct LiveListing {
     uint id;
     string name;
     string description;
     string condition;
     uint price;
     address buyer;
     address seller;       
 }

 mapping(uint => LiveListing) public liveListingsMapping;
 uint id;

     function createListing(string _name, string _description, string _condition, uint _price) public  { 
         id++;
         LiveListing memory listing = LiveListing({name: _name, 
         description: _description, 
         condition: _condition, 
         price: _price, 
         seller: msg.sender, 
         id: id,
         buyer: 0x0,
         });
         liveListingsMapping[id] = listing;
    }
