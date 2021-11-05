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

@str.Bazz = internal constant [5 x i8] c"Bazz\00"
%Bazz = type {
	%Bazz_vtable*,
	i32,
	%Foo*,
	%Object*
}

%Bazz_vtable = type {
	i32,
	i32,
	i8*,
	%Bazz* () *,
	%Object* (%Bazz*) *,
	%String* (%Bazz*) *,
	%Bazz* (%Bazz*) *,
	%Bazz* (%Bazz*,%String*) *,
	%Bazz* (%Bazz*,i32) *,
	%String* (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *
}

@Bazz_vtable_prototype = constant %Bazz_vtable {
	i32 5,
	i32 ptrtoint (%Bazz* getelementptr (%Bazz, %Bazz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bazz, i32 0, i32 0),
	%Bazz* () * @Bazz_new,
	%Object* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bazz*) *),
	%String* (%Bazz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bazz*) *),
	%Bazz* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_copy to %Bazz* (%Bazz*) *),
	%Bazz* (%Bazz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bazz* (%Bazz*,%String*) *),
	%Bazz* (%Bazz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bazz* (%Bazz*,i32) *),
	%String* (%Bazz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bazz*) *),
	i32 (%Bazz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bazz*) *),
	i32 (%Bazz*) * @Bazz_printh,
	i32 (%Bazz*) * @Bazz_doh
}

@str.Foo = internal constant [4 x i8] c"Foo\00"
%Foo = type {
	%Foo_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32
}

%Foo_vtable = type {
	i32,
	i32,
	i8*,
	%Foo* () *,
	%Object* (%Foo*) *,
	%String* (%Foo*) *,
	%Foo* (%Foo*) *,
	%Foo* (%Foo*,%String*) *,
	%Foo* (%Foo*,i32) *,
	%String* (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *
}

@Foo_vtable_prototype = constant %Foo_vtable {
	i32 6,
	i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0),
	%Foo* () * @Foo_new,
	%Object* (%Foo*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Foo*) *),
	%String* (%Foo*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Foo*) *),
	%Foo* (%Foo*) * bitcast (%Object* (%Object*) * @Object_copy to %Foo* (%Foo*) *),
	%Foo* (%Foo*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Foo* (%Foo*,%String*) *),
	%Foo* (%Foo*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Foo* (%Foo*,i32) *),
	%String* (%Foo*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Foo*) *),
	i32 (%Foo*) * @Foo_doh
}

@str.Razz = internal constant [5 x i8] c"Razz\00"
%Razz = type {
	%Razz_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32
}

%Razz_vtable = type {
	i32,
	i32,
	i8*,
	%Razz* () *,
	%Object* (%Razz*) *,
	%String* (%Razz*) *,
	%Razz* (%Razz*) *,
	%Razz* (%Razz*,%String*) *,
	%Razz* (%Razz*,i32) *,
	%String* (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *
}

@Razz_vtable_prototype = constant %Razz_vtable {
	i32 7,
	i32 ptrtoint (%Razz* getelementptr (%Razz, %Razz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Razz, i32 0, i32 0),
	%Razz* () * @Razz_new,
	%Object* (%Razz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Razz*) *),
	%String* (%Razz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Razz*) *),
	%Razz* (%Razz*) * bitcast (%Object* (%Object*) * @Object_copy to %Razz* (%Razz*) *),
	%Razz* (%Razz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Razz* (%Razz*,%String*) *),
	%Razz* (%Razz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Razz* (%Razz*,i32) *),
	%String* (%Razz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Foo*) * @Foo_doh to i32 (%Razz*) *)
}

@str.Bar = internal constant [4 x i8] c"Bar\00"
%Bar = type {
	%Bar_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32,
	i32,
	%Object*
}

%Bar_vtable = type {
	i32,
	i32,
	i8*,
	%Bar* () *,
	%Object* (%Bar*) *,
	%String* (%Bar*) *,
	%Bar* (%Bar*) *,
	%Bar* (%Bar*,%String*) *,
	%Bar* (%Bar*,i32) *,
	%String* (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *
}

@Bar_vtable_prototype = constant %Bar_vtable {
	i32 8,
	i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0),
	%Bar* () * @Bar_new,
	%Object* (%Bar*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bar*) *),
	%String* (%Bar*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bar*) *),
	%Bar* (%Bar*) * bitcast (%Object* (%Object*) * @Object_copy to %Bar* (%Bar*) *),
	%Bar* (%Bar*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bar* (%Bar*,%String*) *),
	%Bar* (%Bar*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bar* (%Bar*,i32) *),
	%String* (%Bar*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Foo*) * @Foo_doh to i32 (%Bar*) *)
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%Main_vtable*,
	%Bazz*,
	%Foo*,
	%Razz*,
	%Bar*
}

%Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%String* (%Main*) *
}

@Main_vtable_prototype = constant %Main_vtable {
	i32 9,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%String* (%Main*) * @Main_main
}

