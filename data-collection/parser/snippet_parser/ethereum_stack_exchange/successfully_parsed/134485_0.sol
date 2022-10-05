pragma solidity >0.7.0 < 0.9.0;



contract Letscode{
    struct dailyquote{
        string today;
        uint luckynumber;
    }

    event dailyquotes(uint luckynumber, string today);

    function listinfo() public returns(uint256, string memory) {
        emit dailyquotes(7 , 'love in the air');
        return dailyquotes;

    }

}
