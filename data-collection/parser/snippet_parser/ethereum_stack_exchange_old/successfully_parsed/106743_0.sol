pragma solidity >= 0.6.12;
import "./SafeMath.sol";
import "./Ownable.sol";
import "./Context.sol";

contract Trail1 is Ownable {
    using SafeMath for uint256;
    mapping(string => uint[]) public Pairs;
    mapping(string => mapping(string => uint256)) public Orders;
    
    function AddPair(string memory Pair, bool Create)public onlyOwner{
        if(Create == true){
            Pairs["Futures"].push(Pair);
        }else{
        }
        
    }
}
