struct Voter {
       string name;
       uint8 age; 
       bool voted;
       address voterID;
       bool voterRStatus;
    }
    Voter[] public voters;
    
    mapping(address => Voter) voter;
    
    function voterRegistration(string memory _name,uint8 _age) public {
        require(voter[msg.sender].voterRStatus == false);
        voters.push(Voter(_name,_age,false,msg.sender,true));
    }    
