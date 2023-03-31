struct Slot {
  address value;
}

...

function getSlot(bytes32 slot) returns (Slot storage s) {
   assembly { s.slot := slot }
}
