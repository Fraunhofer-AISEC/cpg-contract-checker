contract Escrow {
    Control internal control;

    function addLister(address lister) internal {
      control.grantRole(control.LISTER_ROLE(), lister),
    }
    ...
