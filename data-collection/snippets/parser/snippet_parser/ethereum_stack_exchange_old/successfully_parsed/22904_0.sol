contract owned {
    address public owner;
    mapping (address => bool) public permittedContracts;
    function owned(){
        owner = msg.sender;
    }
    modifier onlyOwner{
        if(msg.sender != owner){
            throw;
        }
        _;
    }
    function transferOwnership (address newOwner) onlyOwner{
        owner = newOwner;
    }
    function addPermittedContract(address newPermittedContract)onlyOwner{
        if(permittedContracts[newPermittedContract]==true){
            throw;
        }
        permittedContracts[newPermittedContract]=true;
    }
    function removePermittedContract(address oldPermittedContract)onlyOwner{
        if(permittedContracts[oldPermittedContract]!=true){
            throw;
        }
        permittedContracts[oldPermittedContract]=false;
    }
    modifier onlyPermittedContracts{
        if(permittedContracts[msg.sender]!= true){
            throw;
        }
        _;
    }
}

contract ExistingContract is owned{
    
    mapping (address=> uint) public balanceOf;
    function issueNewToken(address recipient, uint amount)onlyOwner onlyPermittedContracts{
        if(balanceOf[recipient]+amount<balanceOf[recipient]){throw;}
        balanceOf[recipient]+=amount;
    }
}
