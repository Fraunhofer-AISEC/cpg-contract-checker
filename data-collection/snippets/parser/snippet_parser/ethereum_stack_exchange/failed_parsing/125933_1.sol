contract NodeBST is Node{

    function add(Node _newNode) public returns (Node){
        if (address(this) < _newNode.getAddress()){
            __left = add(_newNode);
        }
        else if (address(this) > _newNode.getAddress()){
            __right = add(_newNode);
        }
        else{
            return _newNode;
        }
        return _newNode;
    }
(...)
