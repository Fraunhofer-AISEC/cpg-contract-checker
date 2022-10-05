function receiveApproval(
    address from, 
    uint256 _amount, 
    address _token, 
    bytes _data) public {

    
    ERC20(_token).transferFrom(from, this, _amount);

    
    
    bytes32 operationId = readOperationId(_data);
    emit ApprovedOperation(operationId);
}
