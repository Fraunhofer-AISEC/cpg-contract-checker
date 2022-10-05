contract NameChange {

string public name;

function changeName(string calldata new) external returns (bool) {
name = new;
return true;
} 

}
