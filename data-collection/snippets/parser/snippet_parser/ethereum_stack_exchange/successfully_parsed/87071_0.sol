pragma solidity ^0.5.0;
import "./GSNRecipient.sol";
contract Counter is GSNRecipientUpgradeSafe
{
    int public value;
    
    function addValue()
        external
    {
        value++;
    }
    
    function start()
        external
    {
        __GSNRecipient_init();
    }
    
    function acceptRelayedCall(
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    )
        external
        view
        returns (uint256, bytes memory)
    {
        return _approveRelayedCall();
    }

    function _preRelayedCall(bytes memory context) internal returns (bytes32)
    {

    }

    function _postRelayedCall(bytes memory context, bool success, uint256 actualCharge, bytes32 preRetVal) internal
    {
        
    }
}
