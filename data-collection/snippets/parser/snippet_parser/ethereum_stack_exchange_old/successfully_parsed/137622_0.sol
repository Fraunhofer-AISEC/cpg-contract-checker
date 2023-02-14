abstract contract PluginUUPSUpgradeable is ERC165, UUPSUpgradable {
   
   
   
   
   bytes4 public constant PLUGIN_UUPS_UPGRADEABLE_INTERFACE_ID = 
             this.great1.selector ^ 
             this.great2.selector ^ 
             this.great3.selector ^ 
             this.great4.selector;
   
   
   function supportsInterface(bytes4 _interfaceId) public view virtual override returns (bool) {
        return
             _interfaceId == type(UUPSUpgradable).interfaceId ||
            _interfaceId == PLUGIN_UUPS_UPGRADEABLE_INTERFACE_ID ||
            super.supportsInterface(_interfaceId);
    }

    function great1() public {

    }

    function great2() public {

    }

    function great3() public {

    }

    function great4() public {

    }
}

