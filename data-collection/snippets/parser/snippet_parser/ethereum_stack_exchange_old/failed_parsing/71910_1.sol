mapping(address => string[]) private buyerList_;

function saveBuyer(string item) 
      public 
      returns(bool)
{
      string[] storage items = buyerList_[msg.sender]; 
      items.push(item);                               
      returns true;                                   
}

function getItems(address _customer)
      public
      view
      returns(string[])
{
      returns buyerList_[_customer];
}
