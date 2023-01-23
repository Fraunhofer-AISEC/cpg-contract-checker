
pragma solidity>0.1.6<0.6.0;

contract DataLocationHashC {


    struct DataUser {
    
    bool authorized; 
    bool reqhash; 
    string hashreq;
    uint reqquant;
    }


        string DescrptionHash;
        uint HashValue;



    address public owner;

    string public description;

    mapping( address => DataUser)  datauser;  




    constructor  (string memory _description) public {
        owner = msg.sender; 
        description = _description;
        
    }




    modifier ownerOnly() {
    require(msg.sender == owner);
    _; 
    
    }



    
    
    function authorizePerson(address _person) ownerOnly public {
        datauser[_person].authorized = true;
    
    }

    

    function addHash(uint _ActualHash) ownerOnly public {




            HashValue = _ActualHash;

    }

      function RequestHash() public constant returns(uint ){

        
        require(datauser[msg.sender].authorized);

        datauser[msg.sender].hashreq = description;
        datauser[msg.sender].reqhash = true;

       return (HashValue);


    }

    
    function end() ownerOnly public {
        selfdestruct(msg.sender);

        
    }


}

