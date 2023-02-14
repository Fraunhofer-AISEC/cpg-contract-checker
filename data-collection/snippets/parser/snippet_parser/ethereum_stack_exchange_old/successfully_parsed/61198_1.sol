contract ChildContract is ParentContract{
    function a() onlyOwner() {
       super.a()
    }
}
