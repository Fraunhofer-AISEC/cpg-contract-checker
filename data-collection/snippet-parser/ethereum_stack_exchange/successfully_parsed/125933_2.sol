function add_iter(Node _newNode) public payable {
    Node current = this; 

    while(true){ 
        if (_newNode < current){
            if (!current.getLeft().isNull()){
                current = __left;
            }
            else{
                current.setLeft(_newNode);
                break;
            }
        } 
        else if (_newNode >= current){
            if (!current.getRight().isNull()){
                current = __right;
            }
            else{
                current.setRight(_newNode);
                break;
            }
        }
        else{
            break;
        }
    }
}
