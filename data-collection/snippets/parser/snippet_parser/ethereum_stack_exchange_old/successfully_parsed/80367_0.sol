struct Escrow {
     bytes16 contractID;

     uint256 sellingTokenAmt;
     uint256 feeAmtInSellingToken;
     uint256 arbitrationFees;
     uint256 paymentWindowInSeconds;
     uint256 contractLifespanInSec;
     uint256 disputeWindowInSeconds;


     uint256 buyingTokenAmt;
     uint256 buyerAddress1Amt;
     uint256 buyerAddress2Amt;
     uint256 buyerAddress3Amt;
     uint256 createdAt;
     uint256 updatedAt;
     uint256 disputedAt;

     address sellerAddress;
     address buyerAddress1;
     address buyerAddress2;
     address buyerAddress3;
     address feeAddress;
     address arbitratorAddress;
     address sellingToken;

     string buyingToken;
     bool isDisputed;
     bool createdBy;
     string sellerPaymentDetails;

}

function createEscrow(bytes16 _contractId, uint256[] calldata _intValues,
     string calldata _buyingToken,
     address[] calldata _addresses,
     address token,
     string calldata _sellerPaymentDetails
   ) payable external    {   
 bytes32 _tradeHash =  keccak256(abi.encodePacked(_contractId));
 Escrow storage escrow = escrows[_tradeHash]; 
 uint256 tokenBalance = ERC20Interface(token).balanceOf(msg.sender);

require(escrow.contractID!=_contractId, "Already in Trading.");
require (_intValues[0] > 0, "Please add valid amount");
require (_intValues[0] > 0, "Please add valid amount");
require(tokenBalance >=_intValues[0], "Insufficient balance.");
require(ERC20Interface(token).transferFrom(_addresses[0], address(this), _intValues[0]));

escrows[_tradeHash] = Escrow(_contractId, _intValues[0], _intValues[1], _intValues[2], _intValues[3], _intValues[4], _intValues[5],
_intValues[6], _intValues[7], _intValues[8], _intValues[9], now, now, now ,_addresses[0], _addresses[1], _addresses[2],
_addresses[3], _addresses[4], _addresses[5], token, _buyingToken, false, true, _sellerPaymentDetails);
totlaEscrows++;

  emit Created (_tradeHash);

}
