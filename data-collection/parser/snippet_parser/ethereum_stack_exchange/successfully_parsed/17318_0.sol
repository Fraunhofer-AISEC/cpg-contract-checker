contract Music is owned{

    string public themeMusic;
    string public idMusic;
    int public money;

    function Music (string setThemeMusic, string setIdMusic, int setmoney) {
        themeMusic = setThemeMusic;
        idMusic = setIdMusic;
        money = setmoney;
    }

    function setMoney(int moneyUpdate) onlyOwner {
        money = moneyUpdate;
    }
}
