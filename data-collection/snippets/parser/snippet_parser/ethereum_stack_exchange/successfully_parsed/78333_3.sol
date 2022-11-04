contract Foo {
  using GraphLibrary for GraphLibrary.Graph;

  GraphLibrary.Graph public graph;

  
  function insertNode (uint a, uint b, uint c) public {
    graph.deleteEdge (a, b);
    graph.addEdge (a, c);
    graph.addEdge (c, b);
  }
}
