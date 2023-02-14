pragma solidity >= 0.4.0 < 0.6.0;

import "./ERC20.sol";
import "./ERC20Interface.sol";

contract Factory {
    address[] createdContract;
    mapping (address => uint256) contractNo;
    mapping (address => address) contractOwner;
    mapping (address => bool) isEIP20;
    address owner;

    event NewContractCreated(address newContractAddress, address contractCreator);

    constructor() public {
        owner = msg.sender;
    }

    function createNewContract() payable public returns(address) {
        ERC20 newContract = new ERC20();

        newContract.EIP20();
        createdContract.push(address(newContract));
        isEIP20[address(newContract)] = true;
        contractNo[msg.sender]++;
        contractOwner[address(newContract)] = msg.sender;

        emit NewContractCreated(address(newContract), msg.sender);
    }

    function transfer(address _to, address _contractAddress)  public returns (bool) {
        ERC20Interface contractUsed = ERC20Interface(_contractAddress);
        require(contractUsed.transfer(_to, 50));
        return true;
    }

    function ownedContract() public view returns(uint256) {
        return contractNo[msg.sender];
    }

    function ownerOfContract(address _contractAddress) public view returns(address) {
        return contractOwner[_contractAddress];
    }
}
