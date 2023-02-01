interface IEmployee{
    function getName() external  view returns (string memory);
    function getAge() external  view returns (uint256);
    function addRole(address account, EmployeeRole abc) external;

  }

contract EmployeeCore is IEmployee {
    string name;
    uint age;
    mapping(address => EmployeeRole)  role;

    constructor  (string memory name1,uint age1) {
     name = name1;
     age = age1;
    }


    function getName() public  virtual override view returns (string memory){
        return name;

    }
    function getAge() public  virtual override view returns (uint256){
        return age;
    }

    function addRole(address account, EmployeeRole er) public virtual override {
        role[account] = er;
    }

}

abstract contract EmployeeRole is IEmployee{

    EmployeeCore core;
    function getName()  override public view  returns (string memory){
    return core.getName();
    }

    function getAge() override public view  returns (uint256){
    return core.getAge();
    }


    function addRole(address account, EmployeeRole er) public override{
        core.addRole(account,er);
   }
}

contract Manager is EmployeeRole{
    function manageInventory() pure  public returns (string memory){
        
        string memory job = "Manage Inventory";
        return job;
    }

    
}

contract Supplier is EmployeeRole{
    function manageSupplies() public pure  returns (string memory){
        string memory job = "Manage Supplies";
        return job;
    }

    
}
