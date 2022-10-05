func (self *JSRE) Evaluate(code string, w io.Writer) error {
    var fail error

    self.Do(func(vm *otto.Otto) {
        var startTime = time.Now();
        fmt.Println("jsre function ",code," start")
        val, err := vm.Run(code)
        if err != nil {
            prettyError(vm, err, w)
        } else {
            prettyPrint(vm, val, w)
        }
        fmt.Fprintln(w)
        fmt.Println("jsre function ",code," end ,consume time " ,(time.Now().UnixNano() - startTime.UnixNano()))
    })
    return fail
}
