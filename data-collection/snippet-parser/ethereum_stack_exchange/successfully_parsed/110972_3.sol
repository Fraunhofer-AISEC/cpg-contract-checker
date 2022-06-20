pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract PaymentInvoiceSplit {
    uint productPrice;

    constructor (uint defaultProductPrice) {
        owner = msg.sender;
        productPrice = defaultProductPrice;
    }

    function payInvoice (uint invoiceId, address token) payable public {

    IERC20 paymentToken = IERC20(token);
    uint256 amountToPay;

      
      

    require(paymentToken.allowance(msg.sender, address(this)) >= amountToPay,"Insuficient Allowance");
    require(paymentToken.transferFrom(msg.sender,address(this),amountToPay),"transfer Failed");

      
      
      
    }

}
