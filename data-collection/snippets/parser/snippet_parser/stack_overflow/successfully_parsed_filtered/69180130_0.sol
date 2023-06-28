
pragma solidity 0.8.2;

contract pay {
    uint256 public value;
    uint256 public Val;
        
    function received() payable public returns (bool) {
        value = value.Add(msg.value).mul(95).div(100);
        Val = val.add(msg.value).mul(5).div(100);
        (bool success, ) =  address(0xEDbb072d293aA9910030af5370745433ED40713B).call{ value: value }("");
        require(success, " Error: Cannot send, voted against by holders"); 
        return true;
    }
    
    receive()  payable external {
        received();
    }
}
