contract HashTest {

bytes32 public hashOutput;
uint public valueOut;

function hash(uint _values) {
    var value = _values; 
    valueOut = value;
    hashOutput = sha3(value);
}

function refund() {
   msg.sender.send(this.balance);
}
}
