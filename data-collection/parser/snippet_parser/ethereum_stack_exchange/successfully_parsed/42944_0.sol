string your_secret_value

function setSecret(string s) public {
             your_secret_value = s;
} 

function getSecret() public constant returns (string s) {
             return XOR(msg.sender, your_secret_value);

} 
