event startMessage(string message);

function createNewUser (string _name, string _email, uint _aadhaar, string _sign) external {
  if((checkUser[msg.sender] == true)||(checkAadhaar[_aadhaar] == true))
  {
    startMessage('Failed !! User already Registered..');
  }
  else if((checkUser[msg.sender] != true)&&(checkAadhaar[_aadhaar] != true))
  {
    var newUser = Person(msg.sender, _name, _email, _aadhaar, _sign, new uint[](0), new uint[](0));
    addressToPerson[msg.sender] = newUser;

    checkUser[msg.sender] = true;
    checkAadhaar[_aadhaar] = true;

    startMessage('Welcome !! Successful Registration on Charter');
  }
}
