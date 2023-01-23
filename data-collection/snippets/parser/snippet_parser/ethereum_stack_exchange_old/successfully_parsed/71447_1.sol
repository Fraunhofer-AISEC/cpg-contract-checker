function setData(string memory _email, string memory _password, string 
memory _address1,
string memory _address2, string memory _city, string memory _state, 
string memory _zip) public
{
  email = _email;
  password = _password;
  address1 = _address1;
  address2 = _address2;
  city = _city;
  state = _state;
  zip = _zip;
}
