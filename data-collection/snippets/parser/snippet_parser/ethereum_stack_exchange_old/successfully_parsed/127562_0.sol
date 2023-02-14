
pragma solidity ^0.8.0;

import "./ERC2771Context.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "./ERC1155PresetMinterPauser.sol";


contract TestingContract is ERC2771Context , ERC1155PresetMinterPauser{

    constructor (address _t) public ERC2771Context(_t) {
        
    }
    function versionRecipient() external  virtual view returns (string memory){
        return "1";
    }

}
