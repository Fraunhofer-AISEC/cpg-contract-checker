pragma solidity ^0.4.24;
import "../node_modules/zeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
contract TokenExchange{
  enum State {OPEN, FILLED, CLOSED, CANCELED}
  struct Order {
    uint id;
    State state;
    address buyer;
    address seller;
    uint antAmmount;
    uint daiAmmount;
  }
  ERC20 public token1;
  ERC20 public token2;
  mapping (uint => Order) public globalOrders;      
  uint private nextOrderId;
  constructor () public {
      token1 = ERC20(0x1111111111111111111111111111111111111111); 
      token2 = ERC20(0x2222222222222222222222222222222222222222); 
  }
  function createBuyOrder(uint _buyAmmount, uint _sellAmmount) external payable {
    uint deposit = _buyAmmount.div(2);    

    

    Order memory newOrder = Order({
            id: 0, 
            state: State.OPEN, 
            buyer: msg.sender, 
            seller: 0x0000000000000000000000000000000000000000, 
            token1Ammount: _buyAmmount, 
            token2Ammount: _sellAmmount 
        });
    globalOrders[nextBuyOrderId] = newOrder;
    nextBuyOrderId++;
  }
}
