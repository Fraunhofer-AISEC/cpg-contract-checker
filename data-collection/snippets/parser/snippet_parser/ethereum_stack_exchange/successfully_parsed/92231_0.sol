User[] public users;

function set_User(uint _id, string _name, string _address, uint _salary) public view returns(uint) {
    users.length++;
    
    users[users.length-1].salaryId = _id;
    users[users.length-1].name = _name;
    users[users.length-1].userAddress = _address;
    users[users.length-1].salary = _salary;
    
  
    return users.length;
    
}

function get_User(uint _id) public view returns(uint, string, string, uint,uint) {
    return(users[_id].salaryId, users[_id].name, users[_id].userAddress, users[_id].salary, _id);
}
