pragma solidity >=0.7.0 <0.9.0;

contract  createstuduim {
    
  struct   studuim  {
    string  name ;
    uint id ;
    uint price ;
    address payable addr ;
    string location ;
    uint cap ;
    uint day ;
    uint time ;
    bool [][][] resv;
    
  }

  studuim []   public studuims ;
    
  event addstudium_event (string  _name,uint _id , uint _price ,address payable _address ,string _location ,uint _cap ,uint _day ,uint _time );

  function addstrudtuim (string memory _name,uint _id ,uint _price ,address payable _address ,string memory _location ,uint _cap ,uint _day ,uint _time,bool [][][] memory resv ) public  {
     
    studuims.push(studuim(_name,_id,_price,_address,_location,_cap,_day,_time,resv));
     
    emit addstudium_event(_name,_id,_price, _address ,_location,_cap,_day,_time) ;
  }
    
}
