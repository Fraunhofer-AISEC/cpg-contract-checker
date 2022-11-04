contract PlanetEarthContract {
    string[7] continents;
    constructor() public {
        continents = ["North America", "South America", "Europe", 
        "Asia", "Oceania", "Antartica", "Africa"];}

        function getCountries() public view returns(string[7] memory){
        return(continents);
    }

}
