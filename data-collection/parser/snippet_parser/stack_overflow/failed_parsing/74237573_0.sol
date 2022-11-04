    pragma solidity 0.8.7;


contract contracts {

     enum shippingStatus1{ shipped, delivered, pending }


      constructor (uint shippingStatus1) public {
          if (numberShipped == 0)
          {state == pending} 
          else 
          {state == shipped}
      }

    struct shippingStatus {
        uint buy; 
        uint numberShipped;
        string state;

    }

    mapping(address => shippingStatus) Sellstatus;


        

    function GetTransactionInformation() public view returns(uint) {
            return Sellstatus[msg.sender].buy;
    }
     

    
      function GetOjectshipped() public view returns(uint){
          return Sellstatus[msg.sender].numberShipped;
    }

    receive() external payable{
        Sellstatus[msg.sender].buy += msg.value;

    
    
        Sellstatus[msg.sender].numberShipped += 1; 
        
    }





}
