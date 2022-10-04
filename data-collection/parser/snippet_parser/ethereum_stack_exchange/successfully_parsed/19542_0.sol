    pragma solidity ^0.4.8;

    import "./DataStore.sol";
    import "./SecurityLibrary.sol";
    import "./DataVerifiable.sol";


    contract Parent is DataVerifiable {

        address public orgStore;

        using SecurityLibrary for address;

        function Parent() payable {
            setDataStore(0x0);
        }

        function setDataStore(address _orgStore) {
            if (_orgStore == 0x0) {
                orgStore = new DataStore();
            } else {
                orgStore = _orgStore;
            }
            if (!orgStore.isSuperAdmin(msg.sender)) {
                orgStore.makeSuperAdmin(msg.sender);    
            }
            DataVerifiable.orgStore = orgStore;
        }

         function kill(address upgradedParent) superAdminOrOwner {
            if (upgradedParent == 0x0) {
            throw;
            }
          
          
          

           Parent(upgradedParent).setDataStore(orgStore);
           DataStore(orgStore).transferOwnership(upgradedParent);
           selfdestruct(upgradedParent);
         }
}
