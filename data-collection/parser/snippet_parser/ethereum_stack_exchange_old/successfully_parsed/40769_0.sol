function method(string param) payable external {
 Debug(param, msg.sender, msg.value, msg.data);
}
