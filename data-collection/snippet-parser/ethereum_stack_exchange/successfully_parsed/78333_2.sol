library GraphLibrary {
  struct Graph {
    mapping (uint => mapping (uint => uint)) edges;
    mapping (uint => uint) sourceNodes;
    mapping (uint => uint) targetNodes;
    uint lastEdgeID;
  }

  function addEdge (Graph storage _graph, uint _sourceNodeID, uint _targetNodeID) external returns (uint) {
    require (_graph.edges [_sourceNodeID][_targetNodeID] == 0);

    uint edgeID = ++_graph.lastEdgeID;

    _graph.edges [_sourceNodeID][_targetNodeID] = edgeID;
    _graph.sourceNodes [edgeID] = _sourceNodeID;
    _graph.targetNodes [edgeID] = _targetNodeID;

    return edgeID;
  }

  function deleteEdge (Graph storage _graph, uint _sourceNodeID, uint _targetNodeID) external {
    uint edgeID = _graph.edges [_sourceNodeID][_targetNodeID];

    require (edgeID != 0);

    delete _graph.sourceNodes [edgeID];
    delete _graph.targetNodes [edgeID];
    delete _graph.edges [_sourceNodeID][_targetNodeID];
  }

  function deleteEdge (Graph storage _graph, uint _edgeID) external {
    require (_edgeID != 0);

    uint sourceNodeID = _graph.sourceNodes [_edgeID];
    uint targetNodeID = _graph.targetNodes [_edgeID];

    require (_graph.edges [sourceNodeID][targetNodeID] == _edgeID);

    delete _graph.sourceNodes [_edgeID];
    delete _graph.targetNodes [_edgeID];
    delete _graph.edges [sourceNodeID][targetNodeID];
  }
}
