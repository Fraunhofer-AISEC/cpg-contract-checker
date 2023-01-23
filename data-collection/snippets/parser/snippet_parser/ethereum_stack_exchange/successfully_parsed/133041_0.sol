contract Test {

   struct Worker{
        address manager_add;
        address worker_add;
    }

   mapping(address => Worker[]) manager;

   function setWorkerAddress(address worker_add) public{

      manager[msg.sender].push(Worker(msg.sender, worker_add));  

   }

   function getManagerAddress() public returns(uint){
      return manager[msg.sender].x;  
   }
}
