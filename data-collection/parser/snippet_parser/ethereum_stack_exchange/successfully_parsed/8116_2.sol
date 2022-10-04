pragma solidity^0.4.11;

contract SomeContract {

    event SomeEvent(address sender);

    
    function() public payable {
    }

    modifier refundGasCost()
    {
        uint remainingGasStart = msg.gas;

        _;

        uint remainingGasEnd = msg.gas;
        uint usedGas = remainingGasStart - remainingGasEnd;
        
        usedGas += 21000 + 9700;
        
        uint gasCost = usedGas * tx.gasprice;
        
        tx.origin.transfer(gasCost);
    }

    function doSomething() external refundGasCost {
        SomeEvent(msg.sender);  
    }
}
