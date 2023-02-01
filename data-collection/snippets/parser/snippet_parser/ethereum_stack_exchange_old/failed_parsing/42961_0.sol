mapping (address => string) members;
function isMember() constant returns bool() {
    return members[msg.sender] != "";
}

function register(string _name) {
    if (members[msg.sender] != "") {
        throw("Already registered");
    }

    
}
