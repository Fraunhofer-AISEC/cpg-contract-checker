pragma solidity ^0.4.24;
contract XXXX{
    address  owner;
    constructor()public
    {
        owner=msg.sender;

    }
        struct Project
        {


            string  proName;
            string  proDetails;
            uint  proPrice;
            address  proOwner;

        }
        Project [] public  pros;
        mapping (address => Project) public enrolled;

    function ProjectDetails(uint _price, string _name,string _projectDetails) public 
    
    {
        require(msg.sender!=owner);
        

        Project memory newPro = Project
        ({
            proPrice:_price,
            proOwner:msg.sender,
            proDetails:_projectDetails,
            proName:_name

            });
            pros.push(newPro);

            enrolled[msg.sender]=newPro;

    }
}
