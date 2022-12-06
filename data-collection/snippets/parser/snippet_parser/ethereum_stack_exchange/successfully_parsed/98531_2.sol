contract Test{
uint256 minRequiredUSD;
uint256 etherPriceUSD;
uint256 public minRequiredEther;

constructor() {
    minRequiredUSD = 50*10**18; 
    etherPriceUSD = 2000*10**18; 

    
    
    minRequiredEther = (minRequiredUSD*10**18)/etherPriceUSD; 
} 

event ReceivedEther(uint256 _amount);
function donate() public payable {
    require(msg.value > minRequireEther);
    emit ReceivedEther(msg.value);
}
}