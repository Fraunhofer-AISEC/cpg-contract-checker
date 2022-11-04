function buy_token(string memory tokenURI, bytes memory signature) payable public{

    
    
    
    address signer_address = recoverSigner(keccak256(abi.encodePacked(tokenURI, msg.sender)), signature); 
    require(signer_address == minter, "NFT not authorized by this contract");
    
    require(msg.value >= cprice, "Insufficient funds to buy");

    require(minter != msg.sender, "Cant sell to owner");

    uint256 mint_id = mint(tokenURI);
    
      
    _transfer(minter, msg.sender, mint_id);
}


function recoverSigner(bytes32 message, bytes memory sig)
   public
   pure
   returns (address)
{
   uint8 v;
   bytes32 r;
   bytes32 s;
   (v, r, s) = splitSignature(sig);
   return ecrecover(message, v, r, s);
}
function splitSignature(bytes memory sig)
    public
    pure
    returns (uint8, bytes32, bytes32)
{
    require(sig.length == 65, 'Wrong byte lenght');
    
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
