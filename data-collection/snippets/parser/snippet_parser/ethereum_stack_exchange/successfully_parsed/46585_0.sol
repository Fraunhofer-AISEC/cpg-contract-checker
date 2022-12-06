    pragma solidity ^0.4.11;
    contract MyContract {

     struct CommonDetails {
      string name; 
      uint32 group;
      mapping (string => SpecificDetails1) items;
     }

     struct SpecificDetails1{
      uint32 capacity;
      string owner;
     }

    struct SpecificDetails2{
     uint32 capacity;
     string owner;
    }

    mapping (address => CommonDetails) commonMapping;
    mapping (string => address)specificMapping;

    function setName(string _name, uint32 _group){

     commonMapping[tx.origin] = CommonDetails(_name, _group);

      if (_group == 1){
       
       
     }
    }

   function getName() constant returns(address, string, uint32) {

     return (tx.origin, commonMapping[tx.origin].name, 
     commonMapping[tx.origin].group);
     
    } 
}