
pragma solidity 0.6.6;

import "./Ownable.sol";
import "./Safemath.sol";
import "./RandomNumberConsumer.sol";
contract MAIN is Ownable, RandomNumberConsumer(this) {
    [...]
    
    uint dnaDigits = 14;
    
    uint dnaModulus = 10 ** dnaDigits;
   
    
    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    function editDna(uint randomN, uint carId, bytes32 requestId) public {
        
        require(msg.sender == address(this));
        
        require(carsList[carId].requestIdProcessed == requestId);
        
        
        carsList[carId].carDna = randomN % dnaModulus;
        
        carsList[carId].requestIdProcessed = 0;
        
        emit NewCar(carId, carsList[carId].name, carsList[carId].carDna);
    }
    
    [...]
}
