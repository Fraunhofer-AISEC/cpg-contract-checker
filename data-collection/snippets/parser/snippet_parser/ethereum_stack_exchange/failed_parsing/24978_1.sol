import './Storage.sol';
contract A{

    mapping (uint=>Storage) idToStorage;
    Storage storage=new Storage();

    function addNewB(uint id){
         idToStorage[id]=storage;
    }
    function getStatus(uint id){
         idToStorage[id].status();
    }

}
