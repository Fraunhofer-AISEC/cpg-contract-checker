mapping(uint -> User)
type User struct {
   string name;
   string address;
   uint age;
}
function getUser(uint key) public constant returns(string,address, uint) {
     return (users[key].name, users[key].address, users[key].age;
}
