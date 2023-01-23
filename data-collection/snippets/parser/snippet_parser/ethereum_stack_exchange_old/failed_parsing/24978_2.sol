import './Storage.sol';
contract A{

    mapping (uint=>Storage) idToStorage;

    function addNewB(uint id){
         Storage storage=new Storage();
         idToStorage[id]=storage;
    }

    function getStatus(uint id){
         idToStorage[id].status();
    }
}