@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [11 x i8] c"do nothing\00"
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [14 x i8] c"hairyscary.cl\00"
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main*() @Main_new(  )
	%main.retval = call %String*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define i32 @Bazz_printh(%Bazz* %self) {

entry:
	%tmp.0 = alloca %Bazz*
	store %Bazz* %self, %Bazz** %tmp.0
	%tmp.1 = load %Bazz*, %Bazz** %tmp.0
	%tmp.2 = getelementptr %Bazz, %Bazz* %tmp.1, i32 0, i32 1
	%tmp.3 = load i32, i32* %tmp.2
	%tmp.4 = load %Bazz*, %Bazz** %tmp.0
	%tmp.5 = icmp eq %Bazz* %tmp.4, null
	br i1 %tmp.5, label %abort, label %ok.0

ok.0:
	%tmp.6 = getelementptr %Bazz, %Bazz* %tmp.4, i32 0, i32 0
	%tmp.7 = load %Bazz_vtable*, %Bazz_vtable** %tmp.6
	%tmp.8 = getelementptr %Bazz_vtable, %Bazz_vtable* %tmp.7, i32 0, i32 8
	%tmp.9 = load %Bazz* (%Bazz*,i32) *, %Bazz* (%Bazz*,i32) ** %tmp.8
	%tmp.10 = call %Bazz*(%Bazz*, i32) %tmp.9( %Bazz* %tmp.4, i32 %tmp.3 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bazz_doh(%Bazz* %self) {

entry:
	%tmp.11 = alloca %Bazz*
	store %Bazz* %self, %Bazz** %tmp.11
	%tmp.12 = load %Bazz*, %Bazz** %tmp.11
	%tmp.13 = getelementptr %Bazz, %Bazz* %tmp.12, i32 0, i32 1
	%tmp.14 = load i32, i32* %tmp.13
	%tmp.15 = alloca i32
	store i32 %tmp.14, i32* %tmp.15
	%tmp.16 = load %Bazz*, %Bazz** %tmp.11
	%tmp.17 = getelementptr %Bazz, %Bazz* %tmp.16, i32 0, i32 1
	%tmp.18 = load i32, i32* %tmp.17
	%tmp.19 = add i32 %tmp.18, 1
	%tmp.20 = load %Bazz*, %Bazz** %tmp.11
	%tmp.21 = getelementptr %Bazz, %Bazz* %tmp.20, i32 0, i32 1
	store i32 %tmp.19, i32* %tmp.21
	%tmp.22 = load i32, i32* %tmp.15
	ret i32 %tmp.22

abort:
	call void @abort(  )
	unreachable
}

define %Bazz* @Bazz_new() {

entry:
	%tmp.23 = getelementptr %Bazz_vtable, %Bazz_vtable* @Bazz_vtable_prototype, i32 0, i32 1
	%tmp.24 = load i32, i32* %tmp.23
	%tmp.25 = call i8*(i32) @malloc( i32 %tmp.24 )
	%tmp.26 = bitcast i8* %tmp.25 to %Bazz*
	%tmp.27 = getelementptr %Bazz, %Bazz* %tmp.26, i32 0, i32 0
	store %Bazz_vtable* @Bazz_vtable_prototype, %Bazz_vtable** %tmp.27
	%tmp.28 = alloca %Bazz*
	store %Bazz* %tmp.26, %Bazz** %tmp.28
	%tmp.29 = getelementptr %Bazz, %Bazz* %tmp.26, i32 0, i32 1
	store i32 1, i32* %tmp.29
	%tmp.30 = getelementptr %Bazz, %Bazz* %tmp.26, i32 0, i32 2
	%tmp.31 = load %Bazz*, %Bazz** %tmp.28
	%vtpm.0 = icmp eq %Bazz* %tmp.31, null
	br i1 %vtpm.0, label %abort, label %ok.1

ok.1:
	%tmp.32 = getelementptr %Bazz, %Bazz* %tmp.31, i32 0, i32 0
	%tmp.33 = load %Bazz_vtable*, %Bazz_vtable** %tmp.32
	%tmp.34 = getelementptr %Bazz_vtable, %Bazz_vtable* %tmp.33, i32 0, i32 0
	%tmp.35 = load i32, i32* %tmp.34
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Foo*
	br label %case.8.0

case.8.0:
	%tmp.36 = icmp slt i32 %tmp.35, 8
	br i1 %tmp.36, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%tmp.37 = icmp sgt i32 %tmp.35, 8
	br i1 %tmp.37, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%tmp.38 = alloca %Bar*
	%tmp.39 = bitcast %Bazz* %tmp.31 to %Bar*
	store %Bar* %tmp.39, %Bar** %tmp.38
	%tmp.40 = load %Bar*, %Bar** %tmp.38
	%tmp.41 = bitcast %Bar* %tmp.40 to %Foo*
	store %Foo* %tmp.41, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%tmp.42 = icmp slt i32 %tmp.35, 7
	br i1 %tmp.42, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.43 = icmp sgt i32 %tmp.35, 8
	br i1 %tmp.43, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.44 = alloca %Razz*
	%tmp.45 = bitcast %Bazz* %tmp.31 to %Razz*
	store %Razz* %tmp.45, %Razz** %tmp.44
	%tmp.46 = call %Bar* @Bar_new(  )
	%tmp.47 = bitcast %Bar* %tmp.46 to %Foo*
	store %Foo* %tmp.47, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%tmp.48 = icmp slt i32 %tmp.35, 6
	br i1 %tmp.48, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%tmp.49 = icmp sgt i32 %tmp.35, 8
	br i1 %tmp.49, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%tmp.50 = alloca %Foo*
	%tmp.51 = bitcast %Bazz* %tmp.31 to %Foo*
	store %Foo* %tmp.51, %Foo** %tmp.50
	%tmp.52 = call %Razz* @Razz_new(  )
	%tmp.53 = bitcast %Razz* %tmp.52 to %Foo*
	store %Foo* %tmp.53, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%tmp.54 = icmp slt i32 %tmp.35, 5
	br i1 %tmp.54, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%tmp.55 = icmp sgt i32 %tmp.35, 8
	br i1 %tmp.55, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%tmp.56 = alloca %Bazz*
	store %Bazz* %tmp.31, %Bazz** %tmp.56
	%tmp.57 = call %Foo* @Foo_new(  )
	store %Foo* %tmp.57, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Foo*, %Foo** %vtpm.1
	store %Foo* %vtpm.2, %Foo** %tmp.30
	%tmp.58 = getelementptr %Bazz, %Bazz* %tmp.26, i32 0, i32 3
	%tmp.59 = load %Bazz*, %Bazz** %tmp.28
	%tmp.60 = icmp eq %Bazz* %tmp.59, null
	br i1 %tmp.60, label %abort, label %ok.2

ok.2:
	%tmp.61 = getelementptr %Bazz, %Bazz* %tmp.59, i32 0, i32 0
	%tmp.62 = load %Bazz_vtable*, %Bazz_vtable** %tmp.61
	%tmp.63 = getelementptr %Bazz_vtable, %Bazz_vtable* %tmp.62, i32 0, i32 11
	%tmp.64 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %tmp.63
	%tmp.65 = call i32(%Bazz*) %tmp.64( %Bazz* %tmp.59 )
	%tmp.66 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.66, i32 %tmp.65 )
	%tmp.67 = bitcast %Int* %tmp.66 to %Object*
	store %Object* %tmp.67, %Object** %tmp.58
	ret %Bazz* %tmp.26

abort:
	call void @abort(  )
	unreachable
}

define i32 @Foo_doh(%Foo* %self) {

entry:
	%tmp.68 = alloca %Foo*
	store %Foo* %self, %Foo** %tmp.68
	%tmp.69 = load %Foo*, %Foo** %tmp.68
	%tmp.70 = getelementptr %Foo, %Foo* %tmp.69, i32 0, i32 1
	%tmp.71 = load i32, i32* %tmp.70
	%tmp.72 = alloca i32
	store i32 %tmp.71, i32* %tmp.72
	%tmp.73 = load %Foo*, %Foo** %tmp.68
	%tmp.74 = getelementptr %Foo, %Foo* %tmp.73, i32 0, i32 1
	%tmp.75 = load i32, i32* %tmp.74
	%tmp.76 = add i32 %tmp.75, 2
	%tmp.77 = load %Foo*, %Foo** %tmp.68
	%tmp.78 = getelementptr %Foo, %Foo* %tmp.77, i32 0, i32 1
	store i32 %tmp.76, i32* %tmp.78
	%tmp.79 = load i32, i32* %tmp.72
	ret i32 %tmp.79

abort:
	call void @abort(  )
	unreachable
}

define %Foo* @Foo_new() {

entry:
	%tmp.80 = getelementptr %Foo_vtable, %Foo_vtable* @Foo_vtable_prototype, i32 0, i32 1
	%tmp.81 = load i32, i32* %tmp.80
	%tmp.82 = call i8*(i32) @malloc( i32 %tmp.81 )
	%tmp.83 = bitcast i8* %tmp.82 to %Foo*
	%tmp.84 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 0
	store %Foo_vtable* @Foo_vtable_prototype, %Foo_vtable** %tmp.84
	%tmp.85 = alloca %Foo*
	store %Foo* %tmp.83, %Foo** %tmp.85
	%tmp.86 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 1
	store i32 1, i32* %tmp.86
	%tmp.87 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 2
	%tmp.88 = load %Foo*, %Foo** %tmp.85
	%vtpm.0 = icmp eq %Foo* %tmp.88, null
	br i1 %vtpm.0, label %abort, label %ok.0

ok.0:
	%tmp.89 = getelementptr %Foo, %Foo* %tmp.88, i32 0, i32 0
	%tmp.90 = load %Foo_vtable*, %Foo_vtable** %tmp.89
	%tmp.91 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.90, i32 0, i32 0
	%tmp.92 = load i32, i32* %tmp.91
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Foo*
	br label %case.8.0

case.8.0:
	%tmp.93 = icmp slt i32 %tmp.92, 8
	br i1 %tmp.93, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%tmp.94 = icmp sgt i32 %tmp.92, 8
	br i1 %tmp.94, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%tmp.95 = alloca %Bar*
	%tmp.96 = bitcast %Foo* %tmp.88 to %Bar*
	store %Bar* %tmp.96, %Bar** %tmp.95
	%tmp.97 = load %Bar*, %Bar** %tmp.95
	%tmp.98 = bitcast %Bar* %tmp.97 to %Foo*
	store %Foo* %tmp.98, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%tmp.99 = icmp slt i32 %tmp.92, 7
	br i1 %tmp.99, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.100 = icmp sgt i32 %tmp.92, 8
	br i1 %tmp.100, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.101 = alloca %Razz*
	%tmp.102 = bitcast %Foo* %tmp.88 to %Razz*
	store %Razz* %tmp.102, %Razz** %tmp.101
	%tmp.103 = call %Bar* @Bar_new(  )
	%tmp.104 = bitcast %Bar* %tmp.103 to %Foo*
	store %Foo* %tmp.104, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%tmp.105 = icmp slt i32 %tmp.92, 6
	br i1 %tmp.105, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%tmp.106 = icmp sgt i32 %tmp.92, 8
	br i1 %tmp.106, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%tmp.107 = alloca %Foo*
	store %Foo* %tmp.88, %Foo** %tmp.107
	%tmp.108 = call %Razz* @Razz_new(  )
	%tmp.109 = bitcast %Razz* %tmp.108 to %Foo*
	store %Foo* %tmp.109, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%tmp.110 = icmp slt i32 %tmp.92, 5
	br i1 %tmp.110, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%tmp.111 = icmp sgt i32 %tmp.92, 8
	br i1 %tmp.111, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%tmp.112 = alloca %Bazz*
	%tmp.113 = bitcast %Foo* %tmp.88 to %Bazz*
	store %Bazz* %tmp.113, %Bazz** %tmp.112
	%tmp.114 = call %Foo* @Foo_new(  )
	store %Foo* %tmp.114, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Foo*, %Foo** %vtpm.1
	store %Foo* %vtpm.2, %Foo** %tmp.87
	%tmp.115 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 3
	%tmp.116 = load %Foo*, %Foo** %tmp.85
	%tmp.117 = icmp eq %Foo* %tmp.116, null
	br i1 %tmp.117, label %abort, label %ok.1

ok.1:
	%tmp.118 = getelementptr %Foo, %Foo* %tmp.116, i32 0, i32 0
	%tmp.119 = load %Foo_vtable*, %Foo_vtable** %tmp.118
	%tmp.120 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.119, i32 0, i32 11
	%tmp.121 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.120
	%tmp.122 = call i32(%Foo*) %tmp.121( %Foo* %tmp.116 )
	%tmp.123 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.123, i32 %tmp.122 )
	%tmp.124 = bitcast %Int* %tmp.123 to %Object*
	store %Object* %tmp.124, %Object** %tmp.115
	%tmp.125 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 4
	%tmp.126 = load %Foo*, %Foo** %tmp.85
	%vtpm.3 = icmp eq %Foo* %tmp.126, null
	br i1 %vtpm.3, label %abort, label %ok.2

ok.2:
	%tmp.127 = getelementptr %Foo, %Foo* %tmp.126, i32 0, i32 0
	%tmp.128 = load %Foo_vtable*, %Foo_vtable** %tmp.127
	%tmp.129 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.128, i32 0, i32 0
	%tmp.130 = load i32, i32* %tmp.129
	br label %case.hdr.1

case.hdr.1:
	%vtpm.4 = alloca %Bar*
	br label %case.8.1

case.8.1:
	%tmp.131 = icmp slt i32 %tmp.130, 8
	br i1 %tmp.131, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%tmp.132 = icmp sgt i32 %tmp.130, 8
	br i1 %tmp.132, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%tmp.133 = alloca %Bar*
	%tmp.134 = bitcast %Foo* %tmp.126 to %Bar*
	store %Bar* %tmp.134, %Bar** %tmp.133
	%tmp.135 = load %Bar*, %Bar** %tmp.133
	%tmp.136 = bitcast %Bar* %tmp.135 to %Razz*
	%tmp.137 = bitcast %Razz* %tmp.136 to %Bar*
	store %Bar* %tmp.137, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%tmp.138 = icmp slt i32 %tmp.130, 7
	br i1 %tmp.138, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%tmp.139 = icmp sgt i32 %tmp.130, 8
	br i1 %tmp.139, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%tmp.140 = alloca %Razz*
	%tmp.141 = bitcast %Foo* %tmp.126 to %Razz*
	store %Razz* %tmp.141, %Razz** %tmp.140
	%tmp.142 = call %Bar* @Bar_new(  )
	%tmp.143 = bitcast %Bar* %tmp.142 to %Razz*
	%tmp.144 = bitcast %Razz* %tmp.143 to %Bar*
	store %Bar* %tmp.144, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%tmp.145 = icmp slt i32 %tmp.130, 6
	br i1 %tmp.145, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%tmp.146 = icmp sgt i32 %tmp.130, 8
	br i1 %tmp.146, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%tmp.147 = alloca %Foo*
	store %Foo* %tmp.126, %Foo** %tmp.147
	%tmp.148 = call %Razz* @Razz_new(  )
	%tmp.149 = bitcast %Razz* %tmp.148 to %Bar*
	store %Bar* %tmp.149, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%vtpm.5 = load %Bar*, %Bar** %vtpm.4
	%tmp.150 = bitcast %Bar* %vtpm.5 to %Razz*
	store %Razz* %tmp.150, %Razz** %tmp.125
	%tmp.151 = getelementptr %Foo, %Foo* %tmp.83, i32 0, i32 5
	%tmp.152 = load %Foo*, %Foo** %tmp.85
	%tmp.153 = getelementptr %Foo, %Foo* %tmp.152, i32 0, i32 4
	%tmp.154 = load %Razz*, %Razz** %tmp.153
	%tmp.155 = icmp eq %Razz* %tmp.154, null
	br i1 %tmp.155, label %abort, label %ok.3

ok.3:
	%tmp.156 = getelementptr %Razz, %Razz* %tmp.154, i32 0, i32 0
	%tmp.157 = load %Razz_vtable*, %Razz_vtable** %tmp.156
	%tmp.158 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.157, i32 0, i32 12
	%tmp.159 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.158
	%tmp.160 = call i32(%Razz*) %tmp.159( %Razz* %tmp.154 )
	%tmp.161 = load %Foo*, %Foo** %tmp.85
	%tmp.162 = getelementptr %Foo, %Foo* %tmp.161, i32 0, i32 2
	%tmp.163 = load %Foo*, %Foo** %tmp.162
	%tmp.164 = icmp eq %Foo* %tmp.163, null
	br i1 %tmp.164, label %abort, label %ok.4

ok.4:
	%tmp.165 = getelementptr %Foo, %Foo* %tmp.163, i32 0, i32 0
	%tmp.166 = load %Foo_vtable*, %Foo_vtable** %tmp.165
	%tmp.167 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.166, i32 0, i32 12
	%tmp.168 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.167
	%tmp.169 = call i32(%Foo*) %tmp.168( %Foo* %tmp.163 )
	%tmp.170 = add i32 %tmp.160, %tmp.169
	%tmp.171 = load %Foo*, %Foo** %tmp.85
	%tmp.172 = icmp eq %Foo* %tmp.171, null
	br i1 %tmp.172, label %abort, label %ok.5

ok.5:
	%tmp.173 = getelementptr %Foo, %Foo* %tmp.171, i32 0, i32 0
	%tmp.174 = load %Foo_vtable*, %Foo_vtable** %tmp.173
	%tmp.175 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.174, i32 0, i32 12
	%tmp.176 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.175
	%tmp.177 = call i32(%Foo*) %tmp.176( %Foo* %tmp.171 )
	%tmp.178 = add i32 %tmp.170, %tmp.177
	%tmp.179 = load %Foo*, %Foo** %tmp.85
	%tmp.180 = icmp eq %Foo* %tmp.179, null
	br i1 %tmp.180, label %abort, label %ok.6

ok.6:
	%tmp.181 = getelementptr %Foo, %Foo* %tmp.179, i32 0, i32 0
	%tmp.182 = load %Foo_vtable*, %Foo_vtable** %tmp.181
	%tmp.183 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.182, i32 0, i32 11
	%tmp.184 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.183
	%tmp.185 = call i32(%Foo*) %tmp.184( %Foo* %tmp.179 )
	%tmp.186 = add i32 %tmp.178, %tmp.185
	store i32 %tmp.186, i32* %tmp.151
	ret %Foo* %tmp.83

abort:
	call void @abort(  )
	unreachable
}

