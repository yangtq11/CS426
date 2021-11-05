declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
	%Object_vtable*
}

%Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@Object_vtable_prototype = constant %Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
	%Int_vtable*,
	i32
}

%Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Int*) *,
	%String* (%Int*) *,
	%Int* (%Int*) *
}

@Int_vtable_prototype = constant %Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
	%Bool_vtable*,
	i1
}

%Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Bool*) *,
	%String* (%Bool*) *,
	%Bool* (%Bool*) *
}

@Bool_vtable_prototype = constant %Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00"
%String = type {
	%String_vtable*,
	i8*
}

%String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%String*) *,
	%String* (%String*) *,
	%String* (%String*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@String_vtable_prototype = constant %String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
	%IO_vtable*
}

%IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%IO*) *,
	%String* (%IO*) *,
	%IO* (%IO*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@IO_vtable_prototype = constant %IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%Main_vtable*
}

%Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%String*) *,
	%Main* (%Main*,i32) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	%Main* (%Main*) *
}

@Main_vtable_prototype = constant %Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
	%Main* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%A_vtable*,
	i32,
	i1,
	%String*,
	i32
}

%A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *
}

@A_vtable_prototype = constant %A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
}

@str.AA = internal constant [3 x i8] c"AA\00"
%AA = type {
	%AA_vtable*,
	i32,
	i1,
	%String*,
	i32,
	i1,
	i32
}

%AA_vtable = type {
	i32,
	i32,
	i8*,
	%AA* () *,
	%Object* (%AA*) *,
	%String* (%AA*) *,
	%AA* (%AA*) *,
	i32 (%AA*,i32) *,
	i32 (%AA*) *
}

@AA_vtable_prototype = constant %AA_vtable {
	i32 7,
	i32 ptrtoint (%AA* getelementptr (%AA, %AA* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.AA, i32 0, i32 0),
	%AA* () * @AA_new,
	%Object* (%AA*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%AA*) *),
	%String* (%AA*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%AA*) *),
	%AA* (%AA*) * bitcast (%Object* (%Object*) * @Object_copy to %AA* (%AA*) *),
	i32 (%AA*,i32) * @AA_set,
	i32 (%AA*) * @AA_get
}

@str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [8 x i8] c"Error2\0A\00"
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [8 x i8] c"Error1\0A\00"
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [11 x i8] c"copy_o3.cl\00"
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main*() @Main_new(  )
	%main.retval = call %Main*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Main* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = alloca %A*
	store %A* null, %A** %tmp.1
	%tmp.2 = alloca %A*
	store %A* null, %A** %tmp.2
	%tmp.3 = call %AA* @AA_new(  )
	%tmp.4 = bitcast %AA* %tmp.3 to %A*
	store %A* %tmp.4, %A** %tmp.1
	%tmp.5 = load %A*, %A** %tmp.1
	%vtpm.0 = icmp eq %A* %tmp.5, null
	br i1 %vtpm.0, label %abort, label %ok.0

ok.0:
	%tmp.6 = getelementptr %A, %A* %tmp.5, i32 0, i32 0
	%tmp.7 = load %A_vtable*, %A_vtable** %tmp.6
	%tmp.8 = getelementptr %A_vtable, %A_vtable* %tmp.7, i32 0, i32 0
	%tmp.9 = load i32, i32* %tmp.8
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Int*
	br label %case.7.0

case.7.0:
	%tmp.10 = icmp slt i32 %tmp.9, 7
	br i1 %tmp.10, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.11 = icmp sgt i32 %tmp.9, 7
	br i1 %tmp.11, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.12 = alloca %AA*
	%tmp.13 = bitcast %A* %tmp.5 to %AA*
	store %AA* %tmp.13, %AA** %tmp.12
	%tmp.14 = load %AA*, %AA** %tmp.12
	%tmp.15 = icmp eq %AA* %tmp.14, null
	br i1 %tmp.15, label %abort, label %ok.1

ok.1:
	%tmp.16 = getelementptr %AA, %AA* %tmp.14, i32 0, i32 0
	%tmp.17 = load %AA_vtable*, %AA_vtable** %tmp.16
	%tmp.18 = getelementptr %AA_vtable, %AA_vtable* %tmp.17, i32 0, i32 7
	%tmp.19 = load i32 (%AA*,i32) *, i32 (%AA*,i32) ** %tmp.18
	%tmp.20 = call i32(%AA*, i32) %tmp.19( %AA* %tmp.14, i32 42 )
	%tmp.21 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.21, i32 %tmp.20 )
	%tmp.22 = bitcast %Int* %tmp.21 to %Object*
	%tmp.23 = bitcast %Object* %tmp.22 to %Int*
	store %Int* %tmp.23, %Int** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %case.0.0

