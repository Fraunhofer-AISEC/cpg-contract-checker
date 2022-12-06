library Lib {
    struct clusterData {
        bool isRunning; 
    }
  function constructCluster(clusterData storage self){
      self.isRunning         = true;
  }
}

contract Array {
  using Lib for Lib.clusterData;
  address[] clusterAddresses;
  mapping(address => Lib.clusterData) clusterContract;

  function registerCluster(){
     clusterContract[msg.sender].constructCluster();
     clusterAddresses.push(msg.sender);
  }

 function getClusterAddresses() public view
    returns (address[])
   {
    return clusterAddresses;
   }
}
