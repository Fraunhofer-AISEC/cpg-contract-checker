contract Music is owned{

    string public themeMusic;
    string public idMusic;
    int public money;

    function Music() {
    
    }
    function Car (string setThemeMusic, string setIdMusic, uint setmoney) {
        themeMusic = setThemeMusic;
        idMusic = setIdMusic;
        money = setmoney;
    }

    function setMoney(uint moneyUpdate) onlyOwner {
        money = moneyUpdate;
    }
}