pragma solidity ^0.4.0;

contract DividendToken {
    address contractOwner = msg.sender;

    uint[] dividendsAwarded;

    mapping(address => mapping(uint => uint)) balances;

    function awardDividends(uint _percent) {
        require(msg.sender==contractOwner);
        dividendsAwarded.push(_percent);
    }

    function balanceOf(address _stakeHolder) constant returns(uint balance) {
        mapping(uint => uint) stakeHolderBalances = balances[_stakeHolder];

        uint balanceToApplyDividend;
        uint dividendAward;
        for(uint i=0;i<dividendsAwarded.length;i++) {
            balanceToApplyDividend += stakeHolderBalances[i];
            dividendAward = (balanceToApplyDividend * dividendsAwarded[i]) / 100;
            balance += balanceToApplyDividend + dividendAward;
        }
        balance += stakeHolderBalances[dividendsAwarded.length];
    }

    function transfer(address _to, uint _amount) returns(bool success) {
        collectDividends(msg.sender);

        balances[msg.sender][dividendsAwarded.length] -= _amount;
        balances[_to][dividendsAwarded.length] += _amount;
        return true;
    }

    function collectDividends(address _stakeHolder) {
        mapping(uint => uint) stakeHolderBalances = balances[_stakeHolder];

        uint newBalance = balanceOf(_stakeHolder);

        for(uint i=0;i<dividendsAwarded.length;i++) {
            delete stakeHolderBalances[i];
        }
        stakeHolderBalances[dividendsAwarded.length] = newBalance;
    }

    function giveTokens(uint _amount) {
        balances[msg.sender][dividendsAwarded.length] = _amount;
    }
}
