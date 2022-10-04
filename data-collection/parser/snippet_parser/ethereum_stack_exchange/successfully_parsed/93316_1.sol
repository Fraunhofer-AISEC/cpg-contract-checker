
pragma solidity >0.6.99 <0.8.0;
pragma abicoder v2;

contract ReceiverPays {

address public _verifyingContract;

uint constant chainId = 4;

bytes32 public sigR;

bytes32 public sigS;

uint8  public sigV;

constructor() {
    _verifyingContract = address(this);
}

struct Cheque {
    address recipient;
    uint256 amount;
    uint256 nonce;
    address verifyingContract;
}


bytes32 public constant DOMAIN_TYPEHASH = keccak256(abi.encodePacked("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"));


bytes32 public constant CHEQUE_TYPEHASH = keccak256(abi.encodePacked("Cheque(address recipient,uint256 amount,uint256 nonce,address verifyingContract)"));

function claimPayment(address recipient, uint256 _amount,uint256 _nonce,bytes memory _signature) public returns (address payer) {

    bytes32 domainSeparator = keccak256(
        abi.encode(
            DOMAIN_TYPEHASH,
            keccak256(abi.encodePacked(
                bytes("Micro Payment"),bytes("1.0"),chainId,address(this)
            ))
        )
    );

    bytes32 structHash = keccak256(abi.encode(CHEQUE_TYPEHASH, recipient, _amount, _nonce));
    bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));

    (sigR, sigS, sigV) = splitSignature(_signature);

    return ecrecover(digest, sigV, sigR, sigS);
}

function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint8 v)
{
    require(sig.length == 65, "invalid signature length");

    assembly {
    

    
        r := mload(add(sig, 32))
    
        s := mload(add(sig, 64))
    
        v := byte(0, mload(add(sig, 96)))
    }

    return (r, s, v);
}

}
