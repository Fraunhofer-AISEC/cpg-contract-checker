function newCookie(string memory _name)
  public
  returns(Cookie newContract)
{
  newContract = new Cookie(_name);
  contracts.push(address(newContract));
  return newContract;
}
