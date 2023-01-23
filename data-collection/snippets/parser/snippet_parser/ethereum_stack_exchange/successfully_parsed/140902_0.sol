mapping(address => uint256) public balance;


constructor() {

}

function deposit (address _tokenAddress) payable public {
    IERC20(_tokenAddress).transferFrom(msg.sender, address(this), msg.value);
    balance[msg.sender] += msg.value;
}