case.0.0:
	%tmp.24 = icmp slt i32 %tmp.9, 0
	br i1 %tmp.24, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%tmp.25 = icmp sgt i32 %tmp.9, 7
	br i1 %tmp.25, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%tmp.26 = alloca %Object*
	%tmp.27 = bitcast %A* %tmp.5 to %Object*
	store %Object* %tmp.27, %Object** %tmp.26
	%tmp.28 = load %Main*, %Main** %tmp.0
	%tmp.29 = icmp eq %Main* %tmp.28, null
	br i1 %tmp.29, label %abort, label %ok.2

ok.2:
	%tmp.30 = getelementptr %Main, %Main* %tmp.28, i32 0, i32 0
	%tmp.31 = load %Main_vtable*, %Main_vtable** %tmp.30
	%tmp.32 = getelementptr %Main_vtable, %Main_vtable* %tmp.31, i32 0, i32 7
	%tmp.33 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.32
	%tmp.34 = call %Main*(%Main*, %String*) %tmp.33( %Main* %tmp.28, %String* @String.1 )
	%tmp.35 = bitcast %Main* %tmp.34 to %Object*
	%tmp.36 = bitcast %Object* %tmp.35 to %Int*
	store %Int* %tmp.36, %Int** %vtpm.1
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Int*, %Int** %vtpm.1
	%tmp.37 = load %A*, %A** %tmp.1
	%tmp.38 = icmp eq %A* %tmp.37, null
	br i1 %tmp.38, label %abort, label %ok.3

ok.3:
	%tmp.39 = getelementptr %A, %A* %tmp.37, i32 0, i32 0
	%tmp.40 = load %A_vtable*, %A_vtable** %tmp.39
	%tmp.41 = getelementptr %A_vtable, %A_vtable* %tmp.40, i32 0, i32 6
	%tmp.42 = load %A* (%A*) *, %A* (%A*) ** %tmp.41
	%tmp.43 = call %A*(%A*) %tmp.42( %A* %tmp.37 )
	store %A* %tmp.43, %A** %tmp.2
	%tmp.44 = load %A*, %A** %tmp.2
	%vtpm.3 = icmp eq %A* %tmp.44, null
	br i1 %vtpm.3, label %abort, label %ok.4

ok.4:
	%tmp.45 = getelementptr %A, %A* %tmp.44, i32 0, i32 0
	%tmp.46 = load %A_vtable*, %A_vtable** %tmp.45
	%tmp.47 = getelementptr %A_vtable, %A_vtable* %tmp.46, i32 0, i32 0
	%tmp.48 = load i32, i32* %tmp.47
	br label %case.hdr.1

case.hdr.1:
	%vtpm.4 = alloca %Main*
	br label %case.7.1

case.7.1:
	%tmp.49 = icmp slt i32 %tmp.48, 7
	br i1 %tmp.49, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%tmp.50 = icmp sgt i32 %tmp.48, 7
	br i1 %tmp.50, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%tmp.51 = alloca %AA*
	%tmp.52 = bitcast %A* %tmp.44 to %AA*
	store %AA* %tmp.52, %AA** %tmp.51
	%tmp.53 = load %AA*, %AA** %tmp.51
	%tmp.54 = icmp eq %AA* %tmp.53, null
	br i1 %tmp.54, label %abort, label %ok.5

ok.5:
	%tmp.55 = getelementptr %AA, %AA* %tmp.53, i32 0, i32 0
	%tmp.56 = load %AA_vtable*, %AA_vtable** %tmp.55
	%tmp.57 = getelementptr %AA_vtable, %AA_vtable* %tmp.56, i32 0, i32 8
	%tmp.58 = load i32 (%AA*) *, i32 (%AA*) ** %tmp.57
	%tmp.59 = call i32(%AA*) %tmp.58( %AA* %tmp.53 )
	%tmp.60 = load %Main*, %Main** %tmp.0
	%tmp.61 = icmp eq %Main* %tmp.60, null
	br i1 %tmp.61, label %abort, label %ok.6

ok.6:
	%tmp.62 = getelementptr %Main, %Main* %tmp.60, i32 0, i32 0
	%tmp.63 = load %Main_vtable*, %Main_vtable** %tmp.62
	%tmp.64 = getelementptr %Main_vtable, %Main_vtable* %tmp.63, i32 0, i32 8
	%tmp.65 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.64
	%tmp.66 = call %Main*(%Main*, i32) %tmp.65( %Main* %tmp.60, i32 %tmp.59 )
	store %Main* %tmp.66, %Main** %vtpm.4
	br label %case.exit.1

br_exit.7.1:
	br label %case.0.1

case.0.1:
	%tmp.67 = icmp slt i32 %tmp.48, 0
	br i1 %tmp.67, label %br_exit.0.1, label %src_gte_br.0.1

src_gte_br.0.1:
	%tmp.68 = icmp sgt i32 %tmp.48, 7
	br i1 %tmp.68, label %br_exit.0.1, label %src_lte_mc.0.1

