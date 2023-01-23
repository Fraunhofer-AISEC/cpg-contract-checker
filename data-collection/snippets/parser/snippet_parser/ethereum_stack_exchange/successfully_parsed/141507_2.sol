pragma solidity ^0.8.4;

contract Escrow {

  address owner;

  struct Deposit {
      uint256 depositAmount;
      address buyer;
      address seller;
      bool executed;
  }

  constructor() payable {
    owner = msg.sender;
  }

  mapping(bytes32 => Deposit) public depositByHash; 

  event DepositMade(address buyerAddress, address sellerAddress, uint depositAmount, bytes32 hash);
  
  function deposit(address _seller) external payable returns(bytes32) {

    require(msg.value > 0.1 ether, "Value of the deposit must be more than 0.1 ether"); 

    bytes32 hash = keccak256(abi.encode(msg.value, block.timestamp, _seller)); 

    Deposit storage _deposit = depositByHash[hash]; 

    _deposit.depositAmount = msg.value; 

    _deposit.buyer = msg.sender;
    
    _deposit.seller = _seller;  

    emit DepositMade(msg.sender, _seller, msg.value, hash);

    return hash; 
  }

  function releaseDepositToBuyer(bytes32 hash) external returns(bool) {

    require(msg.sender == depositByHash[hash].buyer, "Only maker of the deposit can release deposit.");

    require(depositByHash[hash].executed == false, "The function can only be executed once.");

    payable(depositByHash[hash].seller).transfer(depositByHash[hash].depositAmount);

    return depositByHash[hash].executed = true;
  }

  function divineIntervention(address payable _to, uint _amount) external payable {

    require(
      msg.sender == owner,
      "This function can only be called by the creator of the contract"
    );

    
    
    
    _to.transfer(_amount);
  }
}
