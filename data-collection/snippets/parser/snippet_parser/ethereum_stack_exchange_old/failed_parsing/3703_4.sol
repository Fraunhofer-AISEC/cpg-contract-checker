510 
511 func TempDir() string {
512     n := uint32(syscall.MAX_PATH)
513     for {
514         b := make([]uint16, n)
515         n, _ = syscall.GetTempPath(uint32(len(b)), &b[0])
516         if n > uint32(len(b)) {
517             continue
518         }
519         if n > 0 && b[n-1] == '\\' {
520             n--
521         }
522         return string(utf16.Decode(b[:n]))
523     }
524 }
