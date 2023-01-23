pragma solidity ^0.4.17;

contract Bank{
    
    enum gender{MALE, FEMALE, OTHER}
    
    address manager;
    
    string bankName;
    
    mapping(address=>bool) account;
    
    struct Address{
        string line1;
        string line2;
        string city;
        string state;
        string pincode;
    }
    
    struct detail{
        string firstName;
        string lastName;
        uint8 age;
        gender Gen;
        Address addr;
    }
    
    detail[] Details;
    
    mapping(address=>detail) Info;
    
    function Bank(string _name) public{
        bankName = _name;
        manager = msg.sender;
    }
    
    modifier confirmer(){
        require(account[msg.sender] = false);
        _;
    } 
    
    function newAccount(string _firstname,
                        string _lastname,
                        uint8 age,
                        gender gen,
                        string Address_line1,
                        string Address_line2,
                        string city,
                        string state,
                        string pincode) confirmer public{
                            
            account[msg.sender] = true;
            Details.push(detail(_firstname,_lastname,age,gen,Address(Address_line1,Address_line2,city,state,pincode)));
            Info[msg.sender] = detail(_firstname,_lastname,age,gen,Address(Address_line1,Address_line2,city,state,pincode));
    }
    
    function showInfo() public view returns(string){
        return Info[msg.sender].firstName;
    }
}

