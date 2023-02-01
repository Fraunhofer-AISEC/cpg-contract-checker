contract musicCompany is owned {

    address[] public listofmusic;

    function addMusic(string setThemeMusic, string setIdMusic, int setmoney) onlyOwner {
        address newMusic = new Music(setThemeMusic, setIdMusic, setmoney);
        listofmusic.push(newMusic);
    }
}
