function Mint() notBroke external payable returns (uint256) {  

    require(msg.value >= 0.05 ether, 'You didnt pay enough Eth Buddy :/'); 

    return 1;
}
