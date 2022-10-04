contract Child {
    string public name;
    string public gender;

    constructor(string memory _name, string memory _gender) {
        name = _name;
        gender = _gender;
    }
}

contract Parent {

    Child public childContract; 

    function createChild(string memory _name, string memory _gender) public returns(Child) {
       childContract = new Child(_name, _gender); 
       return childContract;
    }
}