define %Razz* @Razz_new() {

entry:
	%tmp.187 = getelementptr %Razz_vtable, %Razz_vtable* @Razz_vtable_prototype, i32 0, i32 1
	%tmp.188 = load i32, i32* %tmp.187
	%tmp.189 = call i8*(i32) @malloc( i32 %tmp.188 )
	%tmp.190 = bitcast i8* %tmp.189 to %Razz*
	%tmp.191 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 0
	store %Razz_vtable* @Razz_vtable_prototype, %Razz_vtable** %tmp.191
	%tmp.192 = alloca %Razz*
	store %Razz* %tmp.190, %Razz** %tmp.192
	%tmp.193 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 1
	store i32 1, i32* %tmp.193
	%tmp.194 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 2
	%tmp.195 = load %Razz*, %Razz** %tmp.192
	%vtpm.0 = icmp eq %Razz* %tmp.195, null
	br i1 %vtpm.0, label %abort, label %ok.0

ok.0:
	%tmp.196 = getelementptr %Razz, %Razz* %tmp.195, i32 0, i32 0
	%tmp.197 = load %Razz_vtable*, %Razz_vtable** %tmp.196
	%tmp.198 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.197, i32 0, i32 0
	%tmp.199 = load i32, i32* %tmp.198
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Foo*
	br label %case.8.0

case.8.0:
	%tmp.200 = icmp slt i32 %tmp.199, 8
	br i1 %tmp.200, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%tmp.201 = icmp sgt i32 %tmp.199, 8
	br i1 %tmp.201, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%tmp.202 = alloca %Bar*
	%tmp.203 = bitcast %Razz* %tmp.195 to %Bar*
	store %Bar* %tmp.203, %Bar** %tmp.202
	%tmp.204 = load %Bar*, %Bar** %tmp.202
	%tmp.205 = bitcast %Bar* %tmp.204 to %Foo*
	store %Foo* %tmp.205, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%tmp.206 = icmp slt i32 %tmp.199, 7
	br i1 %tmp.206, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.207 = icmp sgt i32 %tmp.199, 8
	br i1 %tmp.207, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.208 = alloca %Razz*
	store %Razz* %tmp.195, %Razz** %tmp.208
	%tmp.209 = call %Bar* @Bar_new(  )
	%tmp.210 = bitcast %Bar* %tmp.209 to %Foo*
	store %Foo* %tmp.210, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%tmp.211 = icmp slt i32 %tmp.199, 6
	br i1 %tmp.211, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%tmp.212 = icmp sgt i32 %tmp.199, 8
	br i1 %tmp.212, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%tmp.213 = alloca %Foo*
	%tmp.214 = bitcast %Razz* %tmp.195 to %Foo*
	store %Foo* %tmp.214, %Foo** %tmp.213
	%tmp.215 = call %Razz* @Razz_new(  )
	%tmp.216 = bitcast %Razz* %tmp.215 to %Foo*
	store %Foo* %tmp.216, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%tmp.217 = icmp slt i32 %tmp.199, 5
	br i1 %tmp.217, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%tmp.218 = icmp sgt i32 %tmp.199, 8
	br i1 %tmp.218, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%tmp.219 = alloca %Bazz*
	%tmp.220 = bitcast %Razz* %tmp.195 to %Bazz*
	store %Bazz* %tmp.220, %Bazz** %tmp.219
	%tmp.221 = call %Foo* @Foo_new(  )
	store %Foo* %tmp.221, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Foo*, %Foo** %vtpm.1
	store %Foo* %vtpm.2, %Foo** %tmp.194
	%tmp.222 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 3
	%tmp.223 = load %Razz*, %Razz** %tmp.192
	%tmp.224 = icmp eq %Razz* %tmp.223, null
	br i1 %tmp.224, label %abort, label %ok.1

ok.1:
	%tmp.225 = getelementptr %Razz, %Razz* %tmp.223, i32 0, i32 0
	%tmp.226 = load %Razz_vtable*, %Razz_vtable** %tmp.225
	%tmp.227 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.226, i32 0, i32 11
	%tmp.228 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.227
	%tmp.229 = call i32(%Razz*) %tmp.228( %Razz* %tmp.223 )
	%tmp.230 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.230, i32 %tmp.229 )
	%tmp.231 = bitcast %Int* %tmp.230 to %Object*
	store %Object* %tmp.231, %Object** %tmp.222
	%tmp.232 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 4
	%tmp.233 = load %Razz*, %Razz** %tmp.192
	%vtpm.3 = icmp eq %Razz* %tmp.233, null
	br i1 %vtpm.3, label %abort, label %ok.2

