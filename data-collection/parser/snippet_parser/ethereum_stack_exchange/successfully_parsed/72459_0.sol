
pragma solidity >=0.4.0 <0.7.0;

contract NewHello{
    address owner;
    
    constructor()public{
        owner = msg.sender;
    }
    
    modifier onlyOwner (){
        require(msg.sender == owner);
        _;
    }
    
    struct user{
        string name;
        string surname;
        uint age;
    }
    
    user[] new_user;
    mapping(address => string) public users; 
    
    function updateUser(address _address, string memory name,string memory surname,uint age) public onlyOwner {
        user memory new_user = user(name,surname,age);
        users[_address] = user(name,surname,age);
        
    }
    function getUser(address _address) public view returns(string memory name ,string memory surname,uint age) {
        
        return (users[_address].name,users[_address].surname,users[_address].age); 
    }
}
