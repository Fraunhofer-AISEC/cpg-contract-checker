contract Person {

uint public dateCreate;


string public name;


string public email;

string public phone;


function Person(string _name, string _email, string _phone) public {
    name = _name;
    email = _email;
    phone = _phone;
    owner = msg.sender;
}
}
