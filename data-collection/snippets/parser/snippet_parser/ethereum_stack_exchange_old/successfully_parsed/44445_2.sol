contract Test {

  struct Node{
    uint x;
    uint linked; 
    bool nil;
  }

  mapping (uint => Node) nodes;

  function Test(){
      nodes[0] = Node(59,1,false);
  }

  function test1(){
      nodes[0].x = 6;
      nodes[0].linked = 2;
      nodes[0].nil = true;
  }

  function test2(){
      Node storage node = nodes[0];
      node.x = 6;
      node.linked = 2;
      node.nil = true;
  }
}
