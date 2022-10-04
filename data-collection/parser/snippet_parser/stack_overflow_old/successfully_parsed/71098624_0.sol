
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Factory is Ownable {
    event NewChildingContract(address children);
    
    constructor() {}

    function deployChild(
        uint256 _startBlock,
        address _admin
    ) external onlyOwner {
        
        bytes memory bytecode = type(Children).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(_startBlock));
        address childrenAddress;

        assembly {
            childrenAddress := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }

        Children(childrenAddress).initialize(
            _startBlock,
            _admin
        );

        emit NewChildrenContract(childrenAddress);
    }
}


contract Children is OwnableUpgradeable {
    address public FACTORY;

    
    uint256 public startBlock;

    
    constructor() {
        FACTORY = msg.sender;
    }

    function initialize(
        uint256 _startBlock,
        address _admin
    ) external {
        require(msg.sender == FACTORY, "Not factory");

        
        OwnableUpgradeable.__Ownable_init();
        
        
        startBlock = block.number > _startBlock? block.number : _startBlock;
        
        
        transferOwnership(_admin);
    }
}
