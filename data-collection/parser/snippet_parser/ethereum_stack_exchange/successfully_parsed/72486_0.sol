pragma solidity >=0.4.0 <0.7.0;

contract NewHello{ 

    address owner;
    address newOwner;

    constructor()public{
        owner = msg.sender;
    }

    modifier onlyOwner (){
        if(msg.sender != owner){
            require(msg.sender == newOwner);
            _;
        }
        else{
            require(msg.sender == owner);
            _;
        }

    }

    struct user{
        string name;
        string surname;
        uint age;
    }
     event infoChanged(
        string name,
        string surname,
        uint age
    );

    mapping(address => user) public users; 

    function setUser(string memory name,string memory surname,uint age) public payable{
        users[msg.sender] = user(name,surname,age);
        emit infoChanged(name,surname,age);
    }
    function setUserbyAdmin(address _address, string memory name,string memory surname,uint age) public payable onlyOwner{
        users[msg.sender] = user(name,surname,age);
        emit infoChanged(name,surname,age);
    }

    function getUser(address _address) public view returns(string memory name , string memory surname, uint age)  {

        return (users[_address].name,users[_address].surname,users[_address].age);        
    }
}
