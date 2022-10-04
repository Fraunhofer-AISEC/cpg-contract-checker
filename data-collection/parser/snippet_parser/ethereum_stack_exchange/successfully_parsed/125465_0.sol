
pragma solidity >0.6.0;

import "./GnosisSafeProxyFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./GnosisSafe.sol";

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

contract CreateSafe {

    GnosisSafeProxyFactory private constant factory = GnosisSafeProxyFactory(0xa6B71E26C5e0845f74c812102Ca7114b6a896AB2);
    GnosisSafeProxy public proxy;

    address singleton = 0xd9Db270c1B5E3Bd161E8c8503c55cEABeE709552;
    address fallbackHandler = 0xf48f2B2d2a534e402487b3ee7C18c33Aec0Fe5e4;
    address paymentReceiver = 0xe92Abac47DF8E48E5E60d5Ec9e348E9580191C93;
    
    function createNewSafe() public {
        address[] memory owners = new address[](1);
        owners[0] = msg.sender;
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

    function withdrawETH(address payable safeAddress, uint256 _value) public {
        
        GnosisSafe safe = GnosisSafe(safeAddress);

        safe.execTransaction{value: _value}(
            msg.sender, 
            _value,
            new bytes(0), 
            0, 
            0, 
            0, 
            0, 
            address(0), 
            payable(msg.sender), 
            "SIGNATURE" 
        );
    }
}
