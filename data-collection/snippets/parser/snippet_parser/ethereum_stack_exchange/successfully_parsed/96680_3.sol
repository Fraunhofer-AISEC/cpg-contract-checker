pragma solidity ^0.8.1;
import "./A.sol";

contract B {

    address addressA;
    
    function setAddressA(address _addressA) external{
        addressA = _addressA;
    }
    
    function setp(uint studentid,  address _newStudentAddress) external {
        A a = A(addressA);
        
        a.changeAddress(studentid,_newStudentAddress);
    }
}  
