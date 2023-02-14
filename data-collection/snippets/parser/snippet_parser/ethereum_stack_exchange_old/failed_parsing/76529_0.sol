contract FactroyContract {
  address[] public contracts;
  address public lastContractAddresses;

  event newPurchaseContract (address contractAddress);

  function getContractcount() public view returns(uint ContracCount) 
  {
    return contracts.length;
  }

  function newPurchase(uint value, string memory bookName, string memory description, string memory imageHash, string memory privHash, string memory dataHash) 
    public 
    payable
    returns(address NewContract)
  {
    Purchase c = new Purchase(address(msg.sender), value, bookName, description, imageHash, privHash, dataHash);
    contracts.push(c);
    lastContractAddresses = address(c);
    emit newPurchaseContract(c);
    return c;
  }

  function seePurchase(uint pos) public view returns(address contractAddress)
  {
    return address(contracts[pos]);
  }
}

contract Purchase
{
  uint public price;
  address public seller;
  address[] public buyers;
  address public buyer;
  string public ipfsHash;
  string public preview;
  string public cover;
  string public name;
  string public text;

  constructor(address contractSeller, uint value, string memory bookName, string memory description, string memory imageHash, string memory privHash, string memory dataHash) public payable
  {
    seller = contractSeller;
    name = bookName; 
    text = description;
    cover = imageHash;
    preview = privHash;
    ipfsHash = dataHash;
    price = value * 1000000000000000000;
  }

  modifier condition(bool _condition) 
  {
    require(_condition);
    _;    
  }

  modifier onlyBuyer()
  {
    (msg.sender == buyer);
    _;
  }

  modifier onlySeller()
  {
    (msg.sender == seller);
    _;
  }

  event ItemReceived();

  function confrimReceived() public 
    condition(msg.value == price)
    payable
  {
    emit ItemReceived();

    buyer = msg.sender;
    seller.transfer(address(this).balance);
  }
  function getBuyerCount() public view returns(address buyerAddresses)
  {
    return buyers.length;
  }

  function getEtherCount() public view return(uint earnedEather)
  {
    return price+= msg.value;
  }
}
