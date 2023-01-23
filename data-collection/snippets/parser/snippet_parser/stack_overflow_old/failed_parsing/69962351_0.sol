    modifier lock() {
        require(slot0.unlocked, 'LOK');
        slot0.unlocked = false;
        _; 
        slot0.unlocked = true;
    }
