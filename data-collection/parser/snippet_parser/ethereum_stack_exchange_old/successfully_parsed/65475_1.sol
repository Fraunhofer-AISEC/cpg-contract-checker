
contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes data, bool schedType) public payable returns (uint,address);

}

contract paymentCheck{
    Aion aion;

    function scheduleCheck() public {
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256('Check()')));
        uint callCost = 200000*1e9 + aion.serviceFee();
        aion.ScheduleCall.value(callCost)( block.timestamp + 30 days, address(this), 0, 200000, 1e9, data, true);
    }

    function Check(){
        
    } 
    function () public payable {}

}
