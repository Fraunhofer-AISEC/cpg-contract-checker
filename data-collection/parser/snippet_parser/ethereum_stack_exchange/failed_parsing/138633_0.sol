contract GizmoFactory {
  event NewGizmo(address indexed gizmoAddress)
  function makeGizmo(GizmoMeta meta) public {.    
    Gizmo myGizmo = new Gizmo(meta);
    myGizmo.initialize();
    emit NewGizmo(address(myGizmo));;
  }
}

import "./GizmoLibrary.sol"
contract Gizmo {
   GizmoMeta meta;
   uint256 public valuableResult;   

   constructor(GizmoMeta meta_) {
      meta = meta_;    
   }
   function initialize() public {
        Uint256 result=0;
        for(uinit i=0;i<30;i++) {
           result = GizmoLibrary.expensiveFunction(meta, result);
        }
        valuableResult = result;
   }
}

library GizmoLibrary {
    function expensiveFunction(GizmoMeta meta, uint intermediate) public 
    pure returns(uint) {
       uint result = [expensive process here(meta, intermediate)exe];
       return result;
    }
}
