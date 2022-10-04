contract Game {

    event PaidToGame(address to, uint256 amount);
    event PaidToInvestor(address to, uint256 amount);

    address public commission_1_holder = 0xBCC26F87;
    address public commission_2_holder = 0xBCC26F98;

    receive() payable external  {
        uint256 eth_amount = msg.value;
        uint256 shareX = eth_amount/2;
        payable(commission_1_holder).transfer(shareX);
        payable(commission_2_holder).transfer(shareX);
        emit PaidToGame(commission_1_holder, shareX);
        emit PaidToInvestor(commission_1_holder, shareX);
    }
}
