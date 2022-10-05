contract Adoption {

struct Dog {
    uint age;
    string name;
}

Dog[] public dogs;

function createDog(uint _age, string _name) public {
    dogs.push(Dog(_age, _name)) - 1;
}        
}