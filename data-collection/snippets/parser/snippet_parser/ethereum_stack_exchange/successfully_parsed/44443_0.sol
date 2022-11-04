contract Test{


  struct Node{
    uint x;
    uint linked; 
    bool    nil;

  }
  Node [] public nodes;


  function Test(){
      nodes.push(Node(59,1,false));
      nodes.push(Node(100,2,false));
      nodes.push(Node(0,0,true));
  }


  function remove(uint nodeIdx){
      Node node = nodes[nodeIdx];
      Node linked = nodes[node.linked];
  }



}
