import "Mortal.sol";
import "Exchanger.sol";
import "ExternalStorage.sol";
import "DepositDB.sol";
import "ForexDB.sol";
import "OrderDB.sol";
import "ContractManagerDB.sol";

contract LFC is Mortal {

    
    

    bytes3 private constant defaultBaseCurrency = "Eth";

    bytes32 private constant orderName = "Order DB";
    bytes32 private constant forexName = "Forex DB";
    bytes32 private constant depositName = "Deposit DB";    

    Exchanger private exchanger;
    ExternalStorage private storageContract;
    OrderDB private orderDB;
    DepositDB private depositDB;
    ForexDB private forexDB;
    ContractManagerDB private contractManagerDB;

    

    function createExchanger() public {
        exchanger = new Exchanger();
    }

    function createStorage() public onlyOwner {
        storageContract = new ExternalStorage();
        storageContract.changeOwner(exchanger);
    }

    function createContractManager() public onlyOwner {
        contractManagerDB = new ContractManagerDB();
        contractManagerDB.setStorage(storageContract);
        contractManagerDB.changeOwner(address(exchanger));       
        exchanger.setContractManager(contractManagerDB);
    }

    function createOrderContract() public onlyOwner {
        orderDB = new OrderDB();
        orderDB.setStorage(storageContract);
        orderDB.changeOwner(address(exchanger));
        
    }

    function createForexContract() public onlyOwner {
        forexDB = new ForexDB();
        forexDB.setStorage(storageContract); 
        forexDB.changeOwner(address(exchanger));
        
    }   

    function createDepositContract() public onlyOwner {
        depositDB = new DepositDB();
        depositDB.setStorage(storageContract);
        depositDB.changeOwner(address(exchanger));
        
    }

    function addAdmin() public onlyOwner {
        storageContract.addAdmin(exchanger);
        storageContract.addAdmin(depositDB);
        storageContract.addAdmin(forexDB);      
        storageContract.addAdmin(orderDB);           
        storageContract.addAdmin(contractManagerDB);
    }

    function addContracts() public {
        contractManagerDB.addContract(orderName,orderDB);
        contractManagerDB.addContract(forexName,forexDB);
        contractManagerDB.addContract(depositName,depositDB);
        exchanger.setNames(orderName,forexName,depositName);
    }

    function setForexBase() public {
        forexDB.setBase(defaultBaseCurrency);
    }

    function getExchanger() public constant returns (address) {
        return exchanger;
    }
}
