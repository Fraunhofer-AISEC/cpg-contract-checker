pragma solidity ^0.8.13;
import {Clones} from "./Clones.sol";
import "./UniswapVault.sol";
import "./Initializable.sol";

contract UniVaultFactory {
    
    mapping(uint256 => address) public UniVaultAddresses;
    
    address public uniContract;
    uint256 public NofClones;
    
    constructor(address _uniContract) {
        uniContract = _uniContract;
        NofClones = 0;
    }
    
    function makeClone() public returns (address) {

        
        address newAddress = Clones.clone(uniContract);

        UniswapVault(newAddress).initializer( ??? );

        UniVaultAddresses[NofClones] = newAddress;
        NofClones += 1;
    }
}
