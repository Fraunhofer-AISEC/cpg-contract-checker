pragma solidity ^0.5.0;

contract Verify{
    address owner ; 
    mapping (uint256 => bool) public usedNonces;

    constructor() public {
        owner = msg.sender ;
    }

    function withdraw(uint256 nonce , address recipientAddress , uint256 tokens, bytes memory signature) public {
        require(!usedNonces[nonce]);
        usedNonces[nonce] = true ;
        bool done ; 
        done = isValidSignature( recipientAddress , nonce , tokens  , signature );
        emit Success(done);
    }
    event Success(bool done);


    function isValidSignature(address recipient , uint256 nonce , uint256 amount, bytes memory signature)
        internal
        view
        returns (bool)
    {

        bytes32 message = keccak256(abi.encodePacked(recipient , address(this), nonce, amount));
        return recoverSigner(message, signature) == owner ;
    }

    function splitSignature(bytes memory sig)
        internal
        pure
        returns (uint8 v, bytes32 r, bytes32 s)
    {
        require(sig.length == 65 , "invalid length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
        if (v < 27) {
            v += 27;
        }

        require(v == 27 || v == 28);
        return (v, r, s);
    }

    function recoverSigner(bytes32 message, bytes memory sig)
        internal 
        pure
        returns (address)
    {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(sig);
        return ecrecover(message, v, r, s);
    }
}
