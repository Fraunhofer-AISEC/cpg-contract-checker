
pragma solidity ^0.4.24;

contract Logistics {

    

      struct package{
         bool isuidgenerated;
         uint itemid;
         string itemname;
         string transitstatus;
         uint orderstatus; 
        address Owner;
         address customer;
         uint ordertime;

         address carrier1;
         uint carrier1_time;

         address carrier2;
         uint carrier2_time;

        address carrier3;
         uint carrier3_time;

}

     mapping (address => package) public packagemapping;
     mapping (address => bool) public carriers;

    



 constructor(){
     Owner = msg.sender;
 }
 modifier onlyOwner(){
     require(Owner = msg.sender);
     _;
 }




function ManageCarriers(address _carrierAddress) onlyOwner public returns (string){

if (!carriers[_carrierAddress]){
      carriers[_carrierAddress] = true;
  } else {
      carriers[_carrierAddress] = false;     
  }
return "Carrier is updated";






    function OrderItem(uint _itemid, string _itemname) public returns(address){
        address uniqueId = address(sha256(msg.sender, now));

       packagemapping[uniqueId].isuidgenerated = true;
       packagemapping[uniqueId].itemid = _itemid;
       packagemapping[uniqueId].itemname = _itemname;
       packagemapping[uniqueId].transitstatus = "your package is ordered and is under processing";
       packagemapping[uniqueId].orderstatus = 1;

       packagemapping[uniqueId].customer = msg.sender;
       packagemapping[uniqueId].ordertime = now;

        return uniqueId;

}


}
