pragma solidity ^0.4.8;

library Library {
  struct data {
     uint val;
     uint8 flag;
   }
}

contract Array{
    using Library for Library.data;
    mapping(address => Library.data) clusterContract;

    function addCluster(address id) returns(bool){
        if(clusterContract[id].flag != 1 ){ 
            clusterContract[id] = list;
            clusterContract[id].flag = 1;
            return true;
        }
        return false; 
    }
}
