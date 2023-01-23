pragma solidity ^0.4.18;

contract ILoanParams {

    function setParams(uint256 id,uint256 _lenderID,address _borrowerAddress,string loanHughString) public;

    function loanStatus(uint256 _loanId) public returns(string status);

    function setSignatures(uint256 _loanId,string _signatures) public;

    function getBorrowerAddress(uint256 _loanId) public returns(address);

    function getLenderID(uint256 _loanId) view public returns(uint256);

    function setStatus(uint256 _loanId,string _status) public;


    
    function testGetLoanAddress() public view returns(address);

    function testGetStatus(uint256 _loanId) public view returns(string);


}
