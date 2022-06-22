Contract A is Ownable
{ 
  struct Item
  {
     uint256 id;
     uint256 price;
     address owner;
  }

  Item it;

  modifier onlyItemOwner
  {
    require(msg.sender == it.owner, "Incorrect owner !");
  }

  function setPrice(uint256 p) public onlyItemOwner
  {
    it1.price = p;
  }
}

Contract B
{
   A itemContract;

   function changePrice(uint256 newp) public
   {
     itemContract.setPrice(newp);
   }
}
