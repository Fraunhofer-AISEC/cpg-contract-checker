pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract InsuranceAgreement {
    
    
    
    address public master=0xbCCc6A9926455a43EB72700fA99BD4A98ba6A087;  

    
    address USDCAddress = 0xE097d6B3100777DC31B34dC2c58fB524C2e76921; 

    
    address public buyerAddr;
    
    address public sellerAddr;
    
    
    
    uint256 premiumRequired;
    
    uint256 payoutRequired;
    
    uint256 duration;

    
    
    uint256 premium;
    
    uint256 payout;

    
    
    uint256 finalizedTime;
    
    uint256 initializedTime;
    
    uint256 lastWithdrewPremium;


    
    
    bool buyerCancel;
    
    bool sellerCancel;


    
    constructor(address _sellerAddr, uint256 _duration, uint256 _premiumRequired, uint256 _payoutRequired) {
        
        require(_premiumRequired>0, "Premium must be greater than 0");
        require(_payoutRequired>0, "Payout must be greater than 0");
        require(_duration>0, "Duration must be greater than 0");
        
        buyerAddr = msg.sender;
        sellerAddr = _sellerAddr;
        
        duration = _duration;
        premiumRequired = _premiumRequired;
        payoutRequired = _payoutRequired;
        
    }
    
    
    event TimeStamp(uint256 value);
    event NumTokens(uint256 value);
    event Address(address value);
    event Succeeded(bool value);

    
    modifier onlyMaster() {
        require(msg.sender == master, "You are not the master");
        _;
    }
    
    modifier requireSeller(){
        require(msg.sender==sellerAddr, "You are not the seller");
        _;
    }
    
    modifier requireBuyer(){
        require(msg.sender==buyerAddr, "You are not the buyer");
        _;
    }
    modifier requireFinalizationPeriodNotExpired(){
        require(block.timestamp-initializedTime<=60*60*24*2, "Finalization period already expired");
        _;
    }
    modifier requireAgreementNotOver(){
        require(block.timestamp-finalizedTime<duration, "Agreement duration already over");
        _;
    }
    
    modifier requireFinalized(){
        require(finalizedTime>0, "Agreement not yet finalized");
        _;
    }

       
       

    
    function depositPremium() external requireBuyer {
        
         
         uint256 allowance = IERC20(USDCAddress).allowance(msg.sender, address(this));
         emit NumTokens(allowance); 
       require(allowance>=premiumRequired, "Insufficient USDC allowance");
        
    }

    
    function depositPayout() external requireFinalizationPeriodNotExpired requireSeller {
        
        require(premium==premiumRequired,"Premium not yet deposited");
        require(IERC20(USDCAddress).allowance(msg.sender, address(this)) >= payoutRequired, "Insufficient USDC allowance");
        require(IERC20(USDCAddress).transferFrom(msg.sender, address(this), payoutRequired), "Failed to transfer USDC payout");
        require(payout==0,"Payout already locked in");
        
        payout+=payoutRequired;
        finalizedTime=block.timestamp;
        lastWithdrewPremium=block.timestamp;
    }

}