src_lte_mc.0.1:
	%tmp.69 = alloca %Object*
	%tmp.70 = bitcast %A* %tmp.44 to %Object*
	store %Object* %tmp.70, %Object** %tmp.69
	%tmp.71 = load %Main*, %Main** %tmp.0
	%tmp.72 = icmp eq %Main* %tmp.71, null
	br i1 %tmp.72, label %abort, label %ok.7

ok.7:
	%tmp.73 = getelementptr %Main, %Main* %tmp.71, i32 0, i32 0
	%tmp.74 = load %Main_vtable*, %Main_vtable** %tmp.73
	%tmp.75 = getelementptr %Main_vtable, %Main_vtable* %tmp.74, i32 0, i32 7
	%tmp.76 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.75
	%tmp.77 = call %Main*(%Main*, %String*) %tmp.76( %Main* %tmp.71, %String* @String.2 )
	store %Main* %tmp.77, %Main** %vtpm.4
	br label %case.exit.1

br_exit.0.1:
	br label %abort

case.exit.1:
	%vtpm.5 = load %Main*, %Main** %vtpm.4
	%tmp.78 = load %Main*, %Main** %tmp.0
	ret %Main* %tmp.78

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.79 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.80 = load i32, i32* %tmp.79
	%tmp.81 = call i8*(i32) @malloc( i32 %tmp.80 )
	%tmp.82 = bitcast i8* %tmp.81 to %Main*
	%tmp.83 = getelementptr %Main, %Main* %tmp.82, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.83
	%tmp.84 = alloca %Main*
	store %Main* %tmp.82, %Main** %tmp.84
	ret %Main* %tmp.82

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%tmp.85 = getelementptr %A_vtable, %A_vtable* @A_vtable_prototype, i32 0, i32 1
	%tmp.86 = load i32, i32* %tmp.85
	%tmp.87 = call i8*(i32) @malloc( i32 %tmp.86 )
	%tmp.88 = bitcast i8* %tmp.87 to %A*
	%tmp.89 = getelementptr %A, %A* %tmp.88, i32 0, i32 0
	store %A_vtable* @A_vtable_prototype, %A_vtable** %tmp.89
	%tmp.90 = alloca %A*
	store %A* %tmp.88, %A** %tmp.90
	%tmp.91 = getelementptr %A, %A* %tmp.88, i32 0, i32 1
	store i32 0, i32* %tmp.91
	%tmp.92 = getelementptr %A, %A* %tmp.88, i32 0, i32 2
	store i1 false, i1* %tmp.92
	%tmp.93 = getelementptr %A, %A* %tmp.88, i32 0, i32 3
	%tmp.94 = call %String* @String_new(  )
	store %String* %tmp.94, %String** %tmp.93
	%tmp.95 = getelementptr %A, %A* %tmp.88, i32 0, i32 4
	store i32 0, i32* %tmp.95
	ret %A* %tmp.88

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_set(%AA* %self, i32 %x) {

entry:
	%tmp.96 = alloca %AA*
	store %AA* %self, %AA** %tmp.96
	%tmp.97 = alloca i32
	store i32 %x, i32* %tmp.97
	%tmp.98 = load i32, i32* %tmp.97
	%tmp.99 = load %AA*, %AA** %tmp.96
	%tmp.100 = getelementptr %AA, %AA* %tmp.99, i32 0, i32 6
	store i32 %tmp.98, i32* %tmp.100
	ret i32 %tmp.98

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_get(%AA* %self) {

entry:
	%tmp.101 = alloca %AA*
	store %AA* %self, %AA** %tmp.101
	%tmp.102 = load %AA*, %AA** %tmp.101
	%tmp.103 = getelementptr %AA, %AA* %tmp.102, i32 0, i32 6
	%tmp.104 = load i32, i32* %tmp.103
	ret i32 %tmp.104

abort:
	call void @abort(  )
	unreachable
}

define %AA* @AA_new() {

entry:
	%tmp.105 = getelementptr %AA_vtable, %AA_vtable* @AA_vtable_prototype, i32 0, i32 1
	%tmp.106 = load i32, i32* %tmp.105
	%tmp.107 = call i8*(i32) @malloc( i32 %tmp.106 )
	%tmp.108 = bitcast i8* %tmp.107 to %AA*
	%tmp.109 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 0
	store %AA_vtable* @AA_vtable_prototype, %AA_vtable** %tmp.109
	%tmp.110 = alloca %AA*
	store %AA* %tmp.108, %AA** %tmp.110
	%tmp.111 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 1
	store i32 0, i32* %tmp.111
	%tmp.112 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 2
	store i1 false, i1* %tmp.112
	%tmp.113 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 3
	%tmp.114 = call %String* @String_new(  )
	store %String* %tmp.114, %String** %tmp.113
	%tmp.115 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 4
	store i32 0, i32* %tmp.115
	%tmp.116 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 5
	store i1 false, i1* %tmp.116
	%tmp.117 = getelementptr %AA, %AA* %tmp.108, i32 0, i32 6
	store i32 0, i32* %tmp.117
	ret %AA* %tmp.108

abort:
	call void @abort(  )
	unreachable
}

