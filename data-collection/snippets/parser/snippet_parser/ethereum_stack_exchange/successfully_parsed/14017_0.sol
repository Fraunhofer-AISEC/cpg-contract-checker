 mapping(address => data)         clusterContract;

 struct data { 
    mapping(address => Library.Struct[]) my_status;
 }
 data list;     
 clusterContract[id] = list;