ok.2:
	%tmp.234 = getelementptr %Razz, %Razz* %tmp.233, i32 0, i32 0
	%tmp.235 = load %Razz_vtable*, %Razz_vtable** %tmp.234
	%tmp.236 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.235, i32 0, i32 0
	%tmp.237 = load i32, i32* %tmp.236
	br label %case.hdr.1

case.hdr.1:
	%vtpm.4 = alloca %Bar*
	br label %case.8.1

case.8.1:
	%tmp.238 = icmp slt i32 %tmp.237, 8
	br i1 %tmp.238, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%tmp.239 = icmp sgt i32 %tmp.237, 8
	br i1 %tmp.239, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%tmp.240 = alloca %Bar*
	%tmp.241 = bitcast %Razz* %tmp.233 to %Bar*
	store %Bar* %tmp.241, %Bar** %tmp.240
	%tmp.242 = load %Bar*, %Bar** %tmp.240
	%tmp.243 = bitcast %Bar* %tmp.242 to %Razz*
	%tmp.244 = bitcast %Razz* %tmp.243 to %Bar*
	store %Bar* %tmp.244, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%tmp.245 = icmp slt i32 %tmp.237, 7
	br i1 %tmp.245, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%tmp.246 = icmp sgt i32 %tmp.237, 8
	br i1 %tmp.246, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%tmp.247 = alloca %Razz*
	store %Razz* %tmp.233, %Razz** %tmp.247
	%tmp.248 = call %Bar* @Bar_new(  )
	%tmp.249 = bitcast %Bar* %tmp.248 to %Razz*
	%tmp.250 = bitcast %Razz* %tmp.249 to %Bar*
	store %Bar* %tmp.250, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%tmp.251 = icmp slt i32 %tmp.237, 6
	br i1 %tmp.251, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%tmp.252 = icmp sgt i32 %tmp.237, 8
	br i1 %tmp.252, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%tmp.253 = alloca %Foo*
	%tmp.254 = bitcast %Razz* %tmp.233 to %Foo*
	store %Foo* %tmp.254, %Foo** %tmp.253
	%tmp.255 = call %Razz* @Razz_new(  )
	%tmp.256 = bitcast %Razz* %tmp.255 to %Bar*
	store %Bar* %tmp.256, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%vtpm.5 = load %Bar*, %Bar** %vtpm.4
	%tmp.257 = bitcast %Bar* %vtpm.5 to %Razz*
	store %Razz* %tmp.257, %Razz** %tmp.232
	%tmp.258 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 5
	%tmp.259 = load %Razz*, %Razz** %tmp.192
	%tmp.260 = getelementptr %Razz, %Razz* %tmp.259, i32 0, i32 4
	%tmp.261 = load %Razz*, %Razz** %tmp.260
	%tmp.262 = icmp eq %Razz* %tmp.261, null
	br i1 %tmp.262, label %abort, label %ok.3

