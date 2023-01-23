contract Crowdsale is Token {

    token private _token;

    constructor (ERC20 token) public {
        require(address(token) != address(0));

        _token = token;
    }


    function test(address account) public view returns (uint256) {
        _token.functionFromToken(account);
    }


    function test2(address account) public modifierInToken {

    }

}
