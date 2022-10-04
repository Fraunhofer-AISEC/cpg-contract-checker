contract TrackingManager {
    Hit[] hits;

    function createHit(string _url, string _referrer) {
        hits.push(new Hit(_url, _referrer));
    }

    function getHits() returns (Hit[]) {
        return hits;
    }
}

contract Hit {
    string public url;
    string public referrer;

    function Hit(string _url, string _referrer) {
        url = _url;
        referrer = _referrer;
    }
}
