
pragma solidity ^0.8.0;

contract CoveredCallContract {

    address public callWriter;
    address public callBuyer;
    uint public amount;
    uint public optionPrice;
    uint public strikePrice;
    uint public expiryDate;
    bool wasPurchased;

    constructor(uint _amount, uint _optionPrice, uint _strikePrice) {
        callWriter = msg.sender;
        amount = _amount;
        optionPrice = _optionPrice;
        strikePrice = _strikePrice;
        expiryDate = block.timestamp + 1 weeks;
    }

    
    function depositCollateral() public payable {
        require(msg.value >= amount, " Insufficient balance");
    }

    
    function purchaseOption() external payable {
        
        require(wasPurchased == false);
        
        require(msg.value == optionPrice, "Incorrect purchase price");
        
        callBuyer = msg.sender;
        
        payable(callWriter).transfer(msg.value);
        
        wasPurchased = true;

    }

    
    function executeOption() external payable {
        
        require(wasPurchased == true);
        
        require(msg.sender == callBuyer, "Unauthorized");
        
        require(address(this).balance == amount, "Funding error");
        
        require(msg.value == strikePrice, "Payment error");
        
        require(block.timestamp < expiryDate, "Option has already expired");
        
        payable(callBuyer).transfer(address(this).balance);
    }

    
    function refund() public payable {
        if(wasPurchased == false) {
            require(block.timestamp >= expiryDate, "Option has not expired yet");    
        }
        payable(callWriter).transfer((address(this).balance));
    }
}
