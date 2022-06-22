 contract MasterContract{

struct Person
{

    uint Id;        
    string FirstName;
    string LastName;
    string FathersName;
    string HomeAdress;        
    string PhoneNumber;      
    string Username;
    string PersonalEmail;


}

mapping(uint => Person) public person;

uint public personsCount;

function addPerson( string _FirstName, string _LastName,  string _FathersName, string _HomeAdress,  string _PhoneNumber,  string _Username, string _PersonalEmail )
 private {
    personsCount ++;
    persons_fn[patientsCount]=Patient(patientsCount, _FirstName, _LastName, _FathersName, _HomeAdress,  _PhoneNumber, _Username, _PersonalEmail);
}


}
