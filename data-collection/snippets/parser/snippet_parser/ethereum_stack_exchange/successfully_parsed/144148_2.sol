contract ladletest {
Ladle ladle;

function a(bytes[] calldata batch) external payable {
    ladle.batch{value: 1}(batch);
}
}