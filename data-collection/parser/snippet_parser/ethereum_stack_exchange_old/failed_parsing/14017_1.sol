struct data {
    
    mapping(address => Library.Struct[]) my_status;
}

mapping(address => data) clusterContract;
data list;     
clusterContract[id] = list;

...

clusterContract[msg.sender].my_status[id].push( Library.Struct({ status: status_ }));
