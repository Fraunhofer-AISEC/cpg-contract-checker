contract PayTest {
function() public payable {
}

function withdraw() {
    msg.sender.transfer(4000000000 wei);
}
}