

uint pool = 0; 
bool positivePool = true; 

function updatePool(uint _amount, bool _positive) public {
    if (positivePool) {
        if (_positive {
            pool = pool.add(_amount);
        } 
        else {
            if (_amount > pool) {
                pool = _amount.sub(pool);
                positivePool = false;
            } else {
                pool = pool.sub(_amount);
            }
        }
    } else {
        if (_positive) {
            if (_amount > pool) {
                pool = _amount.sub(pool);
                positivePool = true;
            } else {
                pool = pool.sub(_amount);
            }
        } 
        else {
            pool = pool.add(_amount);
        }
    }
}
