contract LockSlots is ERC20Token {

using SafeMath for uint;

uint public constant LOCK_SLOTS = 5;
mapping(address => uint[LOCK_SLOTS]) public lockTerm;
mapping(address => uint[LOCK_SLOTS]) public lockAmnt;
mapping(address => bool) public mayHaveLockedTokens;

event RegisteredLockedTokens(address indexed account, uint indexed idx, uint tokens, uint **term**);

function registerLockedTokens(address _account, uint _tokens, uint _term) internal returns (uint idx) {
    require(_term > now, "lock term must be in the future");

    
    
    
    idx = 9999;
    uint[LOCK_SLOTS] storage term = lockTerm[_account];
    uint[LOCK_SLOTS] storage amnt = lockAmnt[_account];
    for (uint i; i < LOCK_SLOTS; i++) {
        if (term[i] < now) {
            term[i] = 0;
            amnt[i] = 0;
            if (idx == 9999) idx = i;
        }
        if (term[i] == _term) idx = i;
    }

    
    require(idx != 9999, "registerLockedTokens: no available slot found");

    
    if (term[idx] == 0) term[idx] = _term;
    amnt[idx] = amnt[idx].add(_tokens);
    mayHaveLockedTokens[_account] = true;
    emit RegisteredLockedTokens(_account, idx, _tokens, _term);
}



function lockedTokens(address _account) public view returns (uint) {
    if (!mayHaveLockedTokens[_account]) return 0;
    return pNumberOfLockedTokens(_account);
}

function unlockedTokens(address _account) public view returns (uint) {
    return balances[_account].sub(lockedTokens(_account));
}

function isAvailableLockSlot(address _account, uint _term) public view returns (bool) {
    if (!mayHaveLockedTokens[_account]) return true;
    if (_term < now) return true;
    uint[LOCK_SLOTS] storage term = lockTerm[_account];
    for (uint i; i < LOCK_SLOTS; i++) {
        if (term[i] < now || term[i] == _term) return true;
    }
    return false;
}



function unlockedTokensInternal(address _account) internal returns (uint) {
    
    if (!mayHaveLockedTokens[_account]) return balances[_account];
    uint locked = pNumberOfLockedTokens(_account);
    if (locked == 0) mayHaveLockedTokens[_account] = false;
    return balances[_account].sub(locked);
}

function pNumberOfLockedTokens(address _account) private view returns (uint locked) {
    uint[LOCK_SLOTS] storage term = lockTerm[_account];
    uint[LOCK_SLOTS] storage amnt = lockAmnt[_account];
    for (uint i; i < LOCK_SLOTS; i++) {
        if (term[i] >= now) locked = locked.add(amnt[i]);
    }
}
