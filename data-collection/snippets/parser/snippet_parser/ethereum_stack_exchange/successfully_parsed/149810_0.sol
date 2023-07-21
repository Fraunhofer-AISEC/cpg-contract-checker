 contract MyToken is ERC20Upgradeable {
      function initialize() initializer public {
          
      }
  }
 
  contract MyTokenV2 is MyToken, ERC20PermitUpgradeable {
      function initializeV2() reinitializer(2) public {
          
      }
  }

 contract MyTokenV3 is MyTokenV2 {
      function initialize3() reinitializer(3) public {
         
      }
  }
 
  contract MyTokenV4 is MyTokenV3{
      function initializeV4() reinitializer(4) public {
          
      }
  }
