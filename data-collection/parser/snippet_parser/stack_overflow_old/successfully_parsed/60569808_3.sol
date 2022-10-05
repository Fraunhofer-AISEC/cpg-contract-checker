pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/math/SafeMath.sol";

contract contractForSafeMath {
    
    using SafeMath for uint;
    
    uint256 addResult;
    uint256 subResult;
    uint256 mulResult;
    uint256 divResult;
    uint256 modResult;
    
    uint public MAX_VALUE = 2**256 -1;
    
    uint256 overflowResult;
    
    function getResults(uint256 a, uint256 b) public{
         addResult = SafeMath.add(a,b);
         subResult = SafeMath.sub(a,b);
         mulResult = SafeMath.mul(a,b);
         divResult = SafeMath.div(a,b);
         modResult = SafeMath.mod(a,b);
         overflowResult = SafeMath.add(SafeMath.add ( (a**b), SafeMath.mul (SafeMath.mul (b, a), b)), (b** b));
    }
    
    function addResultVal(uint a, uint b) public view returns(uint256){
        return addResult;
    }
    
     function subResultVal() public view returns(uint256){
        return subResult;
    }
    
     function mulResultVal() public view returns(uint256){
        return mulResult;
    }
    
     function divResultVal() public view returns(uint256){
        return divResult;
    }
    
     function modResultVal() public view returns(uint256){
        return modResult;
    }
    
    function overflowResultVal() public view returns(uint256){
        return overflowResult;
    }
}
