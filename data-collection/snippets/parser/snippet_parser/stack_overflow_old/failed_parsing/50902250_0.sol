contract Company is CompanyInterface {
    address public ceo;
    ...
    function setCeo(address newCeo){
        ceo = newCeo;
    }
    ...
}

contract MainCompany is CompanyInterface {
    address public ceo;
    address public lib; 
    ...
    function() payable external {
        if(!lib.delegatecall(msg.data)) {
          revert();
        }
    }
    ...
}
