
pragma solidity ^0.8.0;


enum OrderStatus {
    Pending,
    Accepted,
    Bread,
    Toppings,
    Complete,
    Cancelled
}


struct OrderWorkflow {
    bool BreadComplete;
    bool ToppingsComplete;
}




contract Order {
      OrderStatus status = OrderStatus.Pending;
      OrderWorkflow workflow = OrderWorkflow(false, false);
      string bread; 
      string toppings;

     
     constructor(string memory _bread, string memory _toppings) {
         bread = _bread;
         toppings = _toppings;
         status = OrderStatus.Accepted;
     }
    
     function addBread() public {
         status = OrderStatus.Bread;
         workflow.BreadComplete  = true;
     }

     function addToppings() public {
         status = OrderStatus.Toppings;
         workflow.ToppingsComplete  = true;
     }

     function complete() public {
         require(workflow.BreadComplete, "Bread is not added!");
         require(workflow.ToppingsComplete, "Toppings are not added!");
         status = OrderStatus.Complete;
     }
}

contract Store {
    address[] internal orders;
    mapping(address => uint) orderIndex; 

    function createOrder(string memory bread, string memory toppings) public {
        Order _order = new Order(bread, toppings);
        orders.push(address(_order));
        orderIndex[address(_order)] = orders.length;
    }

    
}
