        import "../Component.sol";
    
    
    contract Manager is ComponentRole{
    
            constructor(IComponent e){
            core = e;
        }
    
        function manageInventory() public pure  returns (string memory){
            string memory job = "Pick and Putaway Inventory";
            return job;
        }
        function getContractAddress() public view returns(address) {
            return address(this);
        }
        
    }
