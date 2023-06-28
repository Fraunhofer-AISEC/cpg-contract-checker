contract sortOrders 
{
   struct D_Order 
  {
   uint price;
  }

  mapping(uint => mapping(uint => D_Order[])) public orderStateVar;

  function sort() public 
  {
      orderStateVar[0][0].push(D_Order(10));
      orderStateVar[0][0].push( D_Order(87));
      orderStateVar[0][0].push(D_Order(56));

      sortTheArrayOrders();
  }

  function sortTheArrayOrders() internal returns(D_Order[] memory)
  {
      D_Order[] memory orders = orderStateVar[0][0];
      quickSort(orders, int(0), int(orders.length - 1));
  }

  function quickSort(D_Order[] memory arr, int left, int right) internal
  {
     
     
  }
 }
