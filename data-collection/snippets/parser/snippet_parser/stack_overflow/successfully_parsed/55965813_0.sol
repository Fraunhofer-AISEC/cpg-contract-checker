pragma solidity >=0.4.17;
import "./B.sol";
contract Registry is Owned {

    function createContract(
        address userAddress) 
        public
        returns(
            bool res
        )
    {
        
        B b = new B(userAddress);

        return true;
    }
}