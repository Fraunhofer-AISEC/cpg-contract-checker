contract Parents {
    string public childName;
    Child child;
    function Parents(address _childAddress){
        child = Child(_childAddress);
        childName = child.name();  
    }
}
