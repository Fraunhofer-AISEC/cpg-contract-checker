contract For {
    error Unauthorized();
    
    function reverWithError() {
        revert Unauthorized();
    }
}