ok.3:
	%tmp.263 = getelementptr %Razz, %Razz* %tmp.261, i32 0, i32 0
	%tmp.264 = load %Razz_vtable*, %Razz_vtable** %tmp.263
	%tmp.265 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.264, i32 0, i32 12
	%tmp.266 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.265
	%tmp.267 = call i32(%Razz*) %tmp.266( %Razz* %tmp.261 )
	%tmp.268 = load %Razz*, %Razz** %tmp.192
	%tmp.269 = getelementptr %Razz, %Razz* %tmp.268, i32 0, i32 2
	%tmp.270 = load %Foo*, %Foo** %tmp.269
	%tmp.271 = icmp eq %Foo* %tmp.270, null
	br i1 %tmp.271, label %abort, label %ok.4

ok.4:
	%tmp.272 = getelementptr %Foo, %Foo* %tmp.270, i32 0, i32 0
	%tmp.273 = load %Foo_vtable*, %Foo_vtable** %tmp.272
	%tmp.274 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.273, i32 0, i32 12
	%tmp.275 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.274
	%tmp.276 = call i32(%Foo*) %tmp.275( %Foo* %tmp.270 )
	%tmp.277 = add i32 %tmp.267, %tmp.276
	%tmp.278 = load %Razz*, %Razz** %tmp.192
	%tmp.279 = icmp eq %Razz* %tmp.278, null
	br i1 %tmp.279, label %abort, label %ok.5

ok.5:
	%tmp.280 = getelementptr %Razz, %Razz* %tmp.278, i32 0, i32 0
	%tmp.281 = load %Razz_vtable*, %Razz_vtable** %tmp.280
	%tmp.282 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.281, i32 0, i32 12
	%tmp.283 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.282
	%tmp.284 = call i32(%Razz*) %tmp.283( %Razz* %tmp.278 )
	%tmp.285 = add i32 %tmp.277, %tmp.284
	%tmp.286 = load %Razz*, %Razz** %tmp.192
	%tmp.287 = icmp eq %Razz* %tmp.286, null
	br i1 %tmp.287, label %abort, label %ok.6

ok.6:
	%tmp.288 = getelementptr %Razz, %Razz* %tmp.286, i32 0, i32 0
	%tmp.289 = load %Razz_vtable*, %Razz_vtable** %tmp.288
	%tmp.290 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.289, i32 0, i32 11
	%tmp.291 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.290
	%tmp.292 = call i32(%Razz*) %tmp.291( %Razz* %tmp.286 )
	%tmp.293 = add i32 %tmp.285, %tmp.292
	store i32 %tmp.293, i32* %tmp.258
	%tmp.294 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 6
	%tmp.295 = load %Razz*, %Razz** %tmp.192
	%vtpm.6 = icmp eq %Razz* %tmp.295, null
	br i1 %vtpm.6, label %abort, label %ok.7

ok.7:
	%tmp.296 = getelementptr %Razz, %Razz* %tmp.295, i32 0, i32 0
	%tmp.297 = load %Razz_vtable*, %Razz_vtable** %tmp.296
	%tmp.298 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.297, i32 0, i32 0
	%tmp.299 = load i32, i32* %tmp.298
	br label %case.hdr.2

case.hdr.2:
	%vtpm.7 = alloca %Bar*
	br label %case.8.2

case.8.2:
	%tmp.300 = icmp slt i32 %tmp.299, 8
	br i1 %tmp.300, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%tmp.301 = icmp sgt i32 %tmp.299, 8
	br i1 %tmp.301, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	%tmp.302 = alloca %Bar*
	%tmp.303 = bitcast %Razz* %tmp.295 to %Bar*
	store %Bar* %tmp.303, %Bar** %tmp.302
	%tmp.304 = load %Bar*, %Bar** %tmp.302
	store %Bar* %tmp.304, %Bar** %vtpm.7
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%tmp.305 = icmp slt i32 %tmp.299, 7
	br i1 %tmp.305, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%tmp.306 = icmp sgt i32 %tmp.299, 8
	br i1 %tmp.306, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	%tmp.307 = alloca %Razz*
	store %Razz* %tmp.295, %Razz** %tmp.307
	%tmp.308 = call %Bar* @Bar_new(  )
	store %Bar* %tmp.308, %Bar** %vtpm.7
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%vtpm.8 = load %Bar*, %Bar** %vtpm.7
	store %Bar* %vtpm.8, %Bar** %tmp.294
	%tmp.309 = getelementptr %Razz, %Razz* %tmp.190, i32 0, i32 7
	%tmp.310 = load %Razz*, %Razz** %tmp.192
	%tmp.311 = getelementptr %Razz, %Razz* %tmp.310, i32 0, i32 4
	%tmp.312 = load %Razz*, %Razz** %tmp.311
	%tmp.313 = icmp eq %Razz* %tmp.312, null
	br i1 %tmp.313, label %abort, label %ok.8

ok.8:
	%tmp.314 = getelementptr %Bazz_vtable, %Bazz_vtable* @Bazz_vtable_prototype, i32 0, i32 12
	%tmp.315 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %tmp.314
	%tmp.316 = bitcast %Razz* %tmp.312 to %Bazz*
	%tmp.317 = call i32(%Bazz*) %tmp.315( %Bazz* %tmp.316 )
	%tmp.318 = load %Razz*, %Razz** %tmp.192
	%tmp.319 = getelementptr %Razz, %Razz* %tmp.318, i32 0, i32 2
	%tmp.320 = load %Foo*, %Foo** %tmp.319
	%tmp.321 = icmp eq %Foo* %tmp.320, null
	br i1 %tmp.321, label %abort, label %ok.9

