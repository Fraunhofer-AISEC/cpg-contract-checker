contract ParentA
contract ChildAA is ParentA
contract ChildBB is ParentA

contract ParentB
contract ChildCC is ParentB
contract ChildDD is ParentB

contract FactoryXX {Creates Contracts of Type ChildAA and ChildBB, and maintains a Map of all the contracts generated as State Variables}
contract FactoryYY {Creates Contracts of Type ChildCC and ChildDD, and maintains a Map of all the contracts generated}
