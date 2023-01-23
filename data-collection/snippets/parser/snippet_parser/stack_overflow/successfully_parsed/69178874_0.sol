pragma solidity ^0.7.0;
    
    
    contract BuyToken {
      mapping(address => uint256) public balances;
      address payable wallet;
    
      event Purchase(
        address indexed buyer,
        uint256 amount
      );
    
      constructor(address payable _wallet) {
        wallet = _wallet;
      }
    
    
      fallback() external payable {
      }
    
    
      receive() external payable {
        buyToken();
      }
    
      function buyToken() public payable {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
      }
    }
