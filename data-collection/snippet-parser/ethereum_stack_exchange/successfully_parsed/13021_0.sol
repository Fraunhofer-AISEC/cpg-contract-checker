contract Array{
    using Library for Library.data;
    mapping(address => Library.data) clusterContract;

    function addCluster(address id) returns(bool){
        if(clusterContract[id] == address(0) ){ 
            clusterContract[id] = list;
            return true;
        }
        return false; 
    }
}
