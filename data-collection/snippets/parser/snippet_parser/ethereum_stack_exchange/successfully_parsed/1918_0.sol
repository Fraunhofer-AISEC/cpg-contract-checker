
struct User {
    bool isValid;
    uint netEtherReceived;  
    uint netEtherSent;      
    uint currentBalance;    
    
}
mapping (address => User) users

function receiveEther() {
    if (users[msg.sender].isValid == true) {
        users[msg.sender].netEtherReceived += msg.value;
        users[msg.sender].currentBalance += msg.value;
    }
}