ok.9:
	%tmp.322 = getelementptr %Foo, %Foo* %tmp.320, i32 0, i32 0
	%tmp.323 = load %Foo_vtable*, %Foo_vtable** %tmp.322
	%tmp.324 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.323, i32 0, i32 12
	%tmp.325 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.324
	%tmp.326 = call i32(%Foo*) %tmp.325( %Foo* %tmp.320 )
	%tmp.327 = add i32 %tmp.317, %tmp.326
	%tmp.328 = load %Razz*, %Razz** %tmp.192
	%tmp.329 = getelementptr %Razz, %Razz* %tmp.328, i32 0, i32 6
	%tmp.330 = load %Bar*, %Bar** %tmp.329
	%tmp.331 = icmp eq %Bar* %tmp.330, null
	br i1 %tmp.331, label %abort, label %ok.10

ok.10:
	%tmp.332 = getelementptr %Bar, %Bar* %tmp.330, i32 0, i32 0
	%tmp.333 = load %Bar_vtable*, %Bar_vtable** %tmp.332
	%tmp.334 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.333, i32 0, i32 12
	%tmp.335 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.334
	%tmp.336 = call i32(%Bar*) %tmp.335( %Bar* %tmp.330 )
	%tmp.337 = add i32 %tmp.327, %tmp.336
	%tmp.338 = load %Razz*, %Razz** %tmp.192
	%tmp.339 = icmp eq %Razz* %tmp.338, null
	br i1 %tmp.339, label %abort, label %ok.11

ok.11:
	%tmp.340 = getelementptr %Razz, %Razz* %tmp.338, i32 0, i32 0
	%tmp.341 = load %Razz_vtable*, %Razz_vtable** %tmp.340
	%tmp.342 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.341, i32 0, i32 12
	%tmp.343 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.342
	%tmp.344 = call i32(%Razz*) %tmp.343( %Razz* %tmp.338 )
	%tmp.345 = add i32 %tmp.337, %tmp.344
	%tmp.346 = load %Razz*, %Razz** %tmp.192
	%tmp.347 = icmp eq %Razz* %tmp.346, null
	br i1 %tmp.347, label %abort, label %ok.12

ok.12:
	%tmp.348 = getelementptr %Razz, %Razz* %tmp.346, i32 0, i32 0
	%tmp.349 = load %Razz_vtable*, %Razz_vtable** %tmp.348
	%tmp.350 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.349, i32 0, i32 11
	%tmp.351 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.350
	%tmp.352 = call i32(%Razz*) %tmp.351( %Razz* %tmp.346 )
	%tmp.353 = add i32 %tmp.345, %tmp.352
	store i32 %tmp.353, i32* %tmp.309
	ret %Razz* %tmp.190

abort:
	call void @abort(  )
	unreachable
}

define %Bar* @Bar_new() {

entry:
	%tmp.354 = getelementptr %Bar_vtable, %Bar_vtable* @Bar_vtable_prototype, i32 0, i32 1
	%tmp.355 = load i32, i32* %tmp.354
	%tmp.356 = call i8*(i32) @malloc( i32 %tmp.355 )
	%tmp.357 = bitcast i8* %tmp.356 to %Bar*
	%tmp.358 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 0
	store %Bar_vtable* @Bar_vtable_prototype, %Bar_vtable** %tmp.358
	%tmp.359 = alloca %Bar*
	store %Bar* %tmp.357, %Bar** %tmp.359
	%tmp.360 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 1
	store i32 1, i32* %tmp.360
	%tmp.361 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 2
	%tmp.362 = load %Bar*, %Bar** %tmp.359
	%vtpm.0 = icmp eq %Bar* %tmp.362, null
	br i1 %vtpm.0, label %abort, label %ok.0

ok.0:
	%tmp.363 = getelementptr %Bar, %Bar* %tmp.362, i32 0, i32 0
	%tmp.364 = load %Bar_vtable*, %Bar_vtable** %tmp.363
	%tmp.365 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.364, i32 0, i32 0
	%tmp.366 = load i32, i32* %tmp.365
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Foo*
	br label %case.8.0

case.8.0:
	%tmp.367 = icmp slt i32 %tmp.366, 8
	br i1 %tmp.367, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%tmp.368 = icmp sgt i32 %tmp.366, 8
	br i1 %tmp.368, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%tmp.369 = alloca %Bar*
	store %Bar* %tmp.362, %Bar** %tmp.369
	%tmp.370 = load %Bar*, %Bar** %tmp.369
	%tmp.371 = bitcast %Bar* %tmp.370 to %Foo*
	store %Foo* %tmp.371, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%tmp.372 = icmp slt i32 %tmp.366, 7
	br i1 %tmp.372, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.373 = icmp sgt i32 %tmp.366, 8
	br i1 %tmp.373, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.374 = alloca %Razz*
	%tmp.375 = bitcast %Bar* %tmp.362 to %Razz*
	store %Razz* %tmp.375, %Razz** %tmp.374
	%tmp.376 = call %Bar* @Bar_new(  )
	%tmp.377 = bitcast %Bar* %tmp.376 to %Foo*
	store %Foo* %tmp.377, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%tmp.378 = icmp slt i32 %tmp.366, 6
	br i1 %tmp.378, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%tmp.379 = icmp sgt i32 %tmp.366, 8
	br i1 %tmp.379, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%tmp.380 = alloca %Foo*
	%tmp.381 = bitcast %Bar* %tmp.362 to %Foo*
	store %Foo* %tmp.381, %Foo** %tmp.380
	%tmp.382 = call %Razz* @Razz_new(  )
	%tmp.383 = bitcast %Razz* %tmp.382 to %Foo*
	store %Foo* %tmp.383, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%tmp.384 = icmp slt i32 %tmp.366, 5
	br i1 %tmp.384, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%tmp.385 = icmp sgt i32 %tmp.366, 8
	br i1 %tmp.385, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%tmp.386 = alloca %Bazz*
	%tmp.387 = bitcast %Bar* %tmp.362 to %Bazz*
	store %Bazz* %tmp.387, %Bazz** %tmp.386
	%tmp.388 = call %Foo* @Foo_new(  )
	store %Foo* %tmp.388, %Foo** %vtpm.1
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Foo*, %Foo** %vtpm.1
	store %Foo* %vtpm.2, %Foo** %tmp.361
	%tmp.389 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 3
	%tmp.390 = load %Bar*, %Bar** %tmp.359
	%tmp.391 = icmp eq %Bar* %tmp.390, null
	br i1 %tmp.391, label %abort, label %ok.1

ok.1:
	%tmp.392 = getelementptr %Bar, %Bar* %tmp.390, i32 0, i32 0
	%tmp.393 = load %Bar_vtable*, %Bar_vtable** %tmp.392
	%tmp.394 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.393, i32 0, i32 11
	%tmp.395 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.394
	%tmp.396 = call i32(%Bar*) %tmp.395( %Bar* %tmp.390 )
	%tmp.397 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.397, i32 %tmp.396 )
	%tmp.398 = bitcast %Int* %tmp.397 to %Object*
	store %Object* %tmp.398, %Object** %tmp.389
	%tmp.399 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 4
	%tmp.400 = load %Bar*, %Bar** %tmp.359
	%vtpm.3 = icmp eq %Bar* %tmp.400, null
	br i1 %vtpm.3, label %abort, label %ok.2

