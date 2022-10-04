pragma solidity ^0.6.0;

contract new_client {
    enum carstatus {free, rented, maintenance}
    struct Car {
        string car_name;
        string plate;
        uint car_id;
    }
    
    mapping(address => Car) booking;
    Car[] public car;
     uint c=0;
    
    struct Client {
        string name;
        string surname;
        uint age;
        bool license;
        address id;
    
    }
    
    uint total_client;
    
    Client[] public client;
    uint numberofclient;
    
    function innewclient(string memory name_, string memory surname_, uint  age_, bool  license_, address id_) public  {
        require(age_ >= 18, "must be 18 at least");
        require(age_ <= 75, "can't be over 75");
        
        client.push(Client({
            name: name_,
            surname: surname_,
            age: age_,
            license: license_,
            id: id_
            
        }));
        
        numberofclient = client.length;
        
    }
                                
   function gettotalclient() public view  returns(uint) {
        
       return numberofclient;
   }
    
    function checkifclient(address _id) public view returns(bool,uint) {
        for (uint i=0; i<=numberofclient;i++ ) {
            if (client[i].id ==_id){
                return (true,i);
        }
        else {
            return (false,0);
        }
    }
    
  }
  
  function insertnewcar(string memory model, string memory plate_) public  {
    
     
     
     
     car.push(Car({
         car_name:model,
         plate:plate_,
         car_id:c+1
     }));
     
     c++;
  }
  
  function gettotalcar() public view returns(uint) {
      return car.length;
  }
  
  
  function carlist() public view returns(string memory,string memory,uint) {
      
      for (uint i=0; i<=car.length; i++){
          
          return (car[i].car_name,car[i].plate,car[i].car_id);
      }
  }
}


 
