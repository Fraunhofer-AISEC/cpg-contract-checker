
pragma solidity ^0.8.0;

contract FactoryContract {
    
    address public owner = msg.sender;
    
    address [] public createdContracts;



    event ContractCreated(address contractAddress);
    
    function createContract(string memory _name, string memory _sr_number, string memory _branch, string memory _date, string memory _grade) public {
        
         address newContract = address(new Contract(msg.sender, _name, _sr_number, _branch,  _date, _grade));
         
         
         emit ContractCreated(newContract);
         
         createdContracts.push(newContract);
        
    }
    
    function getDeployedContracts() public view returns (address[] memory)
    {
     return createdContracts;
    }

    function getOwner() public view returns (address)
    {
     return msg.sender;
    }

    
}

contract  Contract  {
    address public owner;
    string public name;
    string public sr_number;
    string public branch;
    string public date; 
    string public grade;
    
    modifier onlyOwner() {
    require(msg.sender == owner);
    _;
        }
    
       constructor  (address _owner, string  memory _name, string memory _sr_number, string memory _branch, string memory _date, string memory _grade) {
        owner = _owner;
        name = _name;
        sr_number=_sr_number;
        branch = _branch;
        date = _date;
        grade = _grade;

        }

        
    function getName() public view returns (string memory)
    {
     return name;
    }

}
