function getMap(address adr) external returns(address, uint) {
    return (map[adr].example, map[adr].exampleUnt);
}
