
pragma solidity ^0.8.0;

contract CoveredCallContract {

    address public callWriter;
    address public callBuyer;
    uint public amount;
    uint public optionPrice;
    uint public strikePrice;
    uint public expiryDate;
    bool wasPurchased;
    bool optionExecuted;

    constructor(uint _amount, uint _optionPrice, uint _strikePrice) {
        callWriter = msg.sender;
        amount = _amount;
        optionPrice = _optionPrice;
        strikePrice = _strikePrice;
        expiryDate = block.timestamp + 1 weeks;
    }

    function setWasPurchased(bool _wasPurchased) public {
        wasPurchased = _wasPurchased;
    }

    function setOptionExecuted(bool _optionExecuted) public {
        optionExecuted = _optionExecuted;
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

    
    function executeOption(address _callBuyer) external payable {
        
        require(wasPurchased == true, "Option has not been purchased");
        
        require(optionExecuted == false, "you cannot execute an option twice");
        
        require(msg.sender == _callBuyer, "Unauthorized");
        
        require(address(this).balance == amount, "Funding error");
        
        require(msg.value == strikePrice, "Payment error");
        
        require(block.timestamp < expiryDate, "Option has already expired");
        
        payable(_callBuyer).transfer(address(this).balance);
        
        optionExecuted = true;
    }

    
    function refund() public payable {
        
        require(block.timestamp >= expiryDate, "Option has not expired yet");
        require(wasPurchased == false, "Option has already been purchased");    
        payable(callWriter).transfer((address(this).balance));
    }
}
