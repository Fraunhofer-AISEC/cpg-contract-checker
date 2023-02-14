function my_func() public view returns(uint) {
    if (1 == 0) {
       return 0;
    }
    return this.my_func()
}
