mapping (address => User) Users;
address[] usersByAddress;

struct User {
    string handle;
    bytes32 city;
    bytes32 state;
    bytes32 country;
}

function registerNewUser(string handle, bytes32 city, bytes32 state, bytes32 country) returns (bool success) {
    address thisNewAddress = msg.sender;
    if(bytes(Users[msg.sender].handle).length == 0 && bytes(handle).length != 0){
        Users[thisNewAddress].handle = handle;
        Users[thisNewAddress].city = city;
        Users[thisNewAddress].state = state;
        Users[thisNewAddress].country = country;
        usersByAddress.push(thisNewAddress);  
        return true;
    } else {
        return false;       
    }
  }


function getUsers() view returns (address[]) { return usersByAddress; }

function getUser(address userAddress) view returns (string, bytes32, bytes32, bytes32) {
    return (Users[userAddress].handle, Users[userAddress].city, Users[userAddress].state, Users[userAddress].country);
}
