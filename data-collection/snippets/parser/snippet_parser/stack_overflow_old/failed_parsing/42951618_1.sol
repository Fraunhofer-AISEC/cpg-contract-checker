import 'Shareholder.sol';

contract Company {

  mapping(address => address) public shareholders; 
  account address to shareholder contract address

  function getShareNo(address _user) constant returns (uint _amount){
    
    address sellerContractAddr = getShareholder(_user);
    Shareholder sellerContract = Shareholder(sellerContractAddr);

    uint shares = sellerContract.getShareBalance();

    return shares;
  }

    function getShareholder(address _user) constant returns (address shareholder){
        return shareholders[_user];
    }

}
