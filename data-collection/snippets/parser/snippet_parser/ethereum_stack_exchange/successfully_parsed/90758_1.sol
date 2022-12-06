function encodeAddressArray(address[] calldata addresses) external pure returns(bytes memory data){
    for(uint i=0; i<addresses.length; i++){
        data = abi.encodePacked(data, addresses[i]);
    }
}
