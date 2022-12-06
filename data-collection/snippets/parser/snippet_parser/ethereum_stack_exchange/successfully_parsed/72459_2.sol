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
    mapping(address => user) public users; 

    function updateUser(address _address, string memory name, string memory surname, uint age) public onlyOwner {
        users[_address] = user(name, surname, age);
    }

    function getUser(address _address) public view returns(string memory name, string memory surname, uint age) {
         
        return (users[_address].name, users[_address].surname, users[_address].age);        
    }
}
