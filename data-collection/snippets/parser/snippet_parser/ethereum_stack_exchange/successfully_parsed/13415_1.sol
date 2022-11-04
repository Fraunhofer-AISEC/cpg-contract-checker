function getCookieFlavor(address cookie) public view returns(string){
    return Cookie(cookie).getFlavor();
}
