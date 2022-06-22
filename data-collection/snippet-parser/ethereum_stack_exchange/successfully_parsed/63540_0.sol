contract SimpleStorage { 
    mapping(address => string) public Usersdata; 
    function Storedata(string data) public { 
        Usersdata[msg.sender] = data; 
    } 

    function getData() public view returns (string) { 
        return Usersdata[msg.sender]; 
    } 
}
