function insertPerson(
  bytes32 personAddress, 
  bytes32 email, 
  bytes32 fname,
  bytes32 lname) 
  public
  returns(uint index)
{
  if(isPerson(personAddress)) return; 
  persons[personAddress].email     = email;
  persons[personAddress].fname     = fname;
  persons[personAddress].lname     = lname;
  persons[personAddress].index     = personIndex.push(personAddress)-1;
  LogNewPerson(
    personAddress, 
    persons[personAddress].index, 
    email, 
    fname,
    lname);
  return personIndex.length-1;
}
