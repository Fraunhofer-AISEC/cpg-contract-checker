bool isStaticCall = false;
try this.staticCallChecker() {} catch {
    isStaticCall = true;
}
