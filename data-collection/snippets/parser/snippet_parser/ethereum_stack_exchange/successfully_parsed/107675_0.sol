
function nice(address to) public payable {
     require(_to.send(_value), ERROR_SEND_REVERTED);
}
