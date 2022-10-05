pragma solidity ^0.4.17;

contract TrafficFine{
    struct Officer {
        string firstName ;
        string lastName;
        address account;
    }

    address public manager;
    uint public numberOfOffiers;


    mapping(address=>Officer) public officers;

    modifier restricted(){
        require(msg.sender == manager);      
        _;
    }

    constructor () public{
        manager = msg.sender;
    }



    function addOfficer(
        string firstName,
        string lastName,
        address officer) public  restricted{

        require(officer!=officers[officer].account);

        Officer  memory newOfficer = Officer({
            firstName:firstName,
            lastName:lastName,
            account:officer
        });

        officers[officer] = newOfficer;
        numberOfOffiers++;
    }



    function getofficer(address officer) public view returns(address){
        address officer1= officers[officer].account;
        return officer1;
    }


}
