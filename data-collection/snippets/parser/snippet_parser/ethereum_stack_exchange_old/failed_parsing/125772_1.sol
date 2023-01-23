mapping(address => uint) slippages;

function setSlippage(uint _slippage) public {
    slippages[msg.sender] = _slippage;

function deposit(uint256 assets, address receiver) public virtual returns (uint256 shares){

     
    uint slippage = slippages[msg.sender];
    uint amountWithSlippage = amount + (amount / slippage);
    

