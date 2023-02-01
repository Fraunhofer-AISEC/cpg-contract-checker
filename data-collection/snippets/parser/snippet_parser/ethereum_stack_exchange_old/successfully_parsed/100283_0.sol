enum ErrorCode {
    A,
    B,
    C
}

ErrorCode[] errors;


errors.push(ErrorCode.A);
errors.push(ErrorCode.B);
errors.push(ErrorCode.C);


uint index = errors[ErrorCode.B].index;
delete errors[index];
