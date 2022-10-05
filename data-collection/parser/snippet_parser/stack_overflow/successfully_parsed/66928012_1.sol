pragma solidity ^0.8.0;

contract ClusterHeadNode {

  struct ClusterNode {
      string name;
      string[] ordinarynodes;
  }

  mapping(string => ClusterNode[]) clusternodes;

  function addClusterNode(string memory _basename, string memory _clustername) external {
      string[] memory ordinarynodes;  
      ClusterNode memory clusternode = ClusterNode(_clustername, ordinarynodes); 
      clusternodes[_basename].push(clusternode); 
  }

}