ok.2:
	%tmp.401 = getelementptr %Bar, %Bar* %tmp.400, i32 0, i32 0
	%tmp.402 = load %Bar_vtable*, %Bar_vtable** %tmp.401
	%tmp.403 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.402, i32 0, i32 0
	%tmp.404 = load i32, i32* %tmp.403
	br label %case.hdr.1

case.hdr.1:
	%vtpm.4 = alloca %Bar*
	br label %case.8.1

case.8.1:
	%tmp.405 = icmp slt i32 %tmp.404, 8
	br i1 %tmp.405, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%tmp.406 = icmp sgt i32 %tmp.404, 8
	br i1 %tmp.406, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%tmp.407 = alloca %Bar*
	store %Bar* %tmp.400, %Bar** %tmp.407
	%tmp.408 = load %Bar*, %Bar** %tmp.407
	%tmp.409 = bitcast %Bar* %tmp.408 to %Razz*
	%tmp.410 = bitcast %Razz* %tmp.409 to %Bar*
	store %Bar* %tmp.410, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%tmp.411 = icmp slt i32 %tmp.404, 7
	br i1 %tmp.411, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%tmp.412 = icmp sgt i32 %tmp.404, 8
	br i1 %tmp.412, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%tmp.413 = alloca %Razz*
	%tmp.414 = bitcast %Bar* %tmp.400 to %Razz*
	store %Razz* %tmp.414, %Razz** %tmp.413
	%tmp.415 = call %Bar* @Bar_new(  )
	%tmp.416 = bitcast %Bar* %tmp.415 to %Razz*
	%tmp.417 = bitcast %Razz* %tmp.416 to %Bar*
	store %Bar* %tmp.417, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%tmp.418 = icmp slt i32 %tmp.404, 6
	br i1 %tmp.418, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%tmp.419 = icmp sgt i32 %tmp.404, 8
	br i1 %tmp.419, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%tmp.420 = alloca %Foo*
	%tmp.421 = bitcast %Bar* %tmp.400 to %Foo*
	store %Foo* %tmp.421, %Foo** %tmp.420
	%tmp.422 = call %Razz* @Razz_new(  )
	%tmp.423 = bitcast %Razz* %tmp.422 to %Bar*
	store %Bar* %tmp.423, %Bar** %vtpm.4
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%vtpm.5 = load %Bar*, %Bar** %vtpm.4
	%tmp.424 = bitcast %Bar* %vtpm.5 to %Razz*
	store %Razz* %tmp.424, %Razz** %tmp.399
	%tmp.425 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 5
	%tmp.426 = load %Bar*, %Bar** %tmp.359
	%tmp.427 = getelementptr %Bar, %Bar* %tmp.426, i32 0, i32 4
	%tmp.428 = load %Razz*, %Razz** %tmp.427
	%tmp.429 = icmp eq %Razz* %tmp.428, null
	br i1 %tmp.429, label %abort, label %ok.3

ok.3:
	%tmp.430 = getelementptr %Razz, %Razz* %tmp.428, i32 0, i32 0
	%tmp.431 = load %Razz_vtable*, %Razz_vtable** %tmp.430
	%tmp.432 = getelementptr %Razz_vtable, %Razz_vtable* %tmp.431, i32 0, i32 12
	%tmp.433 = load i32 (%Razz*) *, i32 (%Razz*) ** %tmp.432
	%tmp.434 = call i32(%Razz*) %tmp.433( %Razz* %tmp.428 )
	%tmp.435 = load %Bar*, %Bar** %tmp.359
	%tmp.436 = getelementptr %Bar, %Bar* %tmp.435, i32 0, i32 2
	%tmp.437 = load %Foo*, %Foo** %tmp.436
	%tmp.438 = icmp eq %Foo* %tmp.437, null
	br i1 %tmp.438, label %abort, label %ok.4

ok.4:
	%tmp.439 = getelementptr %Foo, %Foo* %tmp.437, i32 0, i32 0
	%tmp.440 = load %Foo_vtable*, %Foo_vtable** %tmp.439
	%tmp.441 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.440, i32 0, i32 12
	%tmp.442 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.441
	%tmp.443 = call i32(%Foo*) %tmp.442( %Foo* %tmp.437 )
	%tmp.444 = add i32 %tmp.434, %tmp.443
	%tmp.445 = load %Bar*, %Bar** %tmp.359
	%tmp.446 = icmp eq %Bar* %tmp.445, null
	br i1 %tmp.446, label %abort, label %ok.5

ok.5:
	%tmp.447 = getelementptr %Bar, %Bar* %tmp.445, i32 0, i32 0
	%tmp.448 = load %Bar_vtable*, %Bar_vtable** %tmp.447
	%tmp.449 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.448, i32 0, i32 12
	%tmp.450 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.449
	%tmp.451 = call i32(%Bar*) %tmp.450( %Bar* %tmp.445 )
	%tmp.452 = add i32 %tmp.444, %tmp.451
	%tmp.453 = load %Bar*, %Bar** %tmp.359
	%tmp.454 = icmp eq %Bar* %tmp.453, null
	br i1 %tmp.454, label %abort, label %ok.6

ok.6:
	%tmp.455 = getelementptr %Bar, %Bar* %tmp.453, i32 0, i32 0
	%tmp.456 = load %Bar_vtable*, %Bar_vtable** %tmp.455
	%tmp.457 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.456, i32 0, i32 11
	%tmp.458 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.457
	%tmp.459 = call i32(%Bar*) %tmp.458( %Bar* %tmp.453 )
	%tmp.460 = add i32 %tmp.452, %tmp.459
	store i32 %tmp.460, i32* %tmp.425
	%tmp.461 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 6
	%tmp.462 = load %Bar*, %Bar** %tmp.359
	%vtpm.6 = icmp eq %Bar* %tmp.462, null
	br i1 %vtpm.6, label %abort, label %ok.7

ok.7:
	%tmp.463 = getelementptr %Bar, %Bar* %tmp.462, i32 0, i32 0
	%tmp.464 = load %Bar_vtable*, %Bar_vtable** %tmp.463
	%tmp.465 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.464, i32 0, i32 0
	%tmp.466 = load i32, i32* %tmp.465
	br label %case.hdr.2

case.hdr.2:
	%vtpm.7 = alloca %Bar*
	br label %case.8.2

case.8.2:
	%tmp.467 = icmp slt i32 %tmp.466, 8
	br i1 %tmp.467, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%tmp.468 = icmp sgt i32 %tmp.466, 8
	br i1 %tmp.468, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	%tmp.469 = alloca %Bar*
	store %Bar* %tmp.462, %Bar** %tmp.469
	%tmp.470 = load %Bar*, %Bar** %tmp.469
	store %Bar* %tmp.470, %Bar** %vtpm.7
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%tmp.471 = icmp slt i32 %tmp.466, 7
	br i1 %tmp.471, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%tmp.472 = icmp sgt i32 %tmp.466, 8
	br i1 %tmp.472, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	%tmp.473 = alloca %Razz*
	%tmp.474 = bitcast %Bar* %tmp.462 to %Razz*
	store %Razz* %tmp.474, %Razz** %tmp.473
	%tmp.475 = call %Bar* @Bar_new(  )
	store %Bar* %tmp.475, %Bar** %vtpm.7
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%vtpm.8 = load %Bar*, %Bar** %vtpm.7
	store %Bar* %vtpm.8, %Bar** %tmp.461
	%tmp.476 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 7
	%tmp.477 = load %Bar*, %Bar** %tmp.359
	%tmp.478 = getelementptr %Bar, %Bar* %tmp.477, i32 0, i32 4
	%tmp.479 = load %Razz*, %Razz** %tmp.478
	%tmp.480 = icmp eq %Razz* %tmp.479, null
	br i1 %tmp.480, label %abort, label %ok.8

