pragma solidity ^0.4.18;

contract ILoan {
        function getBorrowerIDsViaAddress(address _address) view public returns (uint[]);
        function countLoans() view public returns (uint);
        function executeLoan(uint256 _loanId,uint256 _issuedTokens) public;
        function checkValidParameters(uint256 _loanId,uint256 lenderID,uint256 amount) view public returns (bool);
}
