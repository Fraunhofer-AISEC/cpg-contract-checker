contract HiddenCookies {

    struct Cookie {
        string cookieID
        string name,
        string color,
        string flavor,
        uint amount
    }

    struct CookieJar {
        address[] cookieContributors; 
        mapping(address => Cookie[]) cookies;
        Cookie[] cookieJarContent;
        uint cookiesHiddenForLater;
    }
}
