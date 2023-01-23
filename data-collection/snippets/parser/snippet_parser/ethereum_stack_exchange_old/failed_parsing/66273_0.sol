pragma solidity ^0.4.20;

contract SimplePaymentChannel {
    address public sender;     
    address public recipient;  
    uint256 public expiration; 
    closes.

    function SimplePaymentChannel(address _recipient, uint256 duration)
        public
        payable
    {
        sender = msg.sender;
        recipient = _recipient;
        expiration = now + duration;
    }

    function isValidSignature(uint256 amount, bytes signature)
        internal
        view
        returns (bool)
    {
        bytes32 message = prefixed(keccak256(this, amount));

        
        return recoverSigner(message, signature) == sender;
    }

    
    
    
    function close(uint256 amount, bytes signature) public {
        require(msg.sender == recipient);
        require(isValidSignature(amount, signature));

        recipient.transfer(amount);
        selfdestruct(sender);
    }

    
    function extend(uint256 newExpiration) public {
        require(msg.sender == sender);
        require(newExpiration > expiration);

        expiration = newExpiration;
    }

    
    
    function claimTimeout() public {
        require(now >= expiration);
        selfdestruct(sender);
    }

    function splitSignature(bytes sig)
        internal
        pure
        returns (uint8, bytes32, bytes32)
    {
        require(sig.length == 65);

        bytes32 r;
        bytes32 s;
        uint8 v;

        assembly {
            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }

    function recoverSigner(bytes32 message, bytes sig)
        internal
        pure
        returns (address)
    {
        uint8 v;
        bytes32 r;
        bytes32 s;

        (v, r, s) = splitSignature(sig);

        return ecrecover(message, v, r, s);
    }

    
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256("\x19Ethereum Signed Message:\n32", hash);
    }
}
