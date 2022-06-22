
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./NFT.sol";

    contract ERc is ERC20 {
        
    constructor() ERC20('','') {
            
        }
    
    function addInitialSupply(uint256 _initialSupply)  public {
            _mint(msg.sender, _initialSupply * 10 );
        }
        function fundIdea(address _author, uint value) public returns(bool){
             transfer(address(_author), value);
             return true;
        }
    }
