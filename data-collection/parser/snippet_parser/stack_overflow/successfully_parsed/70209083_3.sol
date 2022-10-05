contract Child {
    string public name;
    string public gender;

    constructor(string memory _name, string memory _gender) payable {
        name = _name;
        gender = _gender;
    }
}

contract Parent{

    Child public childContract; 

    function createChild(string memory _name, string memory _gender) public payable returns(Child) {
require(msg.value == 0.005 ether)
       childContract = new Child{value: msg.value}(_name, _gender); 
       return childContract;
    }
}
