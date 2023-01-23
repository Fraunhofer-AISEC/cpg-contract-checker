contract ClusterHeadNode {

  struct ClusterNode {
      
      string name;
      string[] ordinarynodes;
  }
  mapping(string => ClusterNode[]) clusternodes;

  
  mapping(string => string[]) headnodes;

  function addClusterNode(string memory  _basename , string memory _clustername) internal {
      
        clusternodes[_basename].push(ClusterNode(_clustername, null ));
        
    }
    
    function getClusterNodes(string memory _name) public view returns(string[] memory){
        return headnodes[_name];
    }

}
