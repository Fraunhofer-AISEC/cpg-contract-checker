contract FormSubmit{

  struct Student {
  string  email;
  string  password;
  string  address1;
  string  address2;
  string  city;
  string  state;
  string  zip;
  }

  mapping(address => Student) Students;

 function setData(address _address, string memory _email, string memory     _password,
string memory _address1, string memory _address2, string memory _city, string memory _state,
string memory _zip) public
{

  Students[_address].email = _email;
  Students[_address].password = _password;
  Students[_address].address1 = _address1;
  Students[_address].address2 = _address2;
  Students[_address].city = _city;
  Students[_address].state = _state;
  Students[_address].zip =_zip;
}

function getData(address _address) public view returns(string memory, string memory, string memory, string memory, string memory, string memory, string memory){
  return(Students[_address].email, 
  Students[_address].password,
  Students[_address].address1, 
  Students[_address].address2, 
  Students[_address].city, 
  Students[_address].state, 
  Students[_address].zip);
}}
