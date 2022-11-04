contract MyToken {
    function mint(address _to, uint256 _amount) onlyOwner returns (bool);
}

contract NewContract {

    Mytoken token;

    uint256 public rate;

    function NewContract(uint256 _rate){
        rate = _rate;
    }

    function () payable {
        token.mint(msg.sender, msg.value);
    }
}