ok.8:
	%tmp.481 = getelementptr %Bazz_vtable, %Bazz_vtable* @Bazz_vtable_prototype, i32 0, i32 12
	%tmp.482 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %tmp.481
	%tmp.483 = bitcast %Razz* %tmp.479 to %Bazz*
	%tmp.484 = call i32(%Bazz*) %tmp.482( %Bazz* %tmp.483 )
	%tmp.485 = load %Bar*, %Bar** %tmp.359
	%tmp.486 = getelementptr %Bar, %Bar* %tmp.485, i32 0, i32 2
	%tmp.487 = load %Foo*, %Foo** %tmp.486
	%tmp.488 = icmp eq %Foo* %tmp.487, null
	br i1 %tmp.488, label %abort, label %ok.9

ok.9:
	%tmp.489 = getelementptr %Foo, %Foo* %tmp.487, i32 0, i32 0
	%tmp.490 = load %Foo_vtable*, %Foo_vtable** %tmp.489
	%tmp.491 = getelementptr %Foo_vtable, %Foo_vtable* %tmp.490, i32 0, i32 12
	%tmp.492 = load i32 (%Foo*) *, i32 (%Foo*) ** %tmp.491
	%tmp.493 = call i32(%Foo*) %tmp.492( %Foo* %tmp.487 )
	%tmp.494 = add i32 %tmp.484, %tmp.493
	%tmp.495 = load %Bar*, %Bar** %tmp.359
	%tmp.496 = getelementptr %Bar, %Bar* %tmp.495, i32 0, i32 6
	%tmp.497 = load %Bar*, %Bar** %tmp.496
	%tmp.498 = icmp eq %Bar* %tmp.497, null
	br i1 %tmp.498, label %abort, label %ok.10

ok.10:
	%tmp.499 = getelementptr %Bar, %Bar* %tmp.497, i32 0, i32 0
	%tmp.500 = load %Bar_vtable*, %Bar_vtable** %tmp.499
	%tmp.501 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.500, i32 0, i32 12
	%tmp.502 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.501
	%tmp.503 = call i32(%Bar*) %tmp.502( %Bar* %tmp.497 )
	%tmp.504 = add i32 %tmp.494, %tmp.503
	%tmp.505 = load %Bar*, %Bar** %tmp.359
	%tmp.506 = icmp eq %Bar* %tmp.505, null
	br i1 %tmp.506, label %abort, label %ok.11

ok.11:
	%tmp.507 = getelementptr %Bar, %Bar* %tmp.505, i32 0, i32 0
	%tmp.508 = load %Bar_vtable*, %Bar_vtable** %tmp.507
	%tmp.509 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.508, i32 0, i32 12
	%tmp.510 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.509
	%tmp.511 = call i32(%Bar*) %tmp.510( %Bar* %tmp.505 )
	%tmp.512 = add i32 %tmp.504, %tmp.511
	%tmp.513 = load %Bar*, %Bar** %tmp.359
	%tmp.514 = icmp eq %Bar* %tmp.513, null
	br i1 %tmp.514, label %abort, label %ok.12

ok.12:
	%tmp.515 = getelementptr %Bar, %Bar* %tmp.513, i32 0, i32 0
	%tmp.516 = load %Bar_vtable*, %Bar_vtable** %tmp.515
	%tmp.517 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.516, i32 0, i32 11
	%tmp.518 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.517
	%tmp.519 = call i32(%Bar*) %tmp.518( %Bar* %tmp.513 )
	%tmp.520 = add i32 %tmp.512, %tmp.519
	store i32 %tmp.520, i32* %tmp.476
	%tmp.521 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 8
	%tmp.522 = load %Bar*, %Bar** %tmp.359
	%tmp.523 = icmp eq %Bar* %tmp.522, null
	br i1 %tmp.523, label %abort, label %ok.13

ok.13:
	%tmp.524 = getelementptr %Bar, %Bar* %tmp.522, i32 0, i32 0
	%tmp.525 = load %Bar_vtable*, %Bar_vtable** %tmp.524
	%tmp.526 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.525, i32 0, i32 12
	%tmp.527 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.526
	%tmp.528 = call i32(%Bar*) %tmp.527( %Bar* %tmp.522 )
	store i32 %tmp.528, i32* %tmp.521
	%tmp.529 = getelementptr %Bar, %Bar* %tmp.357, i32 0, i32 9
	%tmp.530 = load %Bar*, %Bar** %tmp.359
	%tmp.531 = icmp eq %Bar* %tmp.530, null
	br i1 %tmp.531, label %abort, label %ok.14

ok.14:
	%tmp.532 = getelementptr %Bar, %Bar* %tmp.530, i32 0, i32 0
	%tmp.533 = load %Bar_vtable*, %Bar_vtable** %tmp.532
	%tmp.534 = getelementptr %Bar_vtable, %Bar_vtable* %tmp.533, i32 0, i32 11
	%tmp.535 = load i32 (%Bar*) *, i32 (%Bar*) ** %tmp.534
	%tmp.536 = call i32(%Bar*) %tmp.535( %Bar* %tmp.530 )
	%tmp.537 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.537, i32 %tmp.536 )
	%tmp.538 = bitcast %Int* %tmp.537 to %Object*
	store %Object* %tmp.538, %Object** %tmp.529
	ret %Bar* %tmp.357

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_main(%Main* %self) {

entry:
	%tmp.539 = alloca %Main*
	store %Main* %self, %Main** %tmp.539
	ret %String* @String.1

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.540 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.541 = load i32, i32* %tmp.540
	%tmp.542 = call i8*(i32) @malloc( i32 %tmp.541 )
	%tmp.543 = bitcast i8* %tmp.542 to %Main*
	%tmp.544 = getelementptr %Main, %Main* %tmp.543, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.544
	%tmp.545 = alloca %Main*
	store %Main* %tmp.543, %Main** %tmp.545
	%tmp.546 = getelementptr %Main, %Main* %tmp.543, i32 0, i32 1
	%tmp.547 = call %Bazz* @Bazz_new(  )
	store %Bazz* %tmp.547, %Bazz** %tmp.546
	%tmp.548 = getelementptr %Main, %Main* %tmp.543, i32 0, i32 2
	%tmp.549 = call %Foo* @Foo_new(  )
	store %Foo* %tmp.549, %Foo** %tmp.548
	%tmp.550 = getelementptr %Main, %Main* %tmp.543, i32 0, i32 3
	%tmp.551 = call %Razz* @Razz_new(  )
	store %Razz* %tmp.551, %Razz** %tmp.550
	%tmp.552 = getelementptr %Main, %Main* %tmp.543, i32 0, i32 4
	%tmp.553 = call %Bar* @Bar_new(  )
	store %Bar* %tmp.553, %Bar** %tmp.552
	ret %Main* %tmp.543

abort:
	call void @abort(  )
	unreachable
}

