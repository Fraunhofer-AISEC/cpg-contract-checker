Counters.Counter private _tokenIdTracker;
...
function mint(address to) public virtual {
    ...
    _mint(to, _tokenIdTracker.current());
    _tokenIdTracker.increment();
}
