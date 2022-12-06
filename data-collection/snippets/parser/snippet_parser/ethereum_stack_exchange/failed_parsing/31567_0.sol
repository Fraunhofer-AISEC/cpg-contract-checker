pragma solidity ^0.4.16;
contract RestaurantMASTER{
event logStatus(uint orderNumber, bytes input, uint256 timestamp);


function RestaurantMASTER(){
tokens[0]++;
CU = Customer(newCustomer());                       
WA = Waiter(newWaiter());                           
CH = Chef(newChef());                               
DB = dataBase(newDataBase());                       

}

    
    address[] public contracts;
    Customer CU;
    Waiter WA;
    Chef CH;
    dataBase DB;


    
    int[] public tokens = new int[](7);
    uint public orderNumber = -1;


    function newCustomer() private returns(address newContract){
        CU = new Customer();
        contracts.push(CU);
        return (CU);
    }
      function newWaiter () private returns(address newContract) {
       WA = new Waiter();
        contracts.push(WA);
        return (WA);
    }
     function newChef () private returns(address newContract) {
        CH = new Chef();
        contracts.push(CH);
        return (CH);
    }
    function newDataBase() private returns(address newContract){
        DB = new dataBase();
        contracts.push(DB);
        return (DB);
    }

   function OrderPizza(){
        orderNumber++;
        if(tokens[0] == 1){
            tokens[0] = 0;
            tokens[2]++;
            logStatus(orderNumber,"Pizza ordered", now);
        } else {revert();}
    }

    function TakeTheOrder(){
        if(tokens[2] == 1){
            tokens[2] = 0;
            tokens[3]++;
            logStatus(orderNumber,"Order taken", now);
        } else {revert();}
    }

        function PreparePizza(){
        if(tokens[3] == 1){
            tokens[3] = 0;
            tokens[4]++;
            logStatus(orderNumber,"Pizza Prepared", now);
        } else {revert();}
    }
        function PokeTheWaiter(){
        if(tokens[4] == 1){
            tokens[4] = 0;
            tokens[6]++;
            logStatus(orderNumber,"Waiter has been poked", now);
        } else {revert();}

        function WaiterBringsPizza(){
        if(tokens[4] == 1){
            tokens[4] = 0;
            tokens[7]++;
            logStatus(orderNumber,"Waiter is bringing Pizza", now);
        } else {revert();}
    }
     function CustomerReceivesPizza(){
        if(tokens[7] == 1){
            tokens[7] = 0;
            logStatus(orderNumber,"Customer eats Pizza", now);
        } else {revert();}
    }



    }
}
contract Customer{
event logStatus(uint orderNumber, bytes input, uint256 timestamp);

}
contract Chef{
event logStatus(uint orderNumber, bytes input, uint256 timestamp);

}

contract Waiter{
event logStatus(uint orderNumber, bytes input, uint256 timestamp);

}

contract dataBase{
event logStatus(uint orderNumber, bytes input, uint256 timestamp);

}
