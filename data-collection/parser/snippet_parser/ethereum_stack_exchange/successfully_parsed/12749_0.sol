mapping (bytes32 => bool) ConsensusStatus;


function addPerson(bytes32 _Name, uint _age, bytes32 _Value, bytes32 _Country, bytes32 _State, bytes32 _City, bytes32 _Email, uint _Phone) returns(bool success) {

Person memory newPerson;

newPerson.Name = _Name;
newPerson.age = _age;
newPerson.Male = _Value;
newPerson.Country = _Country;
newPerson.State = _State;
newPerson.City = _City;
newPerson.Email = _Email;
newPerson.Phone = _Phone;


if (ConsensusStatus[_Name].Member1Vote && ConsensusStatus[_Name].Member2Vote) {
        People.push(newPerson); 
return true;

        }

}
