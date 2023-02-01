function getUser(uint _id) public constant returns(uint,string,string,uint,uint) {

  User memory c = users[_id];

  return(
  c.id,
  c.name,
  c.class,
  c.age,
  c.pincode);
}
