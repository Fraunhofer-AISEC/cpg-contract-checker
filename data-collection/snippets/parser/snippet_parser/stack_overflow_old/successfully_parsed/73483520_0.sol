
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract SilverPack {

   event OperatorChanged (address previousOperator, address newOperator);
   event SilverPackTransferCompleted (address offerer, address receiver);

  
  address operator;

  constructor (address _operator) {
        operator = _operator;
    }

  

function saleBronce(address _offerer, address _hostContract, uint _tokenId1, uint _tokenId2, uint256 price) public payable {
    ERC1155 hostContract = ERC1155(_hostContract);
    require(msg.value >= price);     
    payable(msg.sender).transfer(price); 
    hostContract.safeTransferFrom(_offerer, msg.sender, _tokenId1, 1,"");
    hostContract.safeTransferFrom(_offerer, msg.sender, _tokenId2, 1,"");  
      
     emit SilverPackTransferCompleted(_offerer, msg.sender);
 }


  function changeOperator(address _newOperator) external {
        require(msg.sender == operator,"only the operator can change the current operator");
        address previousOperator = operator;
        operator = _newOperator;
        emit OperatorChanged(previousOperator, operator);
    }

}
