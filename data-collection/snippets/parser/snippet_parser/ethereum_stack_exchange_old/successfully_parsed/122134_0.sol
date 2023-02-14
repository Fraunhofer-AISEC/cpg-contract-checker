pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken is ERC20{
    constructor(uint256 initialSupply) ERC20("SimpleToken", "ALPH") {
        _mint(msg.sender, initialSupply);
    }

    FFA[] public FFAArray;


    struct FFA
    {
        string Name;
        address Creator;
        address Wallet;
        uint8 entryFee;
        uint256 maxentries;
        uint8 validatorReward;
    }


    function CreateFFA(string memory _Name,uint256 _maxentries,uint256 _entryFee,uint8 _validatorReward) public
    {
        FFAArray.push(_Name,msg.sender,msg.sender,_entryFee,_maxentries,_validatorReward);
    }
} 
