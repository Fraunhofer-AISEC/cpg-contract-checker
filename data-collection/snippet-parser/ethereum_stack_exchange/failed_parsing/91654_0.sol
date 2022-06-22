pragma ^0.7.0

interface ERC20Token {
   function transfer(address recipient, uint256 amount) external returns (bool);
   function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
 }

contract MyContract {
  ...
  function depositEscrow(uint256 _value) payable external  returns (bool) {
        ...
        ERC20Token _fex = ERC20Token(contractFEX);  
        _fex.transferFrom(msg.sender, address(this), value);  
        ... 
        return true;
    }
