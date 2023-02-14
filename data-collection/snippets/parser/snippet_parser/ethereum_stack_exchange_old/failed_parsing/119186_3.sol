modifier lock() {
    require(unlocked == 1, 'Pancake: LOCKED');
    unlocked = 0;
    _;
    unlocked = 1;
}
