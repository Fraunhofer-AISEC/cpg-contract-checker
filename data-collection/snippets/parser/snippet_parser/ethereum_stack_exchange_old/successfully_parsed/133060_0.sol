
 contract Reverter {
 
    function callAndRevert(address externalAddress, bytes  calldata data) public {
    
            
            externalAddress.call(data);
            address(this).delegatecall(data);

            
            revert ("Dont care I revert");
                
    }
}

