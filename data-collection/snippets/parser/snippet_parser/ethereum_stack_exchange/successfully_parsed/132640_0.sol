
pragma solidity ^0.8.7;

contract Crud {
    uint256 private age;
    string public name = "";
    

    
    
    

    function createForm(
        uint256 _age,
        string memory _name
        
    ) public {
        age = _age;
        name = _name;
        
    }

    function deleteForm() public {
        delete age;
        delete name;
    }

    function getForm()
        public
        view
        returns (
            uint256,
            string memory 
        )
    {
        return (age, name );
    }
}
