pragma solidity 0.5.1;


contract ETHPriceContract{ function getETHPrice() public view returns(bytes32);} 

contract CallerPriceRequest{
    
    uint256 public price;

    ETHPriceContract internal ETHPriceOracle;
 
    function initETHPrice(address ETHPriceAddress) public {
        ETHPriceOracle = ETHPriceContract( ETHPriceAddress );
    }
    
    function getETHPrice() public{
        ETHPriceOracle.getETHPrice();
    }
    
    function CallerFulfill(bytes32 _requestId, uint256 _price) public{
        price = _price;
    } 
}
