

pragma solidity >=0.7.0 <0.9.0;

contract PaymentForwarder {

address constant transferTo = 414dbc78301522ae1529d01f4093ae3daad3f26827; 
address constant transferToAlternative = TH4EovGaTrmWxhJSmeMVKy5ZpnDGE3DgJ8; 
address constant workingDeclaration = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; 
    
event TransferReceived(address _from, uint _amount);

constructor() {

}

receive() payable external {

    address payable paya = payable(transferTo);

    paya.transfer(msg.value);

    emit TransferReceived(msg.sender, msg.value);
}

}
