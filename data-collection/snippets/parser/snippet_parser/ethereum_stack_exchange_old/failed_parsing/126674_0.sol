enum State {INACTIVE, PENDING, ACTIVE, CLOSED}
struct Escrow {
    string planName;
    address payable payer;
    address payable receiver;
    uint requiredAmount;
    bytes32 escrowId;
    State state;
}

modifier onlyLawyer() {
    require(msg.sender == lawyer, "Only laywer!");
    _;
}

modifier inState(bytes32 _escrowId, State state) {
    require(plans[_escrowId].state == state, "Invalid State!");
    _;
}

constructor() {
    lawyer = msg.sender;
}

function idGenerator(address payable _payer, address payable _receiver, uint _requiredAmount) external view onlyLawyer() returns (bytes32) {
    return keccak256(abi.encode(_payer, _receiver, _requiredAmount, block.timestamp));
}

function addEscrowPlan(string memory _planName, address payable _payer, address payable _receiver, uint _requiredAmount, bytes32 _escrowId) external  onlyLawyer() inState(_escrowId, State.INACTIVE) {
    plans[_escrowId] = Escrow(_planName, _payer, _receiver, _requiredAmount, _escrowId, State.PENDING);
}

function depositEther(bytes32 _escrowId) external payable inState(_escrowId, State.PENDING) {
    require(msg.sender == plans[_escrowId].payer, "only payer!");
    require(msg.value >= plans[_escrowId].requiredAmount, "Invalid amount provided!");

    if (msg.value > plans[_escrowId].requiredAmount) {
        plans[_escrowId].payer.transfer(msg.value - plans[_escrowId].requiredAmount);
        plans[_escrowId].state = State.ACTIVE;
    }

    plans[_escrowId].state = State.ACTIVE;
}

function withdrawEtehr(bytes32 _escrowId) external onlyLawyer() inState(_escrowId, State.ACTIVE) {
    plans[_escrowId].state = State.CLOSED;
    plans[_escrowId].receiver.transfer(plans[_escrowId].requiredAmount);
}

function contractBalance() external view returns (uint) {
    return address(this).balance;
}
