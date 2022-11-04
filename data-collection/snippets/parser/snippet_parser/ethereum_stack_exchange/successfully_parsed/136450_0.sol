
pragma solidity ^0.8.13;

contract mypayable {

   
    address payable public owner;

    
    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

  uint deposit_count;
  mapping(bytes32 => uint256) balances;
  function getHash(uint amount) public view returns(bytes32 result){
    return keccak256(abi.encodePacked(msg.sender, deposit_count, amount,block.timestamp));
  }

  
  function transferto(address payable _to, bytes32 trx_hash, uint amount ) external {

    balances[trx_hash] = amount;
    deposit_count++;

      
    require(trx_hash[0] != 0, "Transaction hash cannot be empty!");
    
    require(amount != 0, "Escrow amount cannot be equal to 0.");

    
    require(balances[trx_hash] == 0, "Unique hash conflict, hash is already in use.");
    
    require(trx_hash[0] != 0, "Transaction hash cannot be empty!");
    
    require(balances[trx_hash] != 0, "Escrow with transaction hash doesn't exist.");
    
   
    (bool success, ) = _to.call{value: balances[trx_hash]}("");
        require(success, "Failed to send Ether");

    
    balances[trx_hash] = 0;
  }

    function withdraw() public {
        
        uint amount = address(this).balance;

        
        
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }


}

