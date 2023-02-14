mapping(address => uint256) public balance;

constructor() {

}

function deposit (address _tokenAddress, uint256 _amount) payable public {

    
    IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);

    
    balance[msg.sender] += msg.value;

    
    
    
}
