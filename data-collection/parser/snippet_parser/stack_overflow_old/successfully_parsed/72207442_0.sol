function _somefunction() internal {
    if (address(attr) != address(0)) {
        try attr.maybedoesntexist() {
        } catch Error(string memory message) {
            emit SomethingFailed();
        } catch {
            emit SomethingFailed();
        }
    }
}
