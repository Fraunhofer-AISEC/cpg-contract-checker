contract SomeTest {
    

    modifier requiresFee(uint fee) {
        if (msg.value < fee) { throw; }
        _
    }

    function sellEnergy(uint kwh) public requiresFee(0.001 ether) {
        coinAccount[msg.sender] += (kwh * kWh_rate);
    }
}
