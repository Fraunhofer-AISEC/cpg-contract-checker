contract Node{
    Node public __left; 
    Node public __right;  

    function getAddress() public view returns (address){return address(this);}
    function getLeft() public view returns (Node){return __left;}
    function getRight() public view returns (Node){return __right;}
    function setLeft(Node _curr) public {__left = _curr;}
    function setRight(Node _curr) public {__right = _curr;}

    function isNull() public view returns (bool){
        if (address(this) == address(0)) return true;
        return false;
    }
}
