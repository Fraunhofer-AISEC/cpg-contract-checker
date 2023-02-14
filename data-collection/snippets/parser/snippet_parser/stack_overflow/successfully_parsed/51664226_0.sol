



modifier onlyBefore(uint _time) { require(now < _time); _; }
modifier onlyAfter(uint _time) { require(now > _time); _; }
