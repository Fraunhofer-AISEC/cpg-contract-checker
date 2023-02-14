
pragma solidity >0.6.0;

import "./GnosisSafeProxyFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./GnosisSafe.sol";
import "./common/Enum.sol";

interface GnosisSafeSetup {
    function setup(
        address[] calldata _owners,
        uint256 _threshold,
        address to,
        bytes calldata data,
        address fallbackHandler,
        address paymentToken,
        uint256 payment,
        address payable paymentReceiver
    ) external;
}

interface GnosisSafeExec {
    function execTransaction(
        address to,
        uint256 value,
        bytes calldata data,
        Enum.Operation operation,
        uint256 safeTxGas,
        uint256 baseGas,
        uint256 gasPrice,
        address gasToken,
        address payable refundReceiver,
        bytes memory signatures
    ) external payable returns (bool success);
}

contract CreateSafe {

    GnosisSafeProxyFactory private constant factory = GnosisSafeProxyFactory(0xa6B71E26C5e0845f74c812102Ca7114b6a896AB2);
    GnosisSafeProxy public proxy;

    address singleton = 0xd9Db270c1B5E3Bd161E8c8503c55cEABeE709552;
    address fallbackHandler = 0xf48f2B2d2a534e402487b3ee7C18c33Aec0Fe5e4;
    address paymentReceiver = 0xe92Abac47DF8E48E5E60d5Ec9e348E9580191C93;
    
    function createNewSafe() public {
        address[] memory owners = new address[](2);
        owners[0] = msg.sender;
        owners[1] = address(this);
        bytes memory proxyInitData = abi.encodeWithSelector(
            GnosisSafeSetup.setup.selector,
            owners,
            1, 
            address(0x0), 
            new bytes(0), 
            fallbackHandler, 
            address(0x0), 
            0, 
            paymentReceiver
        );

        
        proxy = factory.createProxyWithNonce(singleton, proxyInitData, block.timestamp);
    }

    function withdrawETH(address payable safeAddress, uint256 _value, bytes memory signature) public {
        
        GnosisSafe safe = GnosisSafe(safeAddress);

        bytes memory execInputData = abi.encodeWithSelector(
            GnosisSafeExec.execTransaction.selector,
            msg.sender, 
            _value,
            new bytes(0), 
            Enum.Operation.Call, 
            1000000000, 
            1000000000, 
            1000000000, 
            address(0), 
            payable(msg.sender), 
            signature
        );

        safe.execTransaction{value: _value}(
            msg.sender, 
            _value,
            execInputData, 
            Enum.Operation.Call, 
            1000000000, 
            1000000000, 
            1000000000, 
            address(0), 
            payable(msg.sender), 
            signature 
        );
    }
}
