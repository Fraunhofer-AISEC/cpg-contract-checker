function Deposit (uint256 timeout, bytes32 hash, address recipient)
        public payable returns (uint256)
    {
        require( timeout >= now );
        require( timeout < (now + MAX_TIMEOUT) );
        require( msg.value > 0 );

        var lock_id = m_ctr;
        m_ctr += 1;
        m_locks[lock_id] = LockState(timeout, hash, recipient, msg.sender, msg.value);

        OnDeposit(lock_id, recipient);

        return lock_id;
    }
