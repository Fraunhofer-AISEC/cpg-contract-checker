import "forge-std/Test.sol";
import "../src/MultiSig.sol";

contract MultiSigTest is Test {
MultiSig public multisig;

function setUp() public {
    address[] memory sahipler = new address[](2);
    sahipler[0] = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    sahipler[1] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    multisig = new MultiSig(sahipler,1);
}
address fakeOwner1 = makeAddr("fake1");
address fakeOwner2 = makeAddr("fake2");
address testReceiver = makeAddr("receiver");


function testCreateTxProposal() public {
    vm.prank(fakeOwner1);
    vm.expectRevert(bytes("You arent a owner"));

    multisig.createTxProposal(testReceiver, 1000000000000000000);
}

function testApproveTransaction(uint id) public {
    assertEq(multisig.transactions[id].executed,false);
}
}
