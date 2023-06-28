pragma solidity 0.5.4;

contract A {

    modifier onlyValidAddresses(address[] memory pAddresses)
    {
        
        _;
    }    
}   

contract B is A {
    function checkIfIsValid(address[] calldata addresses)
        external pure onlyValidAddresses(addresses) 
    {
        
    }
}
