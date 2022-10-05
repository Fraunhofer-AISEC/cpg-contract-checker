contract InfoContract{
    string name;
    uint age;
    
    event Instructor(string indexed _name,uint indexed _age);
    
    function setInfo(string memory _name,uint _age) public {
        name = _name;
        age = _age;
        emit Instructor(_name , _age);
    }
    
    function getInfo() public view returns (string memory,uint){
        return (name,age);
    }
}
