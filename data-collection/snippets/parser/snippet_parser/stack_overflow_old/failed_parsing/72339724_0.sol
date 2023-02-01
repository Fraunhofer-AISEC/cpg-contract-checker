function setName(string memory name) return (string){
names[msg.sender] = name
return names[msg.sender]
}
