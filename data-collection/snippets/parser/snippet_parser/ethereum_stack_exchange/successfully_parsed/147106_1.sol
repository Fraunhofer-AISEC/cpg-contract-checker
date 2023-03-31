error Fail(string);
function cheapFail() public view {
    if (false) {
        revert Fail("Readable Message");
    }
}
