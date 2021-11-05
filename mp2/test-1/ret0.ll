declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main_main() {

entry:
	%vtpm.0 = alloca i32
	store i32 2, i32* %vtpm.0
	%vtpm.1 = alloca i32
	store i32 0, i32* %vtpm.1
	br label %loop.0

loop.0:
	%vtpm.2 = load i32, i32* %vtpm.1
	%vtpm.3 = icmp slt i32 %vtpm.2, 100
	br i1 %vtpm.3, label %true.0, label %false.0

true.0:
	%vtpm.4 = alloca i1
	store i1 true, i1* %vtpm.4
	%vtpm.5 = alloca i32
	store i32 2, i32* %vtpm.5
	br label %loop.1

loop.1:
	%vtpm.6 = load i32, i32* %vtpm.5
	%vtpm.7 = load i32, i32* %vtpm.5
	%vtpm.8 = mul i32 %vtpm.6, %vtpm.7
	%vtpm.9 = load i32, i32* %vtpm.0
	%vtpm.10 = icmp sle i32 %vtpm.8, %vtpm.9
	br i1 %vtpm.10, label %true.1, label %false.1

true.1:
	%vtpm.11 = alloca i1
	%vtpm.12 = load i32, i32* %vtpm.0
	%vtpm.13 = load i32, i32* %vtpm.5
	%vtpm.14 = icmp eq i32 %vtpm.13, 0
	br i1 %vtpm.14, label %abort, label %ok.0

ok.0:
	%vtpm.15 = sdiv i32 %vtpm.12, %vtpm.13
	%vtpm.16 = load i32, i32* %vtpm.5
	%vtpm.17 = mul i32 %vtpm.15, %vtpm.16
	%vtpm.18 = load i32, i32* %vtpm.0
	%vtpm.19 = icmp eq i32 %vtpm.17, %vtpm.18
	br i1 %vtpm.19, label %true.2, label %false.2

true.2:
	store i1 false, i1* %vtpm.4
	store i1 false, i1* %vtpm.11
	br label %end.2

false.2:
	store i1 false, i1* %vtpm.11
	br label %end.2

end.2:
	%vtpm.20 = load i1, i1* %vtpm.11
	%vtpm.21 = load i32, i32* %vtpm.5
	%vtpm.22 = add i32 %vtpm.21, 1
	store i32 %vtpm.22, i32* %vtpm.5
	br label %loop.1

false.1:
	%vtpm.23 = alloca i32
	%vtpm.24 = load i1, i1* %vtpm.4
	br i1 %vtpm.24, label %true.3, label %false.3

true.3:
	%vtpm.25 = load i32, i32* %vtpm.1
	%vtpm.26 = add i32 %vtpm.25, 1
	store i32 %vtpm.26, i32* %vtpm.1
	store i32 %vtpm.26, i32* %vtpm.23
	br label %end.3

false.3:
	store i32 0, i32* %vtpm.23
	br label %end.3

end.3:
	%vtpm.27 = load i32, i32* %vtpm.23
	%vtpm.28 = load i32, i32* %vtpm.0
	%vtpm.29 = add i32 %vtpm.28, 1
	store i32 %vtpm.29, i32* %vtpm.0
	br label %loop.0

false.0:
	%vtpm.30 = load i32, i32* %vtpm.0
	%vtpm.31 = sub i32 %vtpm.30, 1
	ret i32 %vtpm.31

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main_main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.33 = call i32 @Main_main(  )
	%vtpm.34 = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.35 = call i32(i8*, ... ) @printf( i8* %vtpm.34, i32 %vtpm.33 )
	ret i32 0
}

