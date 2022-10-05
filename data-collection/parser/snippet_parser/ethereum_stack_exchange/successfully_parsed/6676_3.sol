contract SomeTest {
    

    modifier requiresFee() {
        if (msg.value < computeFee()) { throw; }
        _
    }

    
    function computeFee() internal returns (uint) {
        
    }

    function sellEnergy(uint kwh) public requiresFee() {
        coinAccount[msg.sender] += (kwh * kWh_rate);
    }
}
