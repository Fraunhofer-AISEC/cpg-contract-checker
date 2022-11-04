contract TestPayable {
uint x;
uint y;





fallback() external payable { x = 1; y = msg.value; }



receive() external payable { x = 2; y = msg.value; }
}
