pragma solidity ^0.5.8;


contract Test
{

    struct Project 
    {
        bytes32  name ;
    }

    mapping (address => Project) projects ;

    constructor  () public {
    }

   function getProjectInfo(address addr) public view returns (string memory  name, string memory url, uint funds)
   {
       Project memory project = projects[addr];

   }        
}
