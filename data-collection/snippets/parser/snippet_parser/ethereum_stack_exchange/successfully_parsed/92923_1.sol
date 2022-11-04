pragma solidity ^0.6.0;

contract new_client {
    enum carstatus {free, rented, maintenance}
    enum isclient {client, not_client}
    uint clientstatus;
    uint public refclient;

    struct Car {
        string car_name;
        string plate;
        uint status;
    }
    
    mapping(address => Car) booking;
    Car[] public car;
    Car[] public freecars;
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
    
    function gettotalclient2() public view  returns(uint) {
        
       return client.length;
   }
    function checkifclient(address _id) public view returns(string memory,string memory,uint ,bool ,address) {
        for (uint i=0; i<client.length;i++ ) {
            if (client[i].id ==_id){
                return (client[i].name,client[i].surname,client[i].age,client[i].license,client[i].id);
            }
            else {}
        }
        
       
     
    }
    
  function insertnewcar(string memory model, string memory plate_, uint  status_) public  {
    
     car.push(Car({
         car_name:model,
         plate:plate_,
         status: status_
     }));
     

  }
  
  function gettotalcar() public view returns(uint) {
      return car.length;
  }
  
  
  function carlist() public view returns(string memory,string memory,uint) {
      
      for (uint i=0; i<car.length; i++){
          
          return (car[i].car_name,car[i].plate,car[i].status);
      }
  }
  
  function getfreecars() public returns(uint) {
      for (uint i=0;i<car.length; i++){
          if(car[i].status == 0){
              freecars.push(Car({
                        car_name:car[i].car_name,
                        plate:car[i].plate,
                        status:car[i].status
              }));
          }
          else{}
      }
      return freecars.length;
      
  }
  
  
  
}
