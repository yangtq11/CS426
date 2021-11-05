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

@str.VarList = internal constant [8 x i8] c"VarList\00"
%VarList = type {
	%VarList_vtable*
}

%VarList_vtable = type {
	i32,
	i32,
	i8*,
	%VarList* () *,
	%Object* (%VarList*) *,
	%String* (%VarList*) *,
	%VarList* (%VarList*) *,
	%VarList* (%VarList*,%String*) *,
	%VarList* (%VarList*,i32) *,
	%String* (%VarList*) *,
	i32 (%VarList*) *,
	i1 (%VarList*) *,
	%Variable* (%VarList*) *,
	%VarList* (%VarList*) *,
	%VarList* (%VarList*,%Variable*) *,
	%VarList* (%VarList*) *
}

@VarList_vtable_prototype = constant %VarList_vtable {
	i32 5,
	i32 ptrtoint (%VarList* getelementptr (%VarList, %VarList* null, i32 1) to i32),
	i8* getelementptr ([8 x i8], [8 x i8]* @str.VarList, i32 0, i32 0),
	%VarList* () * @VarList_new,
	%Object* (%VarList*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%VarList*) *),
	%String* (%VarList*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%VarList*) *),
	%VarList* (%VarList*) * bitcast (%Object* (%Object*) * @Object_copy to %VarList* (%VarList*) *),
	%VarList* (%VarList*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %VarList* (%VarList*,%String*) *),
	%VarList* (%VarList*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %VarList* (%VarList*,i32) *),
	%String* (%VarList*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%VarList*) *),
	i32 (%VarList*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%VarList*) *),
	i1 (%VarList*) * @VarList_isNil,
	%Variable* (%VarList*) * @VarList_head,
	%VarList* (%VarList*) * @VarList_tail,
	%VarList* (%VarList*,%Variable*) * @VarList_add,
	%VarList* (%VarList*) * @VarList_print
}

@str.VarListNE = internal constant [10 x i8] c"VarListNE\00"
%VarListNE = type {
	%VarListNE_vtable*,
	%Variable*,
	%VarList*
}

%VarListNE_vtable = type {
	i32,
	i32,
	i8*,
	%VarListNE* () *,
	%Object* (%VarListNE*) *,
	%String* (%VarListNE*) *,
	%VarListNE* (%VarListNE*) *,
	%VarListNE* (%VarListNE*,%String*) *,
	%VarListNE* (%VarListNE*,i32) *,
	%String* (%VarListNE*) *,
	i32 (%VarListNE*) *,
	i1 (%VarListNE*) *,
	%Variable* (%VarListNE*) *,
	%VarList* (%VarListNE*) *,
	%VarList* (%VarListNE*,%Variable*) *,
	%VarListNE* (%VarListNE*) *,
	%VarListNE* (%VarListNE*,%Variable*,%VarList*) *
}

@VarListNE_vtable_prototype = constant %VarListNE_vtable {
	i32 6,
	i32 ptrtoint (%VarListNE* getelementptr (%VarListNE, %VarListNE* null, i32 1) to i32),
	i8* getelementptr ([10 x i8], [10 x i8]* @str.VarListNE, i32 0, i32 0),
	%VarListNE* () * @VarListNE_new,
	%Object* (%VarListNE*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%VarListNE*) *),
	%String* (%VarListNE*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%VarListNE*) *),
	%VarListNE* (%VarListNE*) * bitcast (%Object* (%Object*) * @Object_copy to %VarListNE* (%VarListNE*) *),
	%VarListNE* (%VarListNE*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %VarListNE* (%VarListNE*,%String*) *),
	%VarListNE* (%VarListNE*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %VarListNE* (%VarListNE*,i32) *),
	%String* (%VarListNE*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%VarListNE*) *),
	i32 (%VarListNE*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%VarListNE*) *),
	i1 (%VarListNE*) * @VarListNE_isNil,
	%Variable* (%VarListNE*) * @VarListNE_head,
	%VarList* (%VarListNE*) * @VarListNE_tail,
	%VarList* (%VarListNE*,%Variable*) * bitcast (%VarList* (%VarList*,%Variable*) * @VarList_add to %VarList* (%VarListNE*,%Variable*) *),
	%VarListNE* (%VarListNE*) * @VarListNE_print,
	%VarListNE* (%VarListNE*,%Variable*,%VarList*) * @VarListNE_init
}

@str.Expr = internal constant [5 x i8] c"Expr\00"
%Expr = type {
	%Expr_vtable*
}

%Expr_vtable = type {
	i32,
	i32,
	i8*,
	%Expr* () *,
	%Object* (%Expr*) *,
	%String* (%Expr*) *,
	%Expr* (%Expr*) *,
	%Expr* (%Expr*,%String*) *,
	%Expr* (%Expr*,i32) *,
	%String* (%Expr*) *,
	i32 (%Expr*) *,
	%Expr* (%Expr*) *,
	%Expr* (%Expr*) *,
	%Expr* (%Expr*,%Variable*,%Expr*) *,
	%Expr* (%Expr*,%VarList*,%LambdaListRef*) *
}

@Expr_vtable_prototype = constant %Expr_vtable {
	i32 7,
	i32 ptrtoint (%Expr* getelementptr (%Expr, %Expr* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Expr, i32 0, i32 0),
	%Expr* () * @Expr_new,
	%Object* (%Expr*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Expr*) *),
	%String* (%Expr*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Expr*) *),
	%Expr* (%Expr*) * bitcast (%Object* (%Object*) * @Object_copy to %Expr* (%Expr*) *),
	%Expr* (%Expr*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Expr* (%Expr*,%String*) *),
	%Expr* (%Expr*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Expr* (%Expr*,i32) *),
	%String* (%Expr*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Expr*) *),
	i32 (%Expr*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Expr*) *),
	%Expr* (%Expr*) * @Expr_print_self,
	%Expr* (%Expr*) * @Expr_beta,
	%Expr* (%Expr*,%Variable*,%Expr*) * @Expr_substitute,
	%Expr* (%Expr*,%VarList*,%LambdaListRef*) * @Expr_gen_code
}

@str.Variable = internal constant [9 x i8] c"Variable\00"
%Variable = type {
	%Variable_vtable*,
	%String*
}

%Variable_vtable = type {
	i32,
	i32,
	i8*,
	%Variable* () *,
	%Object* (%Variable*) *,
	%String* (%Variable*) *,
	%Variable* (%Variable*) *,
	%Variable* (%Variable*,%String*) *,
	%Variable* (%Variable*,i32) *,
	%String* (%Variable*) *,
	i32 (%Variable*) *,
	%Variable* (%Variable*) *,
	%Expr* (%Variable*) *,
	%Expr* (%Variable*,%Variable*,%Expr*) *,
	%Variable* (%Variable*,%VarList*,%LambdaListRef*) *,
	%Variable* (%Variable*,%String*) *
}

@Variable_vtable_prototype = constant %Variable_vtable {
	i32 8,
	i32 ptrtoint (%Variable* getelementptr (%Variable, %Variable* null, i32 1) to i32),
	i8* getelementptr ([9 x i8], [9 x i8]* @str.Variable, i32 0, i32 0),
	%Variable* () * @Variable_new,
	%Object* (%Variable*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Variable*) *),
	%String* (%Variable*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Variable*) *),
	%Variable* (%Variable*) * bitcast (%Object* (%Object*) * @Object_copy to %Variable* (%Variable*) *),
	%Variable* (%Variable*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Variable* (%Variable*,%String*) *),
	%Variable* (%Variable*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Variable* (%Variable*,i32) *),
	%String* (%Variable*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Variable*) *),
	i32 (%Variable*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Variable*) *),
	%Variable* (%Variable*) * @Variable_print_self,
	%Expr* (%Variable*) * @Variable_beta,
	%Expr* (%Variable*,%Variable*,%Expr*) * @Variable_substitute,
	%Variable* (%Variable*,%VarList*,%LambdaListRef*) * @Variable_gen_code,
	%Variable* (%Variable*,%String*) * @Variable_init
}

@str.Lambda = internal constant [7 x i8] c"Lambda\00"
%Lambda = type {
	%Lambda_vtable*,
	%Variable*,
	%Expr*
}

%Lambda_vtable = type {
	i32,
	i32,
	i8*,
	%Lambda* () *,
	%Object* (%Lambda*) *,
	%String* (%Lambda*) *,
	%Lambda* (%Lambda*) *,
	%Lambda* (%Lambda*,%String*) *,
	%Lambda* (%Lambda*,i32) *,
	%String* (%Lambda*) *,
	i32 (%Lambda*) *,
	%Lambda* (%Lambda*) *,
	%Expr* (%Lambda*) *,
	%Expr* (%Lambda*,%Variable*,%Expr*) *,
	%Lambda* (%Lambda*,%VarList*,%LambdaListRef*) *,
	%Lambda* (%Lambda*,%Variable*,%Expr*) *,
	%Expr* (%Lambda*,%Expr*) *,
	%Lambda* (%Lambda*,i32,%VarList*,%LambdaListRef*) *
}

@Lambda_vtable_prototype = constant %Lambda_vtable {
	i32 9,
	i32 ptrtoint (%Lambda* getelementptr (%Lambda, %Lambda* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Lambda, i32 0, i32 0),
	%Lambda* () * @Lambda_new,
	%Object* (%Lambda*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Lambda*) *),
	%String* (%Lambda*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Lambda*) *),
	%Lambda* (%Lambda*) * bitcast (%Object* (%Object*) * @Object_copy to %Lambda* (%Lambda*) *),
	%Lambda* (%Lambda*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Lambda* (%Lambda*,%String*) *),
	%Lambda* (%Lambda*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Lambda* (%Lambda*,i32) *),
	%String* (%Lambda*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Lambda*) *),
	i32 (%Lambda*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Lambda*) *),
	%Lambda* (%Lambda*) * @Lambda_print_self,
	%Expr* (%Lambda*) * @Lambda_beta,
	%Expr* (%Lambda*,%Variable*,%Expr*) * @Lambda_substitute,
	%Lambda* (%Lambda*,%VarList*,%LambdaListRef*) * @Lambda_gen_code,
	%Lambda* (%Lambda*,%Variable*,%Expr*) * @Lambda_init,
	%Expr* (%Lambda*,%Expr*) * @Lambda_apply,
	%Lambda* (%Lambda*,i32,%VarList*,%LambdaListRef*) * @Lambda_gen_closure_code
}

@str.App = internal constant [4 x i8] c"App\00"
%App = type {
	%App_vtable*,
	%Expr*,
	%Expr*
}

%App_vtable = type {
	i32,
	i32,
	i8*,
	%App* () *,
	%Object* (%App*) *,
	%String* (%App*) *,
	%App* (%App*) *,
	%App* (%App*,%String*) *,
	%App* (%App*,i32) *,
	%String* (%App*) *,
	i32 (%App*) *,
	%App* (%App*) *,
	%Expr* (%App*) *,
	%Expr* (%App*,%Variable*,%Expr*) *,
	%App* (%App*,%VarList*,%LambdaListRef*) *,
	%App* (%App*,%Expr*,%Expr*) *
}

@App_vtable_prototype = constant %App_vtable {
	i32 10,
	i32 ptrtoint (%App* getelementptr (%App, %App* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.App, i32 0, i32 0),
	%App* () * @App_new,
	%Object* (%App*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%App*) *),
	%String* (%App*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%App*) *),
	%App* (%App*) * bitcast (%Object* (%Object*) * @Object_copy to %App* (%App*) *),
	%App* (%App*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %App* (%App*,%String*) *),
	%App* (%App*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %App* (%App*,i32) *),
	%String* (%App*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%App*) *),
	i32 (%App*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%App*) *),
	%App* (%App*) * @App_print_self,
	%Expr* (%App*) * @App_beta,
	%Expr* (%App*,%Variable*,%Expr*) * @App_substitute,
	%App* (%App*,%VarList*,%LambdaListRef*) * @App_gen_code,
	%App* (%App*,%Expr*,%Expr*) * @App_init
}

@str.Term = internal constant [5 x i8] c"Term\00"
%Term = type {
	%Term_vtable*
}

%Term_vtable = type {
	i32,
	i32,
	i8*,
	%Term* () *,
	%Object* (%Term*) *,
	%String* (%Term*) *,
	%Term* (%Term*) *,
	%Term* (%Term*,%String*) *,
	%Term* (%Term*,i32) *,
	%String* (%Term*) *,
	i32 (%Term*) *,
	%Variable* (%Term*,%String*) *,
	%Lambda* (%Term*,%Variable*,%Expr*) *,
	%App* (%Term*,%Expr*,%Expr*) *,
	%Expr* (%Term*) *,
	%Expr* (%Term*) *,
	%Expr* (%Term*) *
}

@Term_vtable_prototype = constant %Term_vtable {
	i32 11,
	i32 ptrtoint (%Term* getelementptr (%Term, %Term* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Term, i32 0, i32 0),
	%Term* () * @Term_new,
	%Object* (%Term*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Term*) *),
	%String* (%Term*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Term*) *),
	%Term* (%Term*) * bitcast (%Object* (%Object*) * @Object_copy to %Term* (%Term*) *),
	%Term* (%Term*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Term* (%Term*,%String*) *),
	%Term* (%Term*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Term* (%Term*,i32) *),
	%String* (%Term*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Term*) *),
	i32 (%Term*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Term*) *),
	%Variable* (%Term*,%String*) * @Term_var,
	%Lambda* (%Term*,%Variable*,%Expr*) * @Term_lam,
	%App* (%Term*,%Expr*,%Expr*) * @Term_app,
	%Expr* (%Term*) * @Term_i,
	%Expr* (%Term*) * @Term_k,
	%Expr* (%Term*) * @Term_s
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
	%Variable* (%Main*,%String*) *,
	%Lambda* (%Main*,%Variable*,%Expr*) *,
	%App* (%Main*,%Expr*,%Expr*) *,
	%Expr* (%Main*) *,
	%Expr* (%Main*) *,
	%Expr* (%Main*) *,
	%Expr* (%Main*,%Expr*) *,
	%Main* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%Expr*) *,
	i32 (%Main*) *
}

@Main_vtable_prototype = constant %Main_vtable {
	i32 12,
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
	%Variable* (%Main*,%String*) * bitcast (%Variable* (%Term*,%String*) * @Term_var to %Variable* (%Main*,%String*) *),
	%Lambda* (%Main*,%Variable*,%Expr*) * bitcast (%Lambda* (%Term*,%Variable*,%Expr*) * @Term_lam to %Lambda* (%Main*,%Variable*,%Expr*) *),
	%App* (%Main*,%Expr*,%Expr*) * bitcast (%App* (%Term*,%Expr*,%Expr*) * @Term_app to %App* (%Main*,%Expr*,%Expr*) *),
	%Expr* (%Main*) * bitcast (%Expr* (%Term*) * @Term_i to %Expr* (%Main*) *),
	%Expr* (%Main*) * bitcast (%Expr* (%Term*) * @Term_k to %Expr* (%Main*) *),
	%Expr* (%Main*) * bitcast (%Expr* (%Term*) * @Term_s to %Expr* (%Main*) *),
	%Expr* (%Main*,%Expr*) * @Main_beta_reduce,
	%Main* (%Main*) * @Main_eval_class,
	%Main* (%Main*) * @Main_closure_class,
	%Main* (%Main*,%Expr*) * @Main_gen_code,
	i32 (%Main*) * @Main_main
}

@str.LambdaList = internal constant [11 x i8] c"LambdaList\00"
%LambdaList = type {
	%LambdaList_vtable*
}

%LambdaList_vtable = type {
	i32,
	i32,
	i8*,
	%LambdaList* () *,
	%Object* (%LambdaList*) *,
	%String* (%LambdaList*) *,
	%LambdaList* (%LambdaList*) *,
	i1 (%LambdaList*) *,
	%VarList* (%LambdaList*) *,
	%Lambda* (%LambdaList*) *,
	i32 (%LambdaList*) *,
	%LambdaList* (%LambdaList*) *,
	%LambdaList* (%LambdaList*,%VarList*,%Lambda*,i32) *
}

@LambdaList_vtable_prototype = constant %LambdaList_vtable {
	i32 13,
	i32 ptrtoint (%LambdaList* getelementptr (%LambdaList, %LambdaList* null, i32 1) to i32),
	i8* getelementptr ([11 x i8], [11 x i8]* @str.LambdaList, i32 0, i32 0),
	%LambdaList* () * @LambdaList_new,
	%Object* (%LambdaList*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%LambdaList*) *),
	%String* (%LambdaList*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%LambdaList*) *),
	%LambdaList* (%LambdaList*) * bitcast (%Object* (%Object*) * @Object_copy to %LambdaList* (%LambdaList*) *),
	i1 (%LambdaList*) * @LambdaList_isNil,
	%VarList* (%LambdaList*) * @LambdaList_headE,
	%Lambda* (%LambdaList*) * @LambdaList_headC,
	i32 (%LambdaList*) * @LambdaList_headN,
	%LambdaList* (%LambdaList*) * @LambdaList_tail,
	%LambdaList* (%LambdaList*,%VarList*,%Lambda*,i32) * @LambdaList_add
}

@str.LambdaListNE = internal constant [13 x i8] c"LambdaListNE\00"
%LambdaListNE = type {
	%LambdaListNE_vtable*,
	%Lambda*,
	i32,
	%VarList*,
	%LambdaList*
}

%LambdaListNE_vtable = type {
	i32,
	i32,
	i8*,
	%LambdaListNE* () *,
	%Object* (%LambdaListNE*) *,
	%String* (%LambdaListNE*) *,
	%LambdaListNE* (%LambdaListNE*) *,
	i1 (%LambdaListNE*) *,
	%VarList* (%LambdaListNE*) *,
	%Lambda* (%LambdaListNE*) *,
	i32 (%LambdaListNE*) *,
	%LambdaList* (%LambdaListNE*) *,
	%LambdaList* (%LambdaListNE*,%VarList*,%Lambda*,i32) *,
	%LambdaListNE* (%LambdaListNE*,%VarList*,%Lambda*,i32,%LambdaList*) *
}

@LambdaListNE_vtable_prototype = constant %LambdaListNE_vtable {
	i32 14,
	i32 ptrtoint (%LambdaListNE* getelementptr (%LambdaListNE, %LambdaListNE* null, i32 1) to i32),
	i8* getelementptr ([13 x i8], [13 x i8]* @str.LambdaListNE, i32 0, i32 0),
	%LambdaListNE* () * @LambdaListNE_new,
	%Object* (%LambdaListNE*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%LambdaListNE*) *),
	%String* (%LambdaListNE*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%LambdaListNE*) *),
	%LambdaListNE* (%LambdaListNE*) * bitcast (%Object* (%Object*) * @Object_copy to %LambdaListNE* (%LambdaListNE*) *),
	i1 (%LambdaListNE*) * @LambdaListNE_isNil,
	%VarList* (%LambdaListNE*) * @LambdaListNE_headE,
	%Lambda* (%LambdaListNE*) * @LambdaListNE_headC,
	i32 (%LambdaListNE*) * @LambdaListNE_headN,
	%LambdaList* (%LambdaListNE*) * @LambdaListNE_tail,
	%LambdaList* (%LambdaListNE*,%VarList*,%Lambda*,i32) * bitcast (%LambdaList* (%LambdaList*,%VarList*,%Lambda*,i32) * @LambdaList_add to %LambdaList* (%LambdaListNE*,%VarList*,%Lambda*,i32) *),
	%LambdaListNE* (%LambdaListNE*,%VarList*,%Lambda*,i32,%LambdaList*) * @LambdaListNE_init
}

@str.LambdaListRef = internal constant [14 x i8] c"LambdaListRef\00"
%LambdaListRef = type {
	%LambdaListRef_vtable*,
	i32,
	%LambdaList*
}

%LambdaListRef_vtable = type {
	i32,
	i32,
	i8*,
	%LambdaListRef* () *,
	%Object* (%LambdaListRef*) *,
	%String* (%LambdaListRef*) *,
	%LambdaListRef* (%LambdaListRef*) *,
	i1 (%LambdaListRef*) *,
	%VarList* (%LambdaListRef*) *,
	%Lambda* (%LambdaListRef*) *,
	i32 (%LambdaListRef*) *,
	%LambdaListRef* (%LambdaListRef*) *,
	i32 (%LambdaListRef*,%VarList*,%Lambda*) *,
	%LambdaListRef* (%LambdaListRef*) *
}

@LambdaListRef_vtable_prototype = constant %LambdaListRef_vtable {
	i32 15,
	i32 ptrtoint (%LambdaListRef* getelementptr (%LambdaListRef, %LambdaListRef* null, i32 1) to i32),
	i8* getelementptr ([14 x i8], [14 x i8]* @str.LambdaListRef, i32 0, i32 0),
	%LambdaListRef* () * @LambdaListRef_new,
	%Object* (%LambdaListRef*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%LambdaListRef*) *),
	%String* (%LambdaListRef*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%LambdaListRef*) *),
	%LambdaListRef* (%LambdaListRef*) * bitcast (%Object* (%Object*) * @Object_copy to %LambdaListRef* (%LambdaListRef*) *),
	i1 (%LambdaListRef*) * @LambdaListRef_isNil,
	%VarList* (%LambdaListRef*) * @LambdaListRef_headE,
	%Lambda* (%LambdaListRef*) * @LambdaListRef_headC,
	i32 (%LambdaListRef*) * @LambdaListRef_headN,
	%LambdaListRef* (%LambdaListRef*) * @LambdaListRef_reset,
	i32 (%LambdaListRef*,%VarList*,%Lambda*) * @LambdaListRef_add,
	%LambdaListRef* (%LambdaListRef*) * @LambdaListRef_removeHead
}

@str.55 = internal constant [14 x i8] c"<basic class>\00"
@String.55 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.55, i32 0, i32 0)
}

@str.54 = internal constant [8 x i8] c"\0A};\0A};\0A\00"
@String.54 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.54, i32 0, i32 0)
}

@str.53 = internal constant [25 x i8] c"  main() : EvalObject {\0A\00"
@String.53 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([25 x i8], [25 x i8]* @str.53, i32 0, i32 0)
}

@str.52 = internal constant [14 x i8] c"class Main {\0A\00"
@String.52 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.52, i32 0, i32 0)
}

@str.51 = internal constant [51 x i8] c"(*Generated by lam.cl (Jeff Foster, March 2000)*)\0A\00"
@String.51 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([51 x i8], [51 x i8]* @str.51, i32 0, i32 0)
}

@str.50 = internal constant [47 x i8] c"\0A------------------cut here------------------\0A\00"
@String.50 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([47 x i8], [47 x i8]* @str.50, i32 0, i32 0)
}

@str.49 = internal constant [21 x i8] c"Generating code for \00"
@String.49 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.49, i32 0, i32 0)
}

@str.48 = internal constant [62 x i8] c"  apply(y : EvalObject) : EvalObject { { abort(); self; } };\0A\00"
@String.48 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([62 x i8], [62 x i8]* @str.48, i32 0, i32 0)
}

@str.47 = internal constant [57 x i8] c"  init(p : Closure) : Closure {{ parent <- p; self; }};\0A\00"
@String.47 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([57 x i8], [57 x i8]* @str.47, i32 0, i32 0)
}

@str.46 = internal constant [31 x i8] c"  get_x() : EvalObject { x };\0A\00"
@String.46 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([31 x i8], [31 x i8]* @str.46, i32 0, i32 0)
}

@str.45 = internal constant [38 x i8] c"  get_parent() : Closure { parent };\0A\00"
@String.45 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([38 x i8], [38 x i8]* @str.45, i32 0, i32 0)
}

@str.44 = internal constant [19 x i8] c"  x : EvalObject;\0A\00"
@String.44 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([19 x i8], [19 x i8]* @str.44, i32 0, i32 0)
}

@str.43 = internal constant [21 x i8] c"  parent : Closure;\0A\00"
@String.43 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.43, i32 0, i32 0)
}

@str.42 = internal constant [37 x i8] c"class Closure inherits EvalObject {\0A\00"
@String.42 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([37 x i8], [37 x i8]* @str.42, i32 0, i32 0)
}

@str.41 = internal constant [47 x i8] c"  eval() : EvalObject { { abort(); self; } };\0A\00"
@String.41 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([47 x i8], [47 x i8]* @str.41, i32 0, i32 0)
}

@str.40 = internal constant [32 x i8] c"class EvalObject inherits IO {\0A\00"
@String.40 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([32 x i8], [32 x i8]* @str.40, i32 0, i32 0)
}

@str.39 = internal constant [5 x i8] c" =>\0A\00"
@String.39 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @str.39, i32 0, i32 0)
}

@str.38 = internal constant [14 x i8] c"beta-reduce: \00"
@String.38 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.38, i32 0, i32 0)
}

@str.37 = internal constant [2 x i8] c"z\00"
@String.37 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.37, i32 0, i32 0)
}

@str.36 = internal constant [2 x i8] c"y\00"
@String.36 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.36, i32 0, i32 0)
}

@str.35 = internal constant [2 x i8] c"x\00"
@String.35 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.35, i32 0, i32 0)
}

@str.34 = internal constant [8 x i8] c"  esac)\00"
@String.34 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.34, i32 0, i32 0)
}

@str.33 = internal constant [49 x i8] c"    o : Object => { abort(); new EvalObject; };\0A\00"
@String.33 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([49 x i8], [49 x i8]* @str.33, i32 0, i32 0)
}

@str.32 = internal constant [32 x i8] c"    c : Closure => c.apply(y);\0A\00"
@String.32 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([32 x i8], [32 x i8]* @str.32, i32 0, i32 0)
}

@str.31 = internal constant [13 x i8] c"  case x of\0A\00"
@String.31 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.31, i32 0, i32 0)
}

@str.30 = internal constant [5 x i8] c" in\0A\00"
@String.30 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @str.30, i32 0, i32 0)
}

@str.29 = internal constant [24 x i8] c"     y : EvalObject <- \00"
@String.29 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([24 x i8], [24 x i8]* @str.29, i32 0, i32 0)
}

@str.28 = internal constant [3 x i8] c",\0A\00"
@String.28 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([3 x i8], [3 x i8]* @str.28, i32 0, i32 0)
}

@str.27 = internal constant [24 x i8] c"(let x : EvalObject <- \00"
@String.27 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([24 x i8], [24 x i8]* @str.27, i32 0, i32 0)
}

@str.26 = internal constant [3 x i8] c"))\00"
@String.26 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([3 x i8], [3 x i8]* @str.26, i32 0, i32 0)
}

@str.25 = internal constant [4 x i8] c")@(\00"
@String.25 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @str.25, i32 0, i32 0)
}

@str.24 = internal constant [3 x i8] c"((\00"
@String.24 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([3 x i8], [3 x i8]* @str.24, i32 0, i32 0)
}

@str.23 = internal constant [4 x i8] c"};\0A\00"
@String.23 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @str.23, i32 0, i32 0)
}

@str.22 = internal constant [6 x i8] c";}};\0A\00"
@String.22 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([6 x i8], [6 x i8]* @str.22, i32 0, i32 0)
}

@str.21 = internal constant [15 x i8] c"      x <- y;\0A\00"
@String.21 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.21, i32 0, i32 0)
}

@str.20 = internal constant [7 x i8] c"\5Cn\22);\0A\00"
@String.20 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.20, i32 0, i32 0)
}

@str.19 = internal constant [36 x i8] c"    { out_string(\22Applying closure \00"
@String.19 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([36 x i8], [36 x i8]* @str.19, i32 0, i32 0)
}

@str.18 = internal constant [40 x i8] c"  apply(y : EvalObject) : EvalObject {\0A\00"
@String.18 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([40 x i8], [40 x i8]* @str.18, i32 0, i32 0)
}

@str.17 = internal constant [21 x i8] c" inherits Closure {\0A\00"
@String.17 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([21 x i8], [21 x i8]* @str.17, i32 0, i32 0)
}

@str.16 = internal constant [14 x i8] c"class Closure\00"
@String.16 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.16, i32 0, i32 0)
}

@str.15 = internal constant [7 x i8] c"self))\00"
@String.15 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.15, i32 0, i32 0)
}

@str.14 = internal constant [14 x i8] c"new Closure))\00"
@String.14 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.14, i32 0, i32 0)
}

@str.13 = internal constant [8 x i8] c").init(\00"
@String.13 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.13, i32 0, i32 0)
}

@str.12 = internal constant [14 x i8] c"((new Closure\00"
@String.12 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.12, i32 0, i32 0)
}

@str.11 = internal constant [2 x i8] c".\00"
@String.11 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.11, i32 0, i32 0)
}

@str.10 = internal constant [2 x i8] c"\5C\00"
@String.10 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.10, i32 0, i32 0)
}

@str.9 = internal constant [8 x i8] c"get_x()\00"
@String.9 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.9, i32 0, i32 0)
}

@str.8 = internal constant [28 x i8] c"Error:  free occurrence of \00"
@String.8 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([28 x i8], [28 x i8]* @str.8, i32 0, i32 0)
}

@str.7 = internal constant [14 x i8] c"get_parent().\00"
@String.7 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.7, i32 0, i32 0)
}

@str.6 = internal constant [46 x i8] c"\0AError: Expr is pure virtual; can't gen_code\0A\00"
@String.6 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([46 x i8], [46 x i8]* @str.6, i32 0, i32 0)
}

@str.5 = internal constant [48 x i8] c"\0AError: Expr is pure virtual; can't substitute\0A\00"
@String.5 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([48 x i8], [48 x i8]* @str.5, i32 0, i32 0)
}

@str.4 = internal constant [49 x i8] c"\0AError: Expr is pure virtual; can't beta-reduce\0A\00"
@String.4 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([49 x i8], [49 x i8]* @str.4, i32 0, i32 0)
}

@str.3 = internal constant [48 x i8] c"\0AError: Expr is pure virtual; can't print self\0A\00"
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([48 x i8], [48 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [2 x i8] c" \00"
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [2 x i8] c"\0A\00"
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [7 x i8] c"lam.cl\00"
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main*() @Main_new(  )
	%main.retval = call i32(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define i1 @VarList_isNil(%VarList* %self) {

entry:
	%tmp.0 = alloca %VarList*
	store %VarList* %self, %VarList** %tmp.0
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @VarList_head(%VarList* %self) {

entry:
	%tmp.1 = alloca %VarList*
	store %VarList* %self, %VarList** %tmp.1
	%tmp.2 = load %VarList*, %VarList** %tmp.1
	%tmp.3 = icmp eq %VarList* %tmp.2, null
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%tmp.4 = getelementptr %VarList, %VarList* %tmp.2, i32 0, i32 0
	%tmp.5 = load %VarList_vtable*, %VarList_vtable** %tmp.4
	%tmp.6 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.5, i32 0, i32 4
	%tmp.7 = load %Object* (%VarList*) *, %Object* (%VarList*) ** %tmp.6
	%tmp.8 = call %Object*(%VarList*) %tmp.7( %VarList* %tmp.2 )
	%tmp.9 = call %Variable* @Variable_new(  )
	ret %Variable* %tmp.9

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @VarList_tail(%VarList* %self) {

entry:
	%tmp.10 = alloca %VarList*
	store %VarList* %self, %VarList** %tmp.10
	%tmp.11 = load %VarList*, %VarList** %tmp.10
	%tmp.12 = icmp eq %VarList* %tmp.11, null
	br i1 %tmp.12, label %abort, label %ok.1

ok.1:
	%tmp.13 = getelementptr %VarList, %VarList* %tmp.11, i32 0, i32 0
	%tmp.14 = load %VarList_vtable*, %VarList_vtable** %tmp.13
	%tmp.15 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.14, i32 0, i32 4
	%tmp.16 = load %Object* (%VarList*) *, %Object* (%VarList*) ** %tmp.15
	%tmp.17 = call %Object*(%VarList*) %tmp.16( %VarList* %tmp.11 )
	%tmp.18 = call %VarList* @VarList_new(  )
	ret %VarList* %tmp.18

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @VarList_add(%VarList* %self, %Variable* %x) {

entry:
	%tmp.19 = alloca %VarList*
	store %VarList* %self, %VarList** %tmp.19
	%tmp.20 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.20
	%tmp.21 = load %Variable*, %Variable** %tmp.20
	%tmp.22 = load %VarList*, %VarList** %tmp.19
	%tmp.23 = call %VarListNE* @VarListNE_new(  )
	%tmp.24 = icmp eq %VarListNE* %tmp.23, null
	br i1 %tmp.24, label %abort, label %ok.2

ok.2:
	%tmp.25 = getelementptr %VarListNE, %VarListNE* %tmp.23, i32 0, i32 0
	%tmp.26 = load %VarListNE_vtable*, %VarListNE_vtable** %tmp.25
	%tmp.27 = getelementptr %VarListNE_vtable, %VarListNE_vtable* %tmp.26, i32 0, i32 16
	%tmp.28 = load %VarListNE* (%VarListNE*,%Variable*,%VarList*) *, %VarListNE* (%VarListNE*,%Variable*,%VarList*) ** %tmp.27
	%tmp.29 = call %VarListNE*(%VarListNE*, %Variable*, %VarList*) %tmp.28( %VarListNE* %tmp.23, %Variable* %tmp.21, %VarList* %tmp.22 )
	%tmp.30 = bitcast %VarListNE* %tmp.29 to %VarList*
	ret %VarList* %tmp.30

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @VarList_print(%VarList* %self) {

entry:
	%tmp.31 = alloca %VarList*
	store %VarList* %self, %VarList** %tmp.31
	%tmp.32 = load %VarList*, %VarList** %tmp.31
	%tmp.33 = icmp eq %VarList* %tmp.32, null
	br i1 %tmp.33, label %abort, label %ok.3

ok.3:
	%tmp.34 = getelementptr %VarList, %VarList* %tmp.32, i32 0, i32 0
	%tmp.35 = load %VarList_vtable*, %VarList_vtable** %tmp.34
	%tmp.36 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.35, i32 0, i32 7
	%tmp.37 = load %VarList* (%VarList*,%String*) *, %VarList* (%VarList*,%String*) ** %tmp.36
	%tmp.38 = call %VarList*(%VarList*, %String*) %tmp.37( %VarList* %tmp.32, %String* @String.1 )
	ret %VarList* %tmp.38

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @VarList_new() {

entry:
	%tmp.39 = getelementptr %VarList_vtable, %VarList_vtable* @VarList_vtable_prototype, i32 0, i32 1
	%tmp.40 = load i32, i32* %tmp.39
	%tmp.41 = call i8*(i32) @malloc( i32 %tmp.40 )
	%tmp.42 = bitcast i8* %tmp.41 to %VarList*
	%tmp.43 = getelementptr %VarList, %VarList* %tmp.42, i32 0, i32 0
	store %VarList_vtable* @VarList_vtable_prototype, %VarList_vtable** %tmp.43
	%tmp.44 = alloca %VarList*
	store %VarList* %tmp.42, %VarList** %tmp.44
	ret %VarList* %tmp.42

abort:
	call void @abort(  )
	unreachable
}

define i1 @VarListNE_isNil(%VarListNE* %self) {

entry:
	%tmp.45 = alloca %VarListNE*
	store %VarListNE* %self, %VarListNE** %tmp.45
	ret i1 false

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @VarListNE_head(%VarListNE* %self) {

entry:
	%tmp.46 = alloca %VarListNE*
	store %VarListNE* %self, %VarListNE** %tmp.46
	%tmp.47 = load %VarListNE*, %VarListNE** %tmp.46
	%tmp.48 = getelementptr %VarListNE, %VarListNE* %tmp.47, i32 0, i32 1
	%tmp.49 = load %Variable*, %Variable** %tmp.48
	ret %Variable* %tmp.49

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @VarListNE_tail(%VarListNE* %self) {

entry:
	%tmp.50 = alloca %VarListNE*
	store %VarListNE* %self, %VarListNE** %tmp.50
	%tmp.51 = load %VarListNE*, %VarListNE** %tmp.50
	%tmp.52 = getelementptr %VarListNE, %VarListNE* %tmp.51, i32 0, i32 2
	%tmp.53 = load %VarList*, %VarList** %tmp.52
	ret %VarList* %tmp.53

abort:
	call void @abort(  )
	unreachable
}

define %VarListNE* @VarListNE_init(%VarListNE* %self, %Variable* %y, %VarList* %r) {

entry:
	%tmp.54 = alloca %VarListNE*
	store %VarListNE* %self, %VarListNE** %tmp.54
	%tmp.55 = alloca %Variable*
	store %Variable* %y, %Variable** %tmp.55
	%tmp.56 = alloca %VarList*
	store %VarList* %r, %VarList** %tmp.56
	%tmp.57 = load %Variable*, %Variable** %tmp.55
	%tmp.58 = load %VarListNE*, %VarListNE** %tmp.54
	%tmp.59 = getelementptr %VarListNE, %VarListNE* %tmp.58, i32 0, i32 1
	store %Variable* %tmp.57, %Variable** %tmp.59
	%tmp.60 = load %VarList*, %VarList** %tmp.56
	%tmp.61 = load %VarListNE*, %VarListNE** %tmp.54
	%tmp.62 = getelementptr %VarListNE, %VarListNE* %tmp.61, i32 0, i32 2
	store %VarList* %tmp.60, %VarList** %tmp.62
	%tmp.63 = load %VarListNE*, %VarListNE** %tmp.54
	ret %VarListNE* %tmp.63

abort:
	call void @abort(  )
	unreachable
}

define %VarListNE* @VarListNE_print(%VarListNE* %self) {

entry:
	%tmp.64 = alloca %VarListNE*
	store %VarListNE* %self, %VarListNE** %tmp.64
	%tmp.65 = load %VarListNE*, %VarListNE** %tmp.64
	%tmp.66 = getelementptr %VarListNE, %VarListNE* %tmp.65, i32 0, i32 1
	%tmp.67 = load %Variable*, %Variable** %tmp.66
	%tmp.68 = icmp eq %Variable* %tmp.67, null
	br i1 %tmp.68, label %abort, label %ok.0

ok.0:
	%tmp.69 = getelementptr %Variable, %Variable* %tmp.67, i32 0, i32 0
	%tmp.70 = load %Variable_vtable*, %Variable_vtable** %tmp.69
	%tmp.71 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.70, i32 0, i32 11
	%tmp.72 = load %Variable* (%Variable*) *, %Variable* (%Variable*) ** %tmp.71
	%tmp.73 = call %Variable*(%Variable*) %tmp.72( %Variable* %tmp.67 )
	%tmp.74 = load %VarListNE*, %VarListNE** %tmp.64
	%tmp.75 = icmp eq %VarListNE* %tmp.74, null
	br i1 %tmp.75, label %abort, label %ok.1

ok.1:
	%tmp.76 = getelementptr %VarListNE, %VarListNE* %tmp.74, i32 0, i32 0
	%tmp.77 = load %VarListNE_vtable*, %VarListNE_vtable** %tmp.76
	%tmp.78 = getelementptr %VarListNE_vtable, %VarListNE_vtable* %tmp.77, i32 0, i32 7
	%tmp.79 = load %VarListNE* (%VarListNE*,%String*) *, %VarListNE* (%VarListNE*,%String*) ** %tmp.78
	%tmp.80 = call %VarListNE*(%VarListNE*, %String*) %tmp.79( %VarListNE* %tmp.74, %String* @String.2 )
	%tmp.81 = load %VarListNE*, %VarListNE** %tmp.64
	%tmp.82 = getelementptr %VarListNE, %VarListNE* %tmp.81, i32 0, i32 2
	%tmp.83 = load %VarList*, %VarList** %tmp.82
	%tmp.84 = icmp eq %VarList* %tmp.83, null
	br i1 %tmp.84, label %abort, label %ok.2

ok.2:
	%tmp.85 = getelementptr %VarList, %VarList* %tmp.83, i32 0, i32 0
	%tmp.86 = load %VarList_vtable*, %VarList_vtable** %tmp.85
	%tmp.87 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.86, i32 0, i32 15
	%tmp.88 = load %VarList* (%VarList*) *, %VarList* (%VarList*) ** %tmp.87
	%tmp.89 = call %VarList*(%VarList*) %tmp.88( %VarList* %tmp.83 )
	%tmp.90 = load %VarListNE*, %VarListNE** %tmp.64
	ret %VarListNE* %tmp.90

abort:
	call void @abort(  )
	unreachable
}

define %VarListNE* @VarListNE_new() {

entry:
	%tmp.91 = getelementptr %VarListNE_vtable, %VarListNE_vtable* @VarListNE_vtable_prototype, i32 0, i32 1
	%tmp.92 = load i32, i32* %tmp.91
	%tmp.93 = call i8*(i32) @malloc( i32 %tmp.92 )
	%tmp.94 = bitcast i8* %tmp.93 to %VarListNE*
	%tmp.95 = getelementptr %VarListNE, %VarListNE* %tmp.94, i32 0, i32 0
	store %VarListNE_vtable* @VarListNE_vtable_prototype, %VarListNE_vtable** %tmp.95
	%tmp.96 = alloca %VarListNE*
	store %VarListNE* %tmp.94, %VarListNE** %tmp.96
	%tmp.97 = getelementptr %VarListNE, %VarListNE* %tmp.94, i32 0, i32 1
	store %Variable* null, %Variable** %tmp.97
	%tmp.98 = getelementptr %VarListNE, %VarListNE* %tmp.94, i32 0, i32 2
	store %VarList* null, %VarList** %tmp.98
	ret %VarListNE* %tmp.94

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Expr_print_self(%Expr* %self) {

entry:
	%tmp.99 = alloca %Expr*
	store %Expr* %self, %Expr** %tmp.99
	%tmp.100 = load %Expr*, %Expr** %tmp.99
	%tmp.101 = icmp eq %Expr* %tmp.100, null
	br i1 %tmp.101, label %abort, label %ok.0

ok.0:
	%tmp.102 = getelementptr %Expr, %Expr* %tmp.100, i32 0, i32 0
	%tmp.103 = load %Expr_vtable*, %Expr_vtable** %tmp.102
	%tmp.104 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.103, i32 0, i32 7
	%tmp.105 = load %Expr* (%Expr*,%String*) *, %Expr* (%Expr*,%String*) ** %tmp.104
	%tmp.106 = call %Expr*(%Expr*, %String*) %tmp.105( %Expr* %tmp.100, %String* @String.3 )
	%tmp.107 = load %Expr*, %Expr** %tmp.99
	%tmp.108 = icmp eq %Expr* %tmp.107, null
	br i1 %tmp.108, label %abort, label %ok.1

ok.1:
	%tmp.109 = getelementptr %Expr, %Expr* %tmp.107, i32 0, i32 0
	%tmp.110 = load %Expr_vtable*, %Expr_vtable** %tmp.109
	%tmp.111 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.110, i32 0, i32 4
	%tmp.112 = load %Object* (%Expr*) *, %Object* (%Expr*) ** %tmp.111
	%tmp.113 = call %Object*(%Expr*) %tmp.112( %Expr* %tmp.107 )
	%tmp.114 = load %Expr*, %Expr** %tmp.99
	ret %Expr* %tmp.114

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Expr_beta(%Expr* %self) {

entry:
	%tmp.115 = alloca %Expr*
	store %Expr* %self, %Expr** %tmp.115
	%tmp.116 = load %Expr*, %Expr** %tmp.115
	%tmp.117 = icmp eq %Expr* %tmp.116, null
	br i1 %tmp.117, label %abort, label %ok.2

ok.2:
	%tmp.118 = getelementptr %Expr, %Expr* %tmp.116, i32 0, i32 0
	%tmp.119 = load %Expr_vtable*, %Expr_vtable** %tmp.118
	%tmp.120 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.119, i32 0, i32 7
	%tmp.121 = load %Expr* (%Expr*,%String*) *, %Expr* (%Expr*,%String*) ** %tmp.120
	%tmp.122 = call %Expr*(%Expr*, %String*) %tmp.121( %Expr* %tmp.116, %String* @String.4 )
	%tmp.123 = load %Expr*, %Expr** %tmp.115
	%tmp.124 = icmp eq %Expr* %tmp.123, null
	br i1 %tmp.124, label %abort, label %ok.3

ok.3:
	%tmp.125 = getelementptr %Expr, %Expr* %tmp.123, i32 0, i32 0
	%tmp.126 = load %Expr_vtable*, %Expr_vtable** %tmp.125
	%tmp.127 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.126, i32 0, i32 4
	%tmp.128 = load %Object* (%Expr*) *, %Object* (%Expr*) ** %tmp.127
	%tmp.129 = call %Object*(%Expr*) %tmp.128( %Expr* %tmp.123 )
	%tmp.130 = load %Expr*, %Expr** %tmp.115
	ret %Expr* %tmp.130

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Expr_substitute(%Expr* %self, %Variable* %x, %Expr* %e) {

entry:
	%tmp.131 = alloca %Expr*
	store %Expr* %self, %Expr** %tmp.131
	%tmp.132 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.132
	%tmp.133 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.133
	%tmp.134 = load %Expr*, %Expr** %tmp.131
	%tmp.135 = icmp eq %Expr* %tmp.134, null
	br i1 %tmp.135, label %abort, label %ok.4

ok.4:
	%tmp.136 = getelementptr %Expr, %Expr* %tmp.134, i32 0, i32 0
	%tmp.137 = load %Expr_vtable*, %Expr_vtable** %tmp.136
	%tmp.138 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.137, i32 0, i32 7
	%tmp.139 = load %Expr* (%Expr*,%String*) *, %Expr* (%Expr*,%String*) ** %tmp.138
	%tmp.140 = call %Expr*(%Expr*, %String*) %tmp.139( %Expr* %tmp.134, %String* @String.5 )
	%tmp.141 = load %Expr*, %Expr** %tmp.131
	%tmp.142 = icmp eq %Expr* %tmp.141, null
	br i1 %tmp.142, label %abort, label %ok.5

ok.5:
	%tmp.143 = getelementptr %Expr, %Expr* %tmp.141, i32 0, i32 0
	%tmp.144 = load %Expr_vtable*, %Expr_vtable** %tmp.143
	%tmp.145 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.144, i32 0, i32 4
	%tmp.146 = load %Object* (%Expr*) *, %Object* (%Expr*) ** %tmp.145
	%tmp.147 = call %Object*(%Expr*) %tmp.146( %Expr* %tmp.141 )
	%tmp.148 = load %Expr*, %Expr** %tmp.131
	ret %Expr* %tmp.148

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Expr_gen_code(%Expr* %self, %VarList* %env, %LambdaListRef* %closures) {

entry:
	%tmp.149 = alloca %Expr*
	store %Expr* %self, %Expr** %tmp.149
	%tmp.150 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.150
	%tmp.151 = alloca %LambdaListRef*
	store %LambdaListRef* %closures, %LambdaListRef** %tmp.151
	%tmp.152 = load %Expr*, %Expr** %tmp.149
	%tmp.153 = icmp eq %Expr* %tmp.152, null
	br i1 %tmp.153, label %abort, label %ok.6

ok.6:
	%tmp.154 = getelementptr %Expr, %Expr* %tmp.152, i32 0, i32 0
	%tmp.155 = load %Expr_vtable*, %Expr_vtable** %tmp.154
	%tmp.156 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.155, i32 0, i32 7
	%tmp.157 = load %Expr* (%Expr*,%String*) *, %Expr* (%Expr*,%String*) ** %tmp.156
	%tmp.158 = call %Expr*(%Expr*, %String*) %tmp.157( %Expr* %tmp.152, %String* @String.6 )
	%tmp.159 = load %Expr*, %Expr** %tmp.149
	%tmp.160 = icmp eq %Expr* %tmp.159, null
	br i1 %tmp.160, label %abort, label %ok.7

ok.7:
	%tmp.161 = getelementptr %Expr, %Expr* %tmp.159, i32 0, i32 0
	%tmp.162 = load %Expr_vtable*, %Expr_vtable** %tmp.161
	%tmp.163 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.162, i32 0, i32 4
	%tmp.164 = load %Object* (%Expr*) *, %Object* (%Expr*) ** %tmp.163
	%tmp.165 = call %Object*(%Expr*) %tmp.164( %Expr* %tmp.159 )
	%tmp.166 = load %Expr*, %Expr** %tmp.149
	ret %Expr* %tmp.166

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Expr_new() {

entry:
	%tmp.167 = getelementptr %Expr_vtable, %Expr_vtable* @Expr_vtable_prototype, i32 0, i32 1
	%tmp.168 = load i32, i32* %tmp.167
	%tmp.169 = call i8*(i32) @malloc( i32 %tmp.168 )
	%tmp.170 = bitcast i8* %tmp.169 to %Expr*
	%tmp.171 = getelementptr %Expr, %Expr* %tmp.170, i32 0, i32 0
	store %Expr_vtable* @Expr_vtable_prototype, %Expr_vtable** %tmp.171
	%tmp.172 = alloca %Expr*
	store %Expr* %tmp.170, %Expr** %tmp.172
	ret %Expr* %tmp.170

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @Variable_init(%Variable* %self, %String* %n) {

entry:
	%tmp.173 = alloca %Variable*
	store %Variable* %self, %Variable** %tmp.173
	%tmp.174 = alloca %String*
	store %String* %n, %String** %tmp.174
	%tmp.175 = load %String*, %String** %tmp.174
	%tmp.176 = load %Variable*, %Variable** %tmp.173
	%tmp.177 = getelementptr %Variable, %Variable* %tmp.176, i32 0, i32 1
	store %String* %tmp.175, %String** %tmp.177
	%tmp.178 = load %Variable*, %Variable** %tmp.173
	ret %Variable* %tmp.178

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @Variable_print_self(%Variable* %self) {

entry:
	%tmp.179 = alloca %Variable*
	store %Variable* %self, %Variable** %tmp.179
	%tmp.180 = load %Variable*, %Variable** %tmp.179
	%tmp.181 = getelementptr %Variable, %Variable* %tmp.180, i32 0, i32 1
	%tmp.182 = load %String*, %String** %tmp.181
	%tmp.183 = load %Variable*, %Variable** %tmp.179
	%tmp.184 = icmp eq %Variable* %tmp.183, null
	br i1 %tmp.184, label %abort, label %ok.0

ok.0:
	%tmp.185 = getelementptr %Variable, %Variable* %tmp.183, i32 0, i32 0
	%tmp.186 = load %Variable_vtable*, %Variable_vtable** %tmp.185
	%tmp.187 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.186, i32 0, i32 7
	%tmp.188 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.187
	%tmp.189 = call %Variable*(%Variable*, %String*) %tmp.188( %Variable* %tmp.183, %String* %tmp.182 )
	ret %Variable* %tmp.189

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Variable_beta(%Variable* %self) {

entry:
	%tmp.190 = alloca %Variable*
	store %Variable* %self, %Variable** %tmp.190
	%tmp.191 = load %Variable*, %Variable** %tmp.190
	%tmp.192 = bitcast %Variable* %tmp.191 to %Expr*
	ret %Expr* %tmp.192

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Variable_substitute(%Variable* %self, %Variable* %x, %Expr* %e) {

entry:
	%tmp.193 = alloca %Variable*
	store %Variable* %self, %Variable** %tmp.193
	%tmp.194 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.194
	%tmp.195 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.195
	%tmp.196 = alloca %Expr*
	%tmp.197 = load %Variable*, %Variable** %tmp.194
	%tmp.198 = load %Variable*, %Variable** %tmp.193
	%tmp.199 = icmp eq %Variable* %tmp.197, %tmp.198
	br i1 %tmp.199, label %true.0, label %false.0

true.0:
	%tmp.200 = load %Expr*, %Expr** %tmp.195
	store %Expr* %tmp.200, %Expr** %tmp.196
	br label %end.0

false.0:
	%tmp.201 = load %Variable*, %Variable** %tmp.193
	%tmp.202 = bitcast %Variable* %tmp.201 to %Expr*
	store %Expr* %tmp.202, %Expr** %tmp.196
	br label %end.0

end.0:
	%tmp.203 = load %Expr*, %Expr** %tmp.196
	ret %Expr* %tmp.203

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @Variable_gen_code(%Variable* %self, %VarList* %env, %LambdaListRef* %closures) {

entry:
	%tmp.204 = alloca %Variable*
	store %Variable* %self, %Variable** %tmp.204
	%tmp.205 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.205
	%tmp.206 = alloca %LambdaListRef*
	store %LambdaListRef* %closures, %LambdaListRef** %tmp.206
	%tmp.207 = load %VarList*, %VarList** %tmp.205
	%tmp.208 = alloca %VarList*
	store %VarList* %tmp.207, %VarList** %tmp.208
	br label %loop.1

loop.1:
	%tmp.209 = alloca i1
	%tmp.210 = load %VarList*, %VarList** %tmp.208
	%tmp.211 = icmp eq %VarList* %tmp.210, null
	br i1 %tmp.211, label %abort, label %ok.1

ok.1:
	%tmp.212 = getelementptr %VarList, %VarList* %tmp.210, i32 0, i32 0
	%tmp.213 = load %VarList_vtable*, %VarList_vtable** %tmp.212
	%tmp.214 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.213, i32 0, i32 11
	%tmp.215 = load i1 (%VarList*) *, i1 (%VarList*) ** %tmp.214
	%tmp.216 = call i1(%VarList*) %tmp.215( %VarList* %tmp.210 )
	br i1 %tmp.216, label %true.2, label %false.2

true.2:
	store i1 false, i1* %tmp.209
	br label %end.2

false.2:
	%tmp.217 = load %VarList*, %VarList** %tmp.208
	%tmp.218 = icmp eq %VarList* %tmp.217, null
	br i1 %tmp.218, label %abort, label %ok.2

ok.2:
	%tmp.219 = getelementptr %VarList, %VarList* %tmp.217, i32 0, i32 0
	%tmp.220 = load %VarList_vtable*, %VarList_vtable** %tmp.219
	%tmp.221 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.220, i32 0, i32 12
	%tmp.222 = load %Variable* (%VarList*) *, %Variable* (%VarList*) ** %tmp.221
	%tmp.223 = call %Variable*(%VarList*) %tmp.222( %VarList* %tmp.217 )
	%tmp.224 = load %Variable*, %Variable** %tmp.204
	%tmp.225 = icmp eq %Variable* %tmp.223, %tmp.224
	%tmp.226 = xor i1 %tmp.225, true
	store i1 %tmp.226, i1* %tmp.209
	br label %end.2

end.2:
	%tmp.227 = load i1, i1* %tmp.209
	br i1 %tmp.227, label %true.1, label %false.1

true.1:
	%tmp.228 = load %Variable*, %Variable** %tmp.204
	%tmp.229 = icmp eq %Variable* %tmp.228, null
	br i1 %tmp.229, label %abort, label %ok.3

ok.3:
	%tmp.230 = getelementptr %Variable, %Variable* %tmp.228, i32 0, i32 0
	%tmp.231 = load %Variable_vtable*, %Variable_vtable** %tmp.230
	%tmp.232 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.231, i32 0, i32 7
	%tmp.233 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.232
	%tmp.234 = call %Variable*(%Variable*, %String*) %tmp.233( %Variable* %tmp.228, %String* @String.7 )
	%tmp.235 = load %VarList*, %VarList** %tmp.208
	%tmp.236 = icmp eq %VarList* %tmp.235, null
	br i1 %tmp.236, label %abort, label %ok.4

ok.4:
	%tmp.237 = getelementptr %VarList, %VarList* %tmp.235, i32 0, i32 0
	%tmp.238 = load %VarList_vtable*, %VarList_vtable** %tmp.237
	%tmp.239 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.238, i32 0, i32 13
	%tmp.240 = load %VarList* (%VarList*) *, %VarList* (%VarList*) ** %tmp.239
	%tmp.241 = call %VarList*(%VarList*) %tmp.240( %VarList* %tmp.235 )
	store %VarList* %tmp.241, %VarList** %tmp.208
	br label %loop.1

false.1:
	%tmp.242 = alloca %Variable*
	%tmp.243 = load %VarList*, %VarList** %tmp.208
	%tmp.244 = icmp eq %VarList* %tmp.243, null
	br i1 %tmp.244, label %abort, label %ok.5

ok.5:
	%tmp.245 = getelementptr %VarList, %VarList* %tmp.243, i32 0, i32 0
	%tmp.246 = load %VarList_vtable*, %VarList_vtable** %tmp.245
	%tmp.247 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.246, i32 0, i32 11
	%tmp.248 = load i1 (%VarList*) *, i1 (%VarList*) ** %tmp.247
	%tmp.249 = call i1(%VarList*) %tmp.248( %VarList* %tmp.243 )
	br i1 %tmp.249, label %true.3, label %false.3

true.3:
	%tmp.250 = load %Variable*, %Variable** %tmp.204
	%tmp.251 = icmp eq %Variable* %tmp.250, null
	br i1 %tmp.251, label %abort, label %ok.6

ok.6:
	%tmp.252 = getelementptr %Variable, %Variable* %tmp.250, i32 0, i32 0
	%tmp.253 = load %Variable_vtable*, %Variable_vtable** %tmp.252
	%tmp.254 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.253, i32 0, i32 7
	%tmp.255 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.254
	%tmp.256 = call %Variable*(%Variable*, %String*) %tmp.255( %Variable* %tmp.250, %String* @String.8 )
	%tmp.257 = load %Variable*, %Variable** %tmp.204
	%tmp.258 = icmp eq %Variable* %tmp.257, null
	br i1 %tmp.258, label %abort, label %ok.7

ok.7:
	%tmp.259 = getelementptr %Variable, %Variable* %tmp.257, i32 0, i32 0
	%tmp.260 = load %Variable_vtable*, %Variable_vtable** %tmp.259
	%tmp.261 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.260, i32 0, i32 11
	%tmp.262 = load %Variable* (%Variable*) *, %Variable* (%Variable*) ** %tmp.261
	%tmp.263 = call %Variable*(%Variable*) %tmp.262( %Variable* %tmp.257 )
	%tmp.264 = load %Variable*, %Variable** %tmp.204
	%tmp.265 = icmp eq %Variable* %tmp.264, null
	br i1 %tmp.265, label %abort, label %ok.8

ok.8:
	%tmp.266 = getelementptr %Variable, %Variable* %tmp.264, i32 0, i32 0
	%tmp.267 = load %Variable_vtable*, %Variable_vtable** %tmp.266
	%tmp.268 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.267, i32 0, i32 7
	%tmp.269 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.268
	%tmp.270 = call %Variable*(%Variable*, %String*) %tmp.269( %Variable* %tmp.264, %String* @String.1 )
	%tmp.271 = load %Variable*, %Variable** %tmp.204
	%tmp.272 = icmp eq %Variable* %tmp.271, null
	br i1 %tmp.272, label %abort, label %ok.9

ok.9:
	%tmp.273 = getelementptr %Variable, %Variable* %tmp.271, i32 0, i32 0
	%tmp.274 = load %Variable_vtable*, %Variable_vtable** %tmp.273
	%tmp.275 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.274, i32 0, i32 4
	%tmp.276 = load %Object* (%Variable*) *, %Object* (%Variable*) ** %tmp.275
	%tmp.277 = call %Object*(%Variable*) %tmp.276( %Variable* %tmp.271 )
	%tmp.278 = load %Variable*, %Variable** %tmp.204
	store %Variable* %tmp.278, %Variable** %tmp.242
	br label %end.3

false.3:
	%tmp.279 = load %Variable*, %Variable** %tmp.204
	%tmp.280 = icmp eq %Variable* %tmp.279, null
	br i1 %tmp.280, label %abort, label %ok.10

ok.10:
	%tmp.281 = getelementptr %Variable, %Variable* %tmp.279, i32 0, i32 0
	%tmp.282 = load %Variable_vtable*, %Variable_vtable** %tmp.281
	%tmp.283 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.282, i32 0, i32 7
	%tmp.284 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.283
	%tmp.285 = call %Variable*(%Variable*, %String*) %tmp.284( %Variable* %tmp.279, %String* @String.9 )
	store %Variable* %tmp.285, %Variable** %tmp.242
	br label %end.3

end.3:
	%tmp.286 = load %Variable*, %Variable** %tmp.242
	ret %Variable* %tmp.286

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @Variable_new() {

entry:
	%tmp.287 = getelementptr %Variable_vtable, %Variable_vtable* @Variable_vtable_prototype, i32 0, i32 1
	%tmp.288 = load i32, i32* %tmp.287
	%tmp.289 = call i8*(i32) @malloc( i32 %tmp.288 )
	%tmp.290 = bitcast i8* %tmp.289 to %Variable*
	%tmp.291 = getelementptr %Variable, %Variable* %tmp.290, i32 0, i32 0
	store %Variable_vtable* @Variable_vtable_prototype, %Variable_vtable** %tmp.291
	%tmp.292 = alloca %Variable*
	store %Variable* %tmp.290, %Variable** %tmp.292
	%tmp.293 = getelementptr %Variable, %Variable* %tmp.290, i32 0, i32 1
	%tmp.294 = call %String* @String_new(  )
	store %String* %tmp.294, %String** %tmp.293
	ret %Variable* %tmp.290

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Lambda_init(%Lambda* %self, %Variable* %a, %Expr* %b) {

entry:
	%tmp.295 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.295
	%tmp.296 = alloca %Variable*
	store %Variable* %a, %Variable** %tmp.296
	%tmp.297 = alloca %Expr*
	store %Expr* %b, %Expr** %tmp.297
	%tmp.298 = load %Variable*, %Variable** %tmp.296
	%tmp.299 = load %Lambda*, %Lambda** %tmp.295
	%tmp.300 = getelementptr %Lambda, %Lambda* %tmp.299, i32 0, i32 1
	store %Variable* %tmp.298, %Variable** %tmp.300
	%tmp.301 = load %Expr*, %Expr** %tmp.297
	%tmp.302 = load %Lambda*, %Lambda** %tmp.295
	%tmp.303 = getelementptr %Lambda, %Lambda* %tmp.302, i32 0, i32 2
	store %Expr* %tmp.301, %Expr** %tmp.303
	%tmp.304 = load %Lambda*, %Lambda** %tmp.295
	ret %Lambda* %tmp.304

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Lambda_print_self(%Lambda* %self) {

entry:
	%tmp.305 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.305
	%tmp.306 = load %Lambda*, %Lambda** %tmp.305
	%tmp.307 = icmp eq %Lambda* %tmp.306, null
	br i1 %tmp.307, label %abort, label %ok.0

ok.0:
	%tmp.308 = getelementptr %Lambda, %Lambda* %tmp.306, i32 0, i32 0
	%tmp.309 = load %Lambda_vtable*, %Lambda_vtable** %tmp.308
	%tmp.310 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.309, i32 0, i32 7
	%tmp.311 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.310
	%tmp.312 = call %Lambda*(%Lambda*, %String*) %tmp.311( %Lambda* %tmp.306, %String* @String.10 )
	%tmp.313 = load %Lambda*, %Lambda** %tmp.305
	%tmp.314 = getelementptr %Lambda, %Lambda* %tmp.313, i32 0, i32 1
	%tmp.315 = load %Variable*, %Variable** %tmp.314
	%tmp.316 = icmp eq %Variable* %tmp.315, null
	br i1 %tmp.316, label %abort, label %ok.1

ok.1:
	%tmp.317 = getelementptr %Variable, %Variable* %tmp.315, i32 0, i32 0
	%tmp.318 = load %Variable_vtable*, %Variable_vtable** %tmp.317
	%tmp.319 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.318, i32 0, i32 11
	%tmp.320 = load %Variable* (%Variable*) *, %Variable* (%Variable*) ** %tmp.319
	%tmp.321 = call %Variable*(%Variable*) %tmp.320( %Variable* %tmp.315 )
	%tmp.322 = load %Lambda*, %Lambda** %tmp.305
	%tmp.323 = icmp eq %Lambda* %tmp.322, null
	br i1 %tmp.323, label %abort, label %ok.2

ok.2:
	%tmp.324 = getelementptr %Lambda, %Lambda* %tmp.322, i32 0, i32 0
	%tmp.325 = load %Lambda_vtable*, %Lambda_vtable** %tmp.324
	%tmp.326 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.325, i32 0, i32 7
	%tmp.327 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.326
	%tmp.328 = call %Lambda*(%Lambda*, %String*) %tmp.327( %Lambda* %tmp.322, %String* @String.11 )
	%tmp.329 = load %Lambda*, %Lambda** %tmp.305
	%tmp.330 = getelementptr %Lambda, %Lambda* %tmp.329, i32 0, i32 2
	%tmp.331 = load %Expr*, %Expr** %tmp.330
	%tmp.332 = icmp eq %Expr* %tmp.331, null
	br i1 %tmp.332, label %abort, label %ok.3

ok.3:
	%tmp.333 = getelementptr %Expr, %Expr* %tmp.331, i32 0, i32 0
	%tmp.334 = load %Expr_vtable*, %Expr_vtable** %tmp.333
	%tmp.335 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.334, i32 0, i32 11
	%tmp.336 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.335
	%tmp.337 = call %Expr*(%Expr*) %tmp.336( %Expr* %tmp.331 )
	%tmp.338 = load %Lambda*, %Lambda** %tmp.305
	ret %Lambda* %tmp.338

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Lambda_beta(%Lambda* %self) {

entry:
	%tmp.339 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.339
	%tmp.340 = load %Lambda*, %Lambda** %tmp.339
	%tmp.341 = bitcast %Lambda* %tmp.340 to %Expr*
	ret %Expr* %tmp.341

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Lambda_apply(%Lambda* %self, %Expr* %actual) {

entry:
	%tmp.342 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.342
	%tmp.343 = alloca %Expr*
	store %Expr* %actual, %Expr** %tmp.343
	%tmp.344 = load %Lambda*, %Lambda** %tmp.342
	%tmp.345 = getelementptr %Lambda, %Lambda* %tmp.344, i32 0, i32 1
	%tmp.346 = load %Variable*, %Variable** %tmp.345
	%tmp.347 = load %Expr*, %Expr** %tmp.343
	%tmp.348 = load %Lambda*, %Lambda** %tmp.342
	%tmp.349 = getelementptr %Lambda, %Lambda* %tmp.348, i32 0, i32 2
	%tmp.350 = load %Expr*, %Expr** %tmp.349
	%tmp.351 = icmp eq %Expr* %tmp.350, null
	br i1 %tmp.351, label %abort, label %ok.4

ok.4:
	%tmp.352 = getelementptr %Expr, %Expr* %tmp.350, i32 0, i32 0
	%tmp.353 = load %Expr_vtable*, %Expr_vtable** %tmp.352
	%tmp.354 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.353, i32 0, i32 13
	%tmp.355 = load %Expr* (%Expr*,%Variable*,%Expr*) *, %Expr* (%Expr*,%Variable*,%Expr*) ** %tmp.354
	%tmp.356 = call %Expr*(%Expr*, %Variable*, %Expr*) %tmp.355( %Expr* %tmp.350, %Variable* %tmp.346, %Expr* %tmp.347 )
	ret %Expr* %tmp.356

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Lambda_substitute(%Lambda* %self, %Variable* %x, %Expr* %e) {

entry:
	%tmp.357 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.357
	%tmp.358 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.358
	%tmp.359 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.359
	%tmp.360 = alloca %Lambda*
	%tmp.361 = load %Variable*, %Variable** %tmp.358
	%tmp.362 = load %Lambda*, %Lambda** %tmp.357
	%tmp.363 = getelementptr %Lambda, %Lambda* %tmp.362, i32 0, i32 1
	%tmp.364 = load %Variable*, %Variable** %tmp.363
	%tmp.365 = icmp eq %Variable* %tmp.361, %tmp.364
	br i1 %tmp.365, label %true.0, label %false.0

true.0:
	%tmp.366 = load %Lambda*, %Lambda** %tmp.357
	store %Lambda* %tmp.366, %Lambda** %tmp.360
	br label %end.0

false.0:
	%tmp.367 = load %Variable*, %Variable** %tmp.358
	%tmp.368 = load %Expr*, %Expr** %tmp.359
	%tmp.369 = load %Lambda*, %Lambda** %tmp.357
	%tmp.370 = getelementptr %Lambda, %Lambda* %tmp.369, i32 0, i32 2
	%tmp.371 = load %Expr*, %Expr** %tmp.370
	%tmp.372 = icmp eq %Expr* %tmp.371, null
	br i1 %tmp.372, label %abort, label %ok.5

ok.5:
	%tmp.373 = getelementptr %Expr, %Expr* %tmp.371, i32 0, i32 0
	%tmp.374 = load %Expr_vtable*, %Expr_vtable** %tmp.373
	%tmp.375 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.374, i32 0, i32 13
	%tmp.376 = load %Expr* (%Expr*,%Variable*,%Expr*) *, %Expr* (%Expr*,%Variable*,%Expr*) ** %tmp.375
	%tmp.377 = call %Expr*(%Expr*, %Variable*, %Expr*) %tmp.376( %Expr* %tmp.371, %Variable* %tmp.367, %Expr* %tmp.368 )
	%tmp.378 = alloca %Expr*
	store %Expr* %tmp.377, %Expr** %tmp.378
	%tmp.379 = call %Lambda* @Lambda_new(  )
	%tmp.380 = alloca %Lambda*
	store %Lambda* %tmp.379, %Lambda** %tmp.380
	%tmp.381 = load %Lambda*, %Lambda** %tmp.357
	%tmp.382 = getelementptr %Lambda, %Lambda* %tmp.381, i32 0, i32 1
	%tmp.383 = load %Variable*, %Variable** %tmp.382
	%tmp.384 = load %Expr*, %Expr** %tmp.378
	%tmp.385 = load %Lambda*, %Lambda** %tmp.380
	%tmp.386 = icmp eq %Lambda* %tmp.385, null
	br i1 %tmp.386, label %abort, label %ok.6

ok.6:
	%tmp.387 = getelementptr %Lambda, %Lambda* %tmp.385, i32 0, i32 0
	%tmp.388 = load %Lambda_vtable*, %Lambda_vtable** %tmp.387
	%tmp.389 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.388, i32 0, i32 15
	%tmp.390 = load %Lambda* (%Lambda*,%Variable*,%Expr*) *, %Lambda* (%Lambda*,%Variable*,%Expr*) ** %tmp.389
	%tmp.391 = call %Lambda*(%Lambda*, %Variable*, %Expr*) %tmp.390( %Lambda* %tmp.385, %Variable* %tmp.383, %Expr* %tmp.384 )
	store %Lambda* %tmp.391, %Lambda** %tmp.360
	br label %end.0

end.0:
	%tmp.392 = load %Lambda*, %Lambda** %tmp.360
	%tmp.393 = bitcast %Lambda* %tmp.392 to %Expr*
	ret %Expr* %tmp.393

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Lambda_gen_code(%Lambda* %self, %VarList* %env, %LambdaListRef* %closures) {

entry:
	%tmp.394 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.394
	%tmp.395 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.395
	%tmp.396 = alloca %LambdaListRef*
	store %LambdaListRef* %closures, %LambdaListRef** %tmp.396
	%tmp.397 = load %Lambda*, %Lambda** %tmp.394
	%tmp.398 = icmp eq %Lambda* %tmp.397, null
	br i1 %tmp.398, label %abort, label %ok.7

ok.7:
	%tmp.399 = getelementptr %Lambda, %Lambda* %tmp.397, i32 0, i32 0
	%tmp.400 = load %Lambda_vtable*, %Lambda_vtable** %tmp.399
	%tmp.401 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.400, i32 0, i32 7
	%tmp.402 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.401
	%tmp.403 = call %Lambda*(%Lambda*, %String*) %tmp.402( %Lambda* %tmp.397, %String* @String.12 )
	%tmp.404 = load %VarList*, %VarList** %tmp.395
	%tmp.405 = load %Lambda*, %Lambda** %tmp.394
	%tmp.406 = load %LambdaListRef*, %LambdaListRef** %tmp.396
	%tmp.407 = icmp eq %LambdaListRef* %tmp.406, null
	br i1 %tmp.407, label %abort, label %ok.8

ok.8:
	%tmp.408 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.406, i32 0, i32 0
	%tmp.409 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.408
	%tmp.410 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.409, i32 0, i32 12
	%tmp.411 = load i32 (%LambdaListRef*,%VarList*,%Lambda*) *, i32 (%LambdaListRef*,%VarList*,%Lambda*) ** %tmp.410
	%tmp.412 = call i32(%LambdaListRef*, %VarList*, %Lambda*) %tmp.411( %LambdaListRef* %tmp.406, %VarList* %tmp.404, %Lambda* %tmp.405 )
	%tmp.413 = load %Lambda*, %Lambda** %tmp.394
	%tmp.414 = icmp eq %Lambda* %tmp.413, null
	br i1 %tmp.414, label %abort, label %ok.9

ok.9:
	%tmp.415 = getelementptr %Lambda, %Lambda* %tmp.413, i32 0, i32 0
	%tmp.416 = load %Lambda_vtable*, %Lambda_vtable** %tmp.415
	%tmp.417 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.416, i32 0, i32 8
	%tmp.418 = load %Lambda* (%Lambda*,i32) *, %Lambda* (%Lambda*,i32) ** %tmp.417
	%tmp.419 = call %Lambda*(%Lambda*, i32) %tmp.418( %Lambda* %tmp.413, i32 %tmp.412 )
	%tmp.420 = load %Lambda*, %Lambda** %tmp.394
	%tmp.421 = icmp eq %Lambda* %tmp.420, null
	br i1 %tmp.421, label %abort, label %ok.10

ok.10:
	%tmp.422 = getelementptr %Lambda, %Lambda* %tmp.420, i32 0, i32 0
	%tmp.423 = load %Lambda_vtable*, %Lambda_vtable** %tmp.422
	%tmp.424 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.423, i32 0, i32 7
	%tmp.425 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.424
	%tmp.426 = call %Lambda*(%Lambda*, %String*) %tmp.425( %Lambda* %tmp.420, %String* @String.13 )
	%tmp.427 = alloca %Lambda*
	%tmp.428 = load %VarList*, %VarList** %tmp.395
	%tmp.429 = icmp eq %VarList* %tmp.428, null
	br i1 %tmp.429, label %abort, label %ok.11

ok.11:
	%tmp.430 = getelementptr %VarList, %VarList* %tmp.428, i32 0, i32 0
	%tmp.431 = load %VarList_vtable*, %VarList_vtable** %tmp.430
	%tmp.432 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.431, i32 0, i32 11
	%tmp.433 = load i1 (%VarList*) *, i1 (%VarList*) ** %tmp.432
	%tmp.434 = call i1(%VarList*) %tmp.433( %VarList* %tmp.428 )
	br i1 %tmp.434, label %true.1, label %false.1

true.1:
	%tmp.435 = load %Lambda*, %Lambda** %tmp.394
	%tmp.436 = icmp eq %Lambda* %tmp.435, null
	br i1 %tmp.436, label %abort, label %ok.12

ok.12:
	%tmp.437 = getelementptr %Lambda, %Lambda* %tmp.435, i32 0, i32 0
	%tmp.438 = load %Lambda_vtable*, %Lambda_vtable** %tmp.437
	%tmp.439 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.438, i32 0, i32 7
	%tmp.440 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.439
	%tmp.441 = call %Lambda*(%Lambda*, %String*) %tmp.440( %Lambda* %tmp.435, %String* @String.14 )
	store %Lambda* %tmp.441, %Lambda** %tmp.427
	br label %end.1

false.1:
	%tmp.442 = load %Lambda*, %Lambda** %tmp.394
	%tmp.443 = icmp eq %Lambda* %tmp.442, null
	br i1 %tmp.443, label %abort, label %ok.13

ok.13:
	%tmp.444 = getelementptr %Lambda, %Lambda* %tmp.442, i32 0, i32 0
	%tmp.445 = load %Lambda_vtable*, %Lambda_vtable** %tmp.444
	%tmp.446 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.445, i32 0, i32 7
	%tmp.447 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.446
	%tmp.448 = call %Lambda*(%Lambda*, %String*) %tmp.447( %Lambda* %tmp.442, %String* @String.15 )
	store %Lambda* %tmp.448, %Lambda** %tmp.427
	br label %end.1

end.1:
	%tmp.449 = load %Lambda*, %Lambda** %tmp.427
	%tmp.450 = load %Lambda*, %Lambda** %tmp.394
	ret %Lambda* %tmp.450

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Lambda_gen_closure_code(%Lambda* %self, i32 %n, %VarList* %env, %LambdaListRef* %closures) {

entry:
	%tmp.451 = alloca %Lambda*
	store %Lambda* %self, %Lambda** %tmp.451
	%tmp.452 = alloca i32
	store i32 %n, i32* %tmp.452
	%tmp.453 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.453
	%tmp.454 = alloca %LambdaListRef*
	store %LambdaListRef* %closures, %LambdaListRef** %tmp.454
	%tmp.455 = load %Lambda*, %Lambda** %tmp.451
	%tmp.456 = icmp eq %Lambda* %tmp.455, null
	br i1 %tmp.456, label %abort, label %ok.14

ok.14:
	%tmp.457 = getelementptr %Lambda, %Lambda* %tmp.455, i32 0, i32 0
	%tmp.458 = load %Lambda_vtable*, %Lambda_vtable** %tmp.457
	%tmp.459 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.458, i32 0, i32 7
	%tmp.460 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.459
	%tmp.461 = call %Lambda*(%Lambda*, %String*) %tmp.460( %Lambda* %tmp.455, %String* @String.16 )
	%tmp.462 = load i32, i32* %tmp.452
	%tmp.463 = load %Lambda*, %Lambda** %tmp.451
	%tmp.464 = icmp eq %Lambda* %tmp.463, null
	br i1 %tmp.464, label %abort, label %ok.15

ok.15:
	%tmp.465 = getelementptr %Lambda, %Lambda* %tmp.463, i32 0, i32 0
	%tmp.466 = load %Lambda_vtable*, %Lambda_vtable** %tmp.465
	%tmp.467 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.466, i32 0, i32 8
	%tmp.468 = load %Lambda* (%Lambda*,i32) *, %Lambda* (%Lambda*,i32) ** %tmp.467
	%tmp.469 = call %Lambda*(%Lambda*, i32) %tmp.468( %Lambda* %tmp.463, i32 %tmp.462 )
	%tmp.470 = load %Lambda*, %Lambda** %tmp.451
	%tmp.471 = icmp eq %Lambda* %tmp.470, null
	br i1 %tmp.471, label %abort, label %ok.16

ok.16:
	%tmp.472 = getelementptr %Lambda, %Lambda* %tmp.470, i32 0, i32 0
	%tmp.473 = load %Lambda_vtable*, %Lambda_vtable** %tmp.472
	%tmp.474 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.473, i32 0, i32 7
	%tmp.475 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.474
	%tmp.476 = call %Lambda*(%Lambda*, %String*) %tmp.475( %Lambda* %tmp.470, %String* @String.17 )
	%tmp.477 = load %Lambda*, %Lambda** %tmp.451
	%tmp.478 = icmp eq %Lambda* %tmp.477, null
	br i1 %tmp.478, label %abort, label %ok.17

ok.17:
	%tmp.479 = getelementptr %Lambda, %Lambda* %tmp.477, i32 0, i32 0
	%tmp.480 = load %Lambda_vtable*, %Lambda_vtable** %tmp.479
	%tmp.481 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.480, i32 0, i32 7
	%tmp.482 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.481
	%tmp.483 = call %Lambda*(%Lambda*, %String*) %tmp.482( %Lambda* %tmp.477, %String* @String.18 )
	%tmp.484 = load %Lambda*, %Lambda** %tmp.451
	%tmp.485 = icmp eq %Lambda* %tmp.484, null
	br i1 %tmp.485, label %abort, label %ok.18

ok.18:
	%tmp.486 = getelementptr %Lambda, %Lambda* %tmp.484, i32 0, i32 0
	%tmp.487 = load %Lambda_vtable*, %Lambda_vtable** %tmp.486
	%tmp.488 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.487, i32 0, i32 7
	%tmp.489 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.488
	%tmp.490 = call %Lambda*(%Lambda*, %String*) %tmp.489( %Lambda* %tmp.484, %String* @String.19 )
	%tmp.491 = load i32, i32* %tmp.452
	%tmp.492 = load %Lambda*, %Lambda** %tmp.451
	%tmp.493 = icmp eq %Lambda* %tmp.492, null
	br i1 %tmp.493, label %abort, label %ok.19

ok.19:
	%tmp.494 = getelementptr %Lambda, %Lambda* %tmp.492, i32 0, i32 0
	%tmp.495 = load %Lambda_vtable*, %Lambda_vtable** %tmp.494
	%tmp.496 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.495, i32 0, i32 8
	%tmp.497 = load %Lambda* (%Lambda*,i32) *, %Lambda* (%Lambda*,i32) ** %tmp.496
	%tmp.498 = call %Lambda*(%Lambda*, i32) %tmp.497( %Lambda* %tmp.492, i32 %tmp.491 )
	%tmp.499 = load %Lambda*, %Lambda** %tmp.451
	%tmp.500 = icmp eq %Lambda* %tmp.499, null
	br i1 %tmp.500, label %abort, label %ok.20

ok.20:
	%tmp.501 = getelementptr %Lambda, %Lambda* %tmp.499, i32 0, i32 0
	%tmp.502 = load %Lambda_vtable*, %Lambda_vtable** %tmp.501
	%tmp.503 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.502, i32 0, i32 7
	%tmp.504 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.503
	%tmp.505 = call %Lambda*(%Lambda*, %String*) %tmp.504( %Lambda* %tmp.499, %String* @String.20 )
	%tmp.506 = load %Lambda*, %Lambda** %tmp.451
	%tmp.507 = icmp eq %Lambda* %tmp.506, null
	br i1 %tmp.507, label %abort, label %ok.21

ok.21:
	%tmp.508 = getelementptr %Lambda, %Lambda* %tmp.506, i32 0, i32 0
	%tmp.509 = load %Lambda_vtable*, %Lambda_vtable** %tmp.508
	%tmp.510 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.509, i32 0, i32 7
	%tmp.511 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.510
	%tmp.512 = call %Lambda*(%Lambda*, %String*) %tmp.511( %Lambda* %tmp.506, %String* @String.21 )
	%tmp.513 = load %Lambda*, %Lambda** %tmp.451
	%tmp.514 = getelementptr %Lambda, %Lambda* %tmp.513, i32 0, i32 1
	%tmp.515 = load %Variable*, %Variable** %tmp.514
	%tmp.516 = load %VarList*, %VarList** %tmp.453
	%tmp.517 = icmp eq %VarList* %tmp.516, null
	br i1 %tmp.517, label %abort, label %ok.22

ok.22:
	%tmp.518 = getelementptr %VarList, %VarList* %tmp.516, i32 0, i32 0
	%tmp.519 = load %VarList_vtable*, %VarList_vtable** %tmp.518
	%tmp.520 = getelementptr %VarList_vtable, %VarList_vtable* %tmp.519, i32 0, i32 14
	%tmp.521 = load %VarList* (%VarList*,%Variable*) *, %VarList* (%VarList*,%Variable*) ** %tmp.520
	%tmp.522 = call %VarList*(%VarList*, %Variable*) %tmp.521( %VarList* %tmp.516, %Variable* %tmp.515 )
	%tmp.523 = load %LambdaListRef*, %LambdaListRef** %tmp.454
	%tmp.524 = load %Lambda*, %Lambda** %tmp.451
	%tmp.525 = getelementptr %Lambda, %Lambda* %tmp.524, i32 0, i32 2
	%tmp.526 = load %Expr*, %Expr** %tmp.525
	%tmp.527 = icmp eq %Expr* %tmp.526, null
	br i1 %tmp.527, label %abort, label %ok.23

ok.23:
	%tmp.528 = getelementptr %Expr, %Expr* %tmp.526, i32 0, i32 0
	%tmp.529 = load %Expr_vtable*, %Expr_vtable** %tmp.528
	%tmp.530 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.529, i32 0, i32 14
	%tmp.531 = load %Expr* (%Expr*,%VarList*,%LambdaListRef*) *, %Expr* (%Expr*,%VarList*,%LambdaListRef*) ** %tmp.530
	%tmp.532 = call %Expr*(%Expr*, %VarList*, %LambdaListRef*) %tmp.531( %Expr* %tmp.526, %VarList* %tmp.522, %LambdaListRef* %tmp.523 )
	%tmp.533 = load %Lambda*, %Lambda** %tmp.451
	%tmp.534 = icmp eq %Lambda* %tmp.533, null
	br i1 %tmp.534, label %abort, label %ok.24

ok.24:
	%tmp.535 = getelementptr %Lambda, %Lambda* %tmp.533, i32 0, i32 0
	%tmp.536 = load %Lambda_vtable*, %Lambda_vtable** %tmp.535
	%tmp.537 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.536, i32 0, i32 7
	%tmp.538 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.537
	%tmp.539 = call %Lambda*(%Lambda*, %String*) %tmp.538( %Lambda* %tmp.533, %String* @String.22 )
	%tmp.540 = load %Lambda*, %Lambda** %tmp.451
	%tmp.541 = icmp eq %Lambda* %tmp.540, null
	br i1 %tmp.541, label %abort, label %ok.25

ok.25:
	%tmp.542 = getelementptr %Lambda, %Lambda* %tmp.540, i32 0, i32 0
	%tmp.543 = load %Lambda_vtable*, %Lambda_vtable** %tmp.542
	%tmp.544 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.543, i32 0, i32 7
	%tmp.545 = load %Lambda* (%Lambda*,%String*) *, %Lambda* (%Lambda*,%String*) ** %tmp.544
	%tmp.546 = call %Lambda*(%Lambda*, %String*) %tmp.545( %Lambda* %tmp.540, %String* @String.23 )
	ret %Lambda* %tmp.546

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Lambda_new() {

entry:
	%tmp.547 = getelementptr %Lambda_vtable, %Lambda_vtable* @Lambda_vtable_prototype, i32 0, i32 1
	%tmp.548 = load i32, i32* %tmp.547
	%tmp.549 = call i8*(i32) @malloc( i32 %tmp.548 )
	%tmp.550 = bitcast i8* %tmp.549 to %Lambda*
	%tmp.551 = getelementptr %Lambda, %Lambda* %tmp.550, i32 0, i32 0
	store %Lambda_vtable* @Lambda_vtable_prototype, %Lambda_vtable** %tmp.551
	%tmp.552 = alloca %Lambda*
	store %Lambda* %tmp.550, %Lambda** %tmp.552
	%tmp.553 = getelementptr %Lambda, %Lambda* %tmp.550, i32 0, i32 1
	store %Variable* null, %Variable** %tmp.553
	%tmp.554 = getelementptr %Lambda, %Lambda* %tmp.550, i32 0, i32 2
	store %Expr* null, %Expr** %tmp.554
	ret %Lambda* %tmp.550

abort:
	call void @abort(  )
	unreachable
}

define %App* @App_init(%App* %self, %Expr* %f, %Expr* %a) {

entry:
	%tmp.555 = alloca %App*
	store %App* %self, %App** %tmp.555
	%tmp.556 = alloca %Expr*
	store %Expr* %f, %Expr** %tmp.556
	%tmp.557 = alloca %Expr*
	store %Expr* %a, %Expr** %tmp.557
	%tmp.558 = load %Expr*, %Expr** %tmp.556
	%tmp.559 = load %App*, %App** %tmp.555
	%tmp.560 = getelementptr %App, %App* %tmp.559, i32 0, i32 1
	store %Expr* %tmp.558, %Expr** %tmp.560
	%tmp.561 = load %Expr*, %Expr** %tmp.557
	%tmp.562 = load %App*, %App** %tmp.555
	%tmp.563 = getelementptr %App, %App* %tmp.562, i32 0, i32 2
	store %Expr* %tmp.561, %Expr** %tmp.563
	%tmp.564 = load %App*, %App** %tmp.555
	ret %App* %tmp.564

abort:
	call void @abort(  )
	unreachable
}

define %App* @App_print_self(%App* %self) {

entry:
	%tmp.565 = alloca %App*
	store %App* %self, %App** %tmp.565
	%tmp.566 = load %App*, %App** %tmp.565
	%tmp.567 = icmp eq %App* %tmp.566, null
	br i1 %tmp.567, label %abort, label %ok.0

ok.0:
	%tmp.568 = getelementptr %App, %App* %tmp.566, i32 0, i32 0
	%tmp.569 = load %App_vtable*, %App_vtable** %tmp.568
	%tmp.570 = getelementptr %App_vtable, %App_vtable* %tmp.569, i32 0, i32 7
	%tmp.571 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.570
	%tmp.572 = call %App*(%App*, %String*) %tmp.571( %App* %tmp.566, %String* @String.24 )
	%tmp.573 = load %App*, %App** %tmp.565
	%tmp.574 = getelementptr %App, %App* %tmp.573, i32 0, i32 1
	%tmp.575 = load %Expr*, %Expr** %tmp.574
	%tmp.576 = icmp eq %Expr* %tmp.575, null
	br i1 %tmp.576, label %abort, label %ok.1

ok.1:
	%tmp.577 = getelementptr %Expr, %Expr* %tmp.575, i32 0, i32 0
	%tmp.578 = load %Expr_vtable*, %Expr_vtable** %tmp.577
	%tmp.579 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.578, i32 0, i32 11
	%tmp.580 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.579
	%tmp.581 = call %Expr*(%Expr*) %tmp.580( %Expr* %tmp.575 )
	%tmp.582 = load %App*, %App** %tmp.565
	%tmp.583 = icmp eq %App* %tmp.582, null
	br i1 %tmp.583, label %abort, label %ok.2

ok.2:
	%tmp.584 = getelementptr %App, %App* %tmp.582, i32 0, i32 0
	%tmp.585 = load %App_vtable*, %App_vtable** %tmp.584
	%tmp.586 = getelementptr %App_vtable, %App_vtable* %tmp.585, i32 0, i32 7
	%tmp.587 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.586
	%tmp.588 = call %App*(%App*, %String*) %tmp.587( %App* %tmp.582, %String* @String.25 )
	%tmp.589 = load %App*, %App** %tmp.565
	%tmp.590 = getelementptr %App, %App* %tmp.589, i32 0, i32 2
	%tmp.591 = load %Expr*, %Expr** %tmp.590
	%tmp.592 = icmp eq %Expr* %tmp.591, null
	br i1 %tmp.592, label %abort, label %ok.3

ok.3:
	%tmp.593 = getelementptr %Expr, %Expr* %tmp.591, i32 0, i32 0
	%tmp.594 = load %Expr_vtable*, %Expr_vtable** %tmp.593
	%tmp.595 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.594, i32 0, i32 11
	%tmp.596 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.595
	%tmp.597 = call %Expr*(%Expr*) %tmp.596( %Expr* %tmp.591 )
	%tmp.598 = load %App*, %App** %tmp.565
	%tmp.599 = icmp eq %App* %tmp.598, null
	br i1 %tmp.599, label %abort, label %ok.4

ok.4:
	%tmp.600 = getelementptr %App, %App* %tmp.598, i32 0, i32 0
	%tmp.601 = load %App_vtable*, %App_vtable** %tmp.600
	%tmp.602 = getelementptr %App_vtable, %App_vtable* %tmp.601, i32 0, i32 7
	%tmp.603 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.602
	%tmp.604 = call %App*(%App*, %String*) %tmp.603( %App* %tmp.598, %String* @String.26 )
	%tmp.605 = load %App*, %App** %tmp.565
	ret %App* %tmp.605

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @App_beta(%App* %self) {

entry:
	%tmp.606 = alloca %App*
	store %App* %self, %App** %tmp.606
	%tmp.607 = load %App*, %App** %tmp.606
	%tmp.608 = getelementptr %App, %App* %tmp.607, i32 0, i32 1
	%tmp.609 = load %Expr*, %Expr** %tmp.608
	%vtpm.0 = icmp eq %Expr* %tmp.609, null
	br i1 %vtpm.0, label %abort, label %ok.5

ok.5:
	%tmp.610 = getelementptr %Expr, %Expr* %tmp.609, i32 0, i32 0
	%tmp.611 = load %Expr_vtable*, %Expr_vtable** %tmp.610
	%tmp.612 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.611, i32 0, i32 0
	%tmp.613 = load i32, i32* %tmp.612
	br label %case.hdr.0

case.hdr.0:
	%vtpm.1 = alloca %Expr*
	br label %case.9.0

case.9.0:
	%tmp.614 = icmp slt i32 %tmp.613, 9
	br i1 %tmp.614, label %br_exit.9.0, label %src_gte_br.9.0

src_gte_br.9.0:
	%tmp.615 = icmp sgt i32 %tmp.613, 9
	br i1 %tmp.615, label %br_exit.9.0, label %src_lte_mc.9.0

src_lte_mc.9.0:
	%tmp.616 = alloca %Lambda*
	%tmp.617 = bitcast %Expr* %tmp.609 to %Lambda*
	store %Lambda* %tmp.617, %Lambda** %tmp.616
	%tmp.618 = load %App*, %App** %tmp.606
	%tmp.619 = getelementptr %App, %App* %tmp.618, i32 0, i32 2
	%tmp.620 = load %Expr*, %Expr** %tmp.619
	%tmp.621 = load %Lambda*, %Lambda** %tmp.616
	%tmp.622 = icmp eq %Lambda* %tmp.621, null
	br i1 %tmp.622, label %abort, label %ok.6

ok.6:
	%tmp.623 = getelementptr %Lambda, %Lambda* %tmp.621, i32 0, i32 0
	%tmp.624 = load %Lambda_vtable*, %Lambda_vtable** %tmp.623
	%tmp.625 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.624, i32 0, i32 16
	%tmp.626 = load %Expr* (%Lambda*,%Expr*) *, %Expr* (%Lambda*,%Expr*) ** %tmp.625
	%tmp.627 = call %Expr*(%Lambda*, %Expr*) %tmp.626( %Lambda* %tmp.621, %Expr* %tmp.620 )
	store %Expr* %tmp.627, %Expr** %vtpm.1
	br label %case.exit.0

br_exit.9.0:
	br label %case.7.0

case.7.0:
	%tmp.628 = icmp slt i32 %tmp.613, 7
	br i1 %tmp.628, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%tmp.629 = icmp sgt i32 %tmp.613, 10
	br i1 %tmp.629, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%tmp.630 = alloca %Expr*
	store %Expr* %tmp.609, %Expr** %tmp.630
	%tmp.631 = load %App*, %App** %tmp.606
	%tmp.632 = getelementptr %App, %App* %tmp.631, i32 0, i32 1
	%tmp.633 = load %Expr*, %Expr** %tmp.632
	%tmp.634 = icmp eq %Expr* %tmp.633, null
	br i1 %tmp.634, label %abort, label %ok.7

ok.7:
	%tmp.635 = getelementptr %Expr, %Expr* %tmp.633, i32 0, i32 0
	%tmp.636 = load %Expr_vtable*, %Expr_vtable** %tmp.635
	%tmp.637 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.636, i32 0, i32 12
	%tmp.638 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.637
	%tmp.639 = call %Expr*(%Expr*) %tmp.638( %Expr* %tmp.633 )
	%tmp.640 = alloca %Expr*
	store %Expr* %tmp.639, %Expr** %tmp.640
	%tmp.641 = call %App* @App_new(  )
	%tmp.642 = alloca %App*
	store %App* %tmp.641, %App** %tmp.642
	%tmp.643 = load %Expr*, %Expr** %tmp.640
	%tmp.644 = load %App*, %App** %tmp.606
	%tmp.645 = getelementptr %App, %App* %tmp.644, i32 0, i32 2
	%tmp.646 = load %Expr*, %Expr** %tmp.645
	%tmp.647 = load %App*, %App** %tmp.642
	%tmp.648 = icmp eq %App* %tmp.647, null
	br i1 %tmp.648, label %abort, label %ok.8

ok.8:
	%tmp.649 = getelementptr %App, %App* %tmp.647, i32 0, i32 0
	%tmp.650 = load %App_vtable*, %App_vtable** %tmp.649
	%tmp.651 = getelementptr %App_vtable, %App_vtable* %tmp.650, i32 0, i32 15
	%tmp.652 = load %App* (%App*,%Expr*,%Expr*) *, %App* (%App*,%Expr*,%Expr*) ** %tmp.651
	%tmp.653 = call %App*(%App*, %Expr*, %Expr*) %tmp.652( %App* %tmp.647, %Expr* %tmp.643, %Expr* %tmp.646 )
	%tmp.654 = bitcast %App* %tmp.653 to %Expr*
	store %Expr* %tmp.654, %Expr** %vtpm.1
	br label %case.exit.0

br_exit.7.0:
	br label %abort

case.exit.0:
	%vtpm.2 = load %Expr*, %Expr** %vtpm.1
	ret %Expr* %vtpm.2

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @App_substitute(%App* %self, %Variable* %x, %Expr* %e) {

entry:
	%tmp.655 = alloca %App*
	store %App* %self, %App** %tmp.655
	%tmp.656 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.656
	%tmp.657 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.657
	%tmp.658 = load %Variable*, %Variable** %tmp.656
	%tmp.659 = load %Expr*, %Expr** %tmp.657
	%tmp.660 = load %App*, %App** %tmp.655
	%tmp.661 = getelementptr %App, %App* %tmp.660, i32 0, i32 1
	%tmp.662 = load %Expr*, %Expr** %tmp.661
	%tmp.663 = icmp eq %Expr* %tmp.662, null
	br i1 %tmp.663, label %abort, label %ok.9

ok.9:
	%tmp.664 = getelementptr %Expr, %Expr* %tmp.662, i32 0, i32 0
	%tmp.665 = load %Expr_vtable*, %Expr_vtable** %tmp.664
	%tmp.666 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.665, i32 0, i32 13
	%tmp.667 = load %Expr* (%Expr*,%Variable*,%Expr*) *, %Expr* (%Expr*,%Variable*,%Expr*) ** %tmp.666
	%tmp.668 = call %Expr*(%Expr*, %Variable*, %Expr*) %tmp.667( %Expr* %tmp.662, %Variable* %tmp.658, %Expr* %tmp.659 )
	%tmp.669 = alloca %Expr*
	store %Expr* %tmp.668, %Expr** %tmp.669
	%tmp.670 = load %Variable*, %Variable** %tmp.656
	%tmp.671 = load %Expr*, %Expr** %tmp.657
	%tmp.672 = load %App*, %App** %tmp.655
	%tmp.673 = getelementptr %App, %App* %tmp.672, i32 0, i32 2
	%tmp.674 = load %Expr*, %Expr** %tmp.673
	%tmp.675 = icmp eq %Expr* %tmp.674, null
	br i1 %tmp.675, label %abort, label %ok.10

ok.10:
	%tmp.676 = getelementptr %Expr, %Expr* %tmp.674, i32 0, i32 0
	%tmp.677 = load %Expr_vtable*, %Expr_vtable** %tmp.676
	%tmp.678 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.677, i32 0, i32 13
	%tmp.679 = load %Expr* (%Expr*,%Variable*,%Expr*) *, %Expr* (%Expr*,%Variable*,%Expr*) ** %tmp.678
	%tmp.680 = call %Expr*(%Expr*, %Variable*, %Expr*) %tmp.679( %Expr* %tmp.674, %Variable* %tmp.670, %Expr* %tmp.671 )
	%tmp.681 = alloca %Expr*
	store %Expr* %tmp.680, %Expr** %tmp.681
	%tmp.682 = call %App* @App_new(  )
	%tmp.683 = alloca %App*
	store %App* %tmp.682, %App** %tmp.683
	%tmp.684 = load %Expr*, %Expr** %tmp.669
	%tmp.685 = load %Expr*, %Expr** %tmp.681
	%tmp.686 = load %App*, %App** %tmp.683
	%tmp.687 = icmp eq %App* %tmp.686, null
	br i1 %tmp.687, label %abort, label %ok.11

ok.11:
	%tmp.688 = getelementptr %App, %App* %tmp.686, i32 0, i32 0
	%tmp.689 = load %App_vtable*, %App_vtable** %tmp.688
	%tmp.690 = getelementptr %App_vtable, %App_vtable* %tmp.689, i32 0, i32 15
	%tmp.691 = load %App* (%App*,%Expr*,%Expr*) *, %App* (%App*,%Expr*,%Expr*) ** %tmp.690
	%tmp.692 = call %App*(%App*, %Expr*, %Expr*) %tmp.691( %App* %tmp.686, %Expr* %tmp.684, %Expr* %tmp.685 )
	%tmp.693 = bitcast %App* %tmp.692 to %Expr*
	ret %Expr* %tmp.693

abort:
	call void @abort(  )
	unreachable
}

define %App* @App_gen_code(%App* %self, %VarList* %env, %LambdaListRef* %closures) {

entry:
	%tmp.694 = alloca %App*
	store %App* %self, %App** %tmp.694
	%tmp.695 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.695
	%tmp.696 = alloca %LambdaListRef*
	store %LambdaListRef* %closures, %LambdaListRef** %tmp.696
	%tmp.697 = load %App*, %App** %tmp.694
	%tmp.698 = icmp eq %App* %tmp.697, null
	br i1 %tmp.698, label %abort, label %ok.12

ok.12:
	%tmp.699 = getelementptr %App, %App* %tmp.697, i32 0, i32 0
	%tmp.700 = load %App_vtable*, %App_vtable** %tmp.699
	%tmp.701 = getelementptr %App_vtable, %App_vtable* %tmp.700, i32 0, i32 7
	%tmp.702 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.701
	%tmp.703 = call %App*(%App*, %String*) %tmp.702( %App* %tmp.697, %String* @String.27 )
	%tmp.704 = load %VarList*, %VarList** %tmp.695
	%tmp.705 = load %LambdaListRef*, %LambdaListRef** %tmp.696
	%tmp.706 = load %App*, %App** %tmp.694
	%tmp.707 = getelementptr %App, %App* %tmp.706, i32 0, i32 1
	%tmp.708 = load %Expr*, %Expr** %tmp.707
	%tmp.709 = icmp eq %Expr* %tmp.708, null
	br i1 %tmp.709, label %abort, label %ok.13

ok.13:
	%tmp.710 = getelementptr %Expr, %Expr* %tmp.708, i32 0, i32 0
	%tmp.711 = load %Expr_vtable*, %Expr_vtable** %tmp.710
	%tmp.712 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.711, i32 0, i32 14
	%tmp.713 = load %Expr* (%Expr*,%VarList*,%LambdaListRef*) *, %Expr* (%Expr*,%VarList*,%LambdaListRef*) ** %tmp.712
	%tmp.714 = call %Expr*(%Expr*, %VarList*, %LambdaListRef*) %tmp.713( %Expr* %tmp.708, %VarList* %tmp.704, %LambdaListRef* %tmp.705 )
	%tmp.715 = load %App*, %App** %tmp.694
	%tmp.716 = icmp eq %App* %tmp.715, null
	br i1 %tmp.716, label %abort, label %ok.14

ok.14:
	%tmp.717 = getelementptr %App, %App* %tmp.715, i32 0, i32 0
	%tmp.718 = load %App_vtable*, %App_vtable** %tmp.717
	%tmp.719 = getelementptr %App_vtable, %App_vtable* %tmp.718, i32 0, i32 7
	%tmp.720 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.719
	%tmp.721 = call %App*(%App*, %String*) %tmp.720( %App* %tmp.715, %String* @String.28 )
	%tmp.722 = load %App*, %App** %tmp.694
	%tmp.723 = icmp eq %App* %tmp.722, null
	br i1 %tmp.723, label %abort, label %ok.15

ok.15:
	%tmp.724 = getelementptr %App, %App* %tmp.722, i32 0, i32 0
	%tmp.725 = load %App_vtable*, %App_vtable** %tmp.724
	%tmp.726 = getelementptr %App_vtable, %App_vtable* %tmp.725, i32 0, i32 7
	%tmp.727 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.726
	%tmp.728 = call %App*(%App*, %String*) %tmp.727( %App* %tmp.722, %String* @String.29 )
	%tmp.729 = load %VarList*, %VarList** %tmp.695
	%tmp.730 = load %LambdaListRef*, %LambdaListRef** %tmp.696
	%tmp.731 = load %App*, %App** %tmp.694
	%tmp.732 = getelementptr %App, %App* %tmp.731, i32 0, i32 2
	%tmp.733 = load %Expr*, %Expr** %tmp.732
	%tmp.734 = icmp eq %Expr* %tmp.733, null
	br i1 %tmp.734, label %abort, label %ok.16

ok.16:
	%tmp.735 = getelementptr %Expr, %Expr* %tmp.733, i32 0, i32 0
	%tmp.736 = load %Expr_vtable*, %Expr_vtable** %tmp.735
	%tmp.737 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.736, i32 0, i32 14
	%tmp.738 = load %Expr* (%Expr*,%VarList*,%LambdaListRef*) *, %Expr* (%Expr*,%VarList*,%LambdaListRef*) ** %tmp.737
	%tmp.739 = call %Expr*(%Expr*, %VarList*, %LambdaListRef*) %tmp.738( %Expr* %tmp.733, %VarList* %tmp.729, %LambdaListRef* %tmp.730 )
	%tmp.740 = load %App*, %App** %tmp.694
	%tmp.741 = icmp eq %App* %tmp.740, null
	br i1 %tmp.741, label %abort, label %ok.17

ok.17:
	%tmp.742 = getelementptr %App, %App* %tmp.740, i32 0, i32 0
	%tmp.743 = load %App_vtable*, %App_vtable** %tmp.742
	%tmp.744 = getelementptr %App_vtable, %App_vtable* %tmp.743, i32 0, i32 7
	%tmp.745 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.744
	%tmp.746 = call %App*(%App*, %String*) %tmp.745( %App* %tmp.740, %String* @String.30 )
	%tmp.747 = load %App*, %App** %tmp.694
	%tmp.748 = icmp eq %App* %tmp.747, null
	br i1 %tmp.748, label %abort, label %ok.18

ok.18:
	%tmp.749 = getelementptr %App, %App* %tmp.747, i32 0, i32 0
	%tmp.750 = load %App_vtable*, %App_vtable** %tmp.749
	%tmp.751 = getelementptr %App_vtable, %App_vtable* %tmp.750, i32 0, i32 7
	%tmp.752 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.751
	%tmp.753 = call %App*(%App*, %String*) %tmp.752( %App* %tmp.747, %String* @String.31 )
	%tmp.754 = load %App*, %App** %tmp.694
	%tmp.755 = icmp eq %App* %tmp.754, null
	br i1 %tmp.755, label %abort, label %ok.19

ok.19:
	%tmp.756 = getelementptr %App, %App* %tmp.754, i32 0, i32 0
	%tmp.757 = load %App_vtable*, %App_vtable** %tmp.756
	%tmp.758 = getelementptr %App_vtable, %App_vtable* %tmp.757, i32 0, i32 7
	%tmp.759 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.758
	%tmp.760 = call %App*(%App*, %String*) %tmp.759( %App* %tmp.754, %String* @String.32 )
	%tmp.761 = load %App*, %App** %tmp.694
	%tmp.762 = icmp eq %App* %tmp.761, null
	br i1 %tmp.762, label %abort, label %ok.20

ok.20:
	%tmp.763 = getelementptr %App, %App* %tmp.761, i32 0, i32 0
	%tmp.764 = load %App_vtable*, %App_vtable** %tmp.763
	%tmp.765 = getelementptr %App_vtable, %App_vtable* %tmp.764, i32 0, i32 7
	%tmp.766 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.765
	%tmp.767 = call %App*(%App*, %String*) %tmp.766( %App* %tmp.761, %String* @String.33 )
	%tmp.768 = load %App*, %App** %tmp.694
	%tmp.769 = icmp eq %App* %tmp.768, null
	br i1 %tmp.769, label %abort, label %ok.21

ok.21:
	%tmp.770 = getelementptr %App, %App* %tmp.768, i32 0, i32 0
	%tmp.771 = load %App_vtable*, %App_vtable** %tmp.770
	%tmp.772 = getelementptr %App_vtable, %App_vtable* %tmp.771, i32 0, i32 7
	%tmp.773 = load %App* (%App*,%String*) *, %App* (%App*,%String*) ** %tmp.772
	%tmp.774 = call %App*(%App*, %String*) %tmp.773( %App* %tmp.768, %String* @String.34 )
	ret %App* %tmp.774

abort:
	call void @abort(  )
	unreachable
}

define %App* @App_new() {

entry:
	%tmp.775 = getelementptr %App_vtable, %App_vtable* @App_vtable_prototype, i32 0, i32 1
	%tmp.776 = load i32, i32* %tmp.775
	%tmp.777 = call i8*(i32) @malloc( i32 %tmp.776 )
	%tmp.778 = bitcast i8* %tmp.777 to %App*
	%tmp.779 = getelementptr %App, %App* %tmp.778, i32 0, i32 0
	store %App_vtable* @App_vtable_prototype, %App_vtable** %tmp.779
	%tmp.780 = alloca %App*
	store %App* %tmp.778, %App** %tmp.780
	%tmp.781 = getelementptr %App, %App* %tmp.778, i32 0, i32 1
	store %Expr* null, %Expr** %tmp.781
	%tmp.782 = getelementptr %App, %App* %tmp.778, i32 0, i32 2
	store %Expr* null, %Expr** %tmp.782
	ret %App* %tmp.778

abort:
	call void @abort(  )
	unreachable
}

define %Variable* @Term_var(%Term* %self, %String* %x) {

entry:
	%tmp.783 = alloca %Term*
	store %Term* %self, %Term** %tmp.783
	%tmp.784 = alloca %String*
	store %String* %x, %String** %tmp.784
	%tmp.785 = call %Variable* @Variable_new(  )
	%tmp.786 = alloca %Variable*
	store %Variable* %tmp.785, %Variable** %tmp.786
	%tmp.787 = load %String*, %String** %tmp.784
	%tmp.788 = load %Variable*, %Variable** %tmp.786
	%tmp.789 = icmp eq %Variable* %tmp.788, null
	br i1 %tmp.789, label %abort, label %ok.0

ok.0:
	%tmp.790 = getelementptr %Variable, %Variable* %tmp.788, i32 0, i32 0
	%tmp.791 = load %Variable_vtable*, %Variable_vtable** %tmp.790
	%tmp.792 = getelementptr %Variable_vtable, %Variable_vtable* %tmp.791, i32 0, i32 15
	%tmp.793 = load %Variable* (%Variable*,%String*) *, %Variable* (%Variable*,%String*) ** %tmp.792
	%tmp.794 = call %Variable*(%Variable*, %String*) %tmp.793( %Variable* %tmp.788, %String* %tmp.787 )
	ret %Variable* %tmp.794

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @Term_lam(%Term* %self, %Variable* %x, %Expr* %e) {

entry:
	%tmp.795 = alloca %Term*
	store %Term* %self, %Term** %tmp.795
	%tmp.796 = alloca %Variable*
	store %Variable* %x, %Variable** %tmp.796
	%tmp.797 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.797
	%tmp.798 = call %Lambda* @Lambda_new(  )
	%tmp.799 = alloca %Lambda*
	store %Lambda* %tmp.798, %Lambda** %tmp.799
	%tmp.800 = load %Variable*, %Variable** %tmp.796
	%tmp.801 = load %Expr*, %Expr** %tmp.797
	%tmp.802 = load %Lambda*, %Lambda** %tmp.799
	%tmp.803 = icmp eq %Lambda* %tmp.802, null
	br i1 %tmp.803, label %abort, label %ok.1

ok.1:
	%tmp.804 = getelementptr %Lambda, %Lambda* %tmp.802, i32 0, i32 0
	%tmp.805 = load %Lambda_vtable*, %Lambda_vtable** %tmp.804
	%tmp.806 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.805, i32 0, i32 15
	%tmp.807 = load %Lambda* (%Lambda*,%Variable*,%Expr*) *, %Lambda* (%Lambda*,%Variable*,%Expr*) ** %tmp.806
	%tmp.808 = call %Lambda*(%Lambda*, %Variable*, %Expr*) %tmp.807( %Lambda* %tmp.802, %Variable* %tmp.800, %Expr* %tmp.801 )
	ret %Lambda* %tmp.808

abort:
	call void @abort(  )
	unreachable
}

define %App* @Term_app(%Term* %self, %Expr* %e1, %Expr* %e2) {

entry:
	%tmp.809 = alloca %Term*
	store %Term* %self, %Term** %tmp.809
	%tmp.810 = alloca %Expr*
	store %Expr* %e1, %Expr** %tmp.810
	%tmp.811 = alloca %Expr*
	store %Expr* %e2, %Expr** %tmp.811
	%tmp.812 = call %App* @App_new(  )
	%tmp.813 = alloca %App*
	store %App* %tmp.812, %App** %tmp.813
	%tmp.814 = load %Expr*, %Expr** %tmp.810
	%tmp.815 = load %Expr*, %Expr** %tmp.811
	%tmp.816 = load %App*, %App** %tmp.813
	%tmp.817 = icmp eq %App* %tmp.816, null
	br i1 %tmp.817, label %abort, label %ok.2

ok.2:
	%tmp.818 = getelementptr %App, %App* %tmp.816, i32 0, i32 0
	%tmp.819 = load %App_vtable*, %App_vtable** %tmp.818
	%tmp.820 = getelementptr %App_vtable, %App_vtable* %tmp.819, i32 0, i32 15
	%tmp.821 = load %App* (%App*,%Expr*,%Expr*) *, %App* (%App*,%Expr*,%Expr*) ** %tmp.820
	%tmp.822 = call %App*(%App*, %Expr*, %Expr*) %tmp.821( %App* %tmp.816, %Expr* %tmp.814, %Expr* %tmp.815 )
	ret %App* %tmp.822

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Term_i(%Term* %self) {

entry:
	%tmp.823 = alloca %Term*
	store %Term* %self, %Term** %tmp.823
	%tmp.824 = load %Term*, %Term** %tmp.823
	%tmp.825 = icmp eq %Term* %tmp.824, null
	br i1 %tmp.825, label %abort, label %ok.3

ok.3:
	%tmp.826 = getelementptr %Term, %Term* %tmp.824, i32 0, i32 0
	%tmp.827 = load %Term_vtable*, %Term_vtable** %tmp.826
	%tmp.828 = getelementptr %Term_vtable, %Term_vtable* %tmp.827, i32 0, i32 11
	%tmp.829 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.828
	%tmp.830 = call %Variable*(%Term*, %String*) %tmp.829( %Term* %tmp.824, %String* @String.35 )
	%tmp.831 = alloca %Variable*
	store %Variable* %tmp.830, %Variable** %tmp.831
	%tmp.832 = load %Variable*, %Variable** %tmp.831
	%tmp.833 = load %Variable*, %Variable** %tmp.831
	%tmp.834 = load %Term*, %Term** %tmp.823
	%tmp.835 = icmp eq %Term* %tmp.834, null
	br i1 %tmp.835, label %abort, label %ok.4

ok.4:
	%tmp.836 = getelementptr %Term, %Term* %tmp.834, i32 0, i32 0
	%tmp.837 = load %Term_vtable*, %Term_vtable** %tmp.836
	%tmp.838 = getelementptr %Term_vtable, %Term_vtable* %tmp.837, i32 0, i32 12
	%tmp.839 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.838
	%tmp.840 = bitcast %Variable* %tmp.833 to %Expr*
	%tmp.841 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.839( %Term* %tmp.834, %Variable* %tmp.832, %Expr* %tmp.840 )
	%tmp.842 = bitcast %Lambda* %tmp.841 to %Expr*
	ret %Expr* %tmp.842

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Term_k(%Term* %self) {

entry:
	%tmp.843 = alloca %Term*
	store %Term* %self, %Term** %tmp.843
	%tmp.844 = load %Term*, %Term** %tmp.843
	%tmp.845 = icmp eq %Term* %tmp.844, null
	br i1 %tmp.845, label %abort, label %ok.5

ok.5:
	%tmp.846 = getelementptr %Term, %Term* %tmp.844, i32 0, i32 0
	%tmp.847 = load %Term_vtable*, %Term_vtable** %tmp.846
	%tmp.848 = getelementptr %Term_vtable, %Term_vtable* %tmp.847, i32 0, i32 11
	%tmp.849 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.848
	%tmp.850 = call %Variable*(%Term*, %String*) %tmp.849( %Term* %tmp.844, %String* @String.35 )
	%tmp.851 = alloca %Variable*
	store %Variable* %tmp.850, %Variable** %tmp.851
	%tmp.852 = load %Term*, %Term** %tmp.843
	%tmp.853 = icmp eq %Term* %tmp.852, null
	br i1 %tmp.853, label %abort, label %ok.6

ok.6:
	%tmp.854 = getelementptr %Term, %Term* %tmp.852, i32 0, i32 0
	%tmp.855 = load %Term_vtable*, %Term_vtable** %tmp.854
	%tmp.856 = getelementptr %Term_vtable, %Term_vtable* %tmp.855, i32 0, i32 11
	%tmp.857 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.856
	%tmp.858 = call %Variable*(%Term*, %String*) %tmp.857( %Term* %tmp.852, %String* @String.36 )
	%tmp.859 = alloca %Variable*
	store %Variable* %tmp.858, %Variable** %tmp.859
	%tmp.860 = load %Variable*, %Variable** %tmp.851
	%tmp.861 = load %Variable*, %Variable** %tmp.859
	%tmp.862 = load %Variable*, %Variable** %tmp.851
	%tmp.863 = load %Term*, %Term** %tmp.843
	%tmp.864 = icmp eq %Term* %tmp.863, null
	br i1 %tmp.864, label %abort, label %ok.7

ok.7:
	%tmp.865 = getelementptr %Term, %Term* %tmp.863, i32 0, i32 0
	%tmp.866 = load %Term_vtable*, %Term_vtable** %tmp.865
	%tmp.867 = getelementptr %Term_vtable, %Term_vtable* %tmp.866, i32 0, i32 12
	%tmp.868 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.867
	%tmp.869 = bitcast %Variable* %tmp.862 to %Expr*
	%tmp.870 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.868( %Term* %tmp.863, %Variable* %tmp.861, %Expr* %tmp.869 )
	%tmp.871 = load %Term*, %Term** %tmp.843
	%tmp.872 = icmp eq %Term* %tmp.871, null
	br i1 %tmp.872, label %abort, label %ok.8

ok.8:
	%tmp.873 = getelementptr %Term, %Term* %tmp.871, i32 0, i32 0
	%tmp.874 = load %Term_vtable*, %Term_vtable** %tmp.873
	%tmp.875 = getelementptr %Term_vtable, %Term_vtable* %tmp.874, i32 0, i32 12
	%tmp.876 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.875
	%tmp.877 = bitcast %Lambda* %tmp.870 to %Expr*
	%tmp.878 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.876( %Term* %tmp.871, %Variable* %tmp.860, %Expr* %tmp.877 )
	%tmp.879 = bitcast %Lambda* %tmp.878 to %Expr*
	ret %Expr* %tmp.879

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Term_s(%Term* %self) {

entry:
	%tmp.880 = alloca %Term*
	store %Term* %self, %Term** %tmp.880
	%tmp.881 = load %Term*, %Term** %tmp.880
	%tmp.882 = icmp eq %Term* %tmp.881, null
	br i1 %tmp.882, label %abort, label %ok.9

ok.9:
	%tmp.883 = getelementptr %Term, %Term* %tmp.881, i32 0, i32 0
	%tmp.884 = load %Term_vtable*, %Term_vtable** %tmp.883
	%tmp.885 = getelementptr %Term_vtable, %Term_vtable* %tmp.884, i32 0, i32 11
	%tmp.886 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.885
	%tmp.887 = call %Variable*(%Term*, %String*) %tmp.886( %Term* %tmp.881, %String* @String.35 )
	%tmp.888 = alloca %Variable*
	store %Variable* %tmp.887, %Variable** %tmp.888
	%tmp.889 = load %Term*, %Term** %tmp.880
	%tmp.890 = icmp eq %Term* %tmp.889, null
	br i1 %tmp.890, label %abort, label %ok.10

ok.10:
	%tmp.891 = getelementptr %Term, %Term* %tmp.889, i32 0, i32 0
	%tmp.892 = load %Term_vtable*, %Term_vtable** %tmp.891
	%tmp.893 = getelementptr %Term_vtable, %Term_vtable* %tmp.892, i32 0, i32 11
	%tmp.894 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.893
	%tmp.895 = call %Variable*(%Term*, %String*) %tmp.894( %Term* %tmp.889, %String* @String.36 )
	%tmp.896 = alloca %Variable*
	store %Variable* %tmp.895, %Variable** %tmp.896
	%tmp.897 = load %Term*, %Term** %tmp.880
	%tmp.898 = icmp eq %Term* %tmp.897, null
	br i1 %tmp.898, label %abort, label %ok.11

ok.11:
	%tmp.899 = getelementptr %Term, %Term* %tmp.897, i32 0, i32 0
	%tmp.900 = load %Term_vtable*, %Term_vtable** %tmp.899
	%tmp.901 = getelementptr %Term_vtable, %Term_vtable* %tmp.900, i32 0, i32 11
	%tmp.902 = load %Variable* (%Term*,%String*) *, %Variable* (%Term*,%String*) ** %tmp.901
	%tmp.903 = call %Variable*(%Term*, %String*) %tmp.902( %Term* %tmp.897, %String* @String.37 )
	%tmp.904 = alloca %Variable*
	store %Variable* %tmp.903, %Variable** %tmp.904
	%tmp.905 = load %Variable*, %Variable** %tmp.888
	%tmp.906 = load %Variable*, %Variable** %tmp.896
	%tmp.907 = load %Variable*, %Variable** %tmp.904
	%tmp.908 = load %Variable*, %Variable** %tmp.888
	%tmp.909 = load %Variable*, %Variable** %tmp.904
	%tmp.910 = load %Term*, %Term** %tmp.880
	%tmp.911 = icmp eq %Term* %tmp.910, null
	br i1 %tmp.911, label %abort, label %ok.12

ok.12:
	%tmp.912 = getelementptr %Term, %Term* %tmp.910, i32 0, i32 0
	%tmp.913 = load %Term_vtable*, %Term_vtable** %tmp.912
	%tmp.914 = getelementptr %Term_vtable, %Term_vtable* %tmp.913, i32 0, i32 13
	%tmp.915 = load %App* (%Term*,%Expr*,%Expr*) *, %App* (%Term*,%Expr*,%Expr*) ** %tmp.914
	%tmp.916 = bitcast %Variable* %tmp.908 to %Expr*
	%tmp.917 = bitcast %Variable* %tmp.909 to %Expr*
	%tmp.918 = call %App*(%Term*, %Expr*, %Expr*) %tmp.915( %Term* %tmp.910, %Expr* %tmp.916, %Expr* %tmp.917 )
	%tmp.919 = load %Variable*, %Variable** %tmp.896
	%tmp.920 = load %Variable*, %Variable** %tmp.904
	%tmp.921 = load %Term*, %Term** %tmp.880
	%tmp.922 = icmp eq %Term* %tmp.921, null
	br i1 %tmp.922, label %abort, label %ok.13

ok.13:
	%tmp.923 = getelementptr %Term, %Term* %tmp.921, i32 0, i32 0
	%tmp.924 = load %Term_vtable*, %Term_vtable** %tmp.923
	%tmp.925 = getelementptr %Term_vtable, %Term_vtable* %tmp.924, i32 0, i32 13
	%tmp.926 = load %App* (%Term*,%Expr*,%Expr*) *, %App* (%Term*,%Expr*,%Expr*) ** %tmp.925
	%tmp.927 = bitcast %Variable* %tmp.919 to %Expr*
	%tmp.928 = bitcast %Variable* %tmp.920 to %Expr*
	%tmp.929 = call %App*(%Term*, %Expr*, %Expr*) %tmp.926( %Term* %tmp.921, %Expr* %tmp.927, %Expr* %tmp.928 )
	%tmp.930 = load %Term*, %Term** %tmp.880
	%tmp.931 = icmp eq %Term* %tmp.930, null
	br i1 %tmp.931, label %abort, label %ok.14

ok.14:
	%tmp.932 = getelementptr %Term, %Term* %tmp.930, i32 0, i32 0
	%tmp.933 = load %Term_vtable*, %Term_vtable** %tmp.932
	%tmp.934 = getelementptr %Term_vtable, %Term_vtable* %tmp.933, i32 0, i32 13
	%tmp.935 = load %App* (%Term*,%Expr*,%Expr*) *, %App* (%Term*,%Expr*,%Expr*) ** %tmp.934
	%tmp.936 = bitcast %App* %tmp.918 to %Expr*
	%tmp.937 = bitcast %App* %tmp.929 to %Expr*
	%tmp.938 = call %App*(%Term*, %Expr*, %Expr*) %tmp.935( %Term* %tmp.930, %Expr* %tmp.936, %Expr* %tmp.937 )
	%tmp.939 = load %Term*, %Term** %tmp.880
	%tmp.940 = icmp eq %Term* %tmp.939, null
	br i1 %tmp.940, label %abort, label %ok.15

ok.15:
	%tmp.941 = getelementptr %Term, %Term* %tmp.939, i32 0, i32 0
	%tmp.942 = load %Term_vtable*, %Term_vtable** %tmp.941
	%tmp.943 = getelementptr %Term_vtable, %Term_vtable* %tmp.942, i32 0, i32 12
	%tmp.944 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.943
	%tmp.945 = bitcast %App* %tmp.938 to %Expr*
	%tmp.946 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.944( %Term* %tmp.939, %Variable* %tmp.907, %Expr* %tmp.945 )
	%tmp.947 = load %Term*, %Term** %tmp.880
	%tmp.948 = icmp eq %Term* %tmp.947, null
	br i1 %tmp.948, label %abort, label %ok.16

ok.16:
	%tmp.949 = getelementptr %Term, %Term* %tmp.947, i32 0, i32 0
	%tmp.950 = load %Term_vtable*, %Term_vtable** %tmp.949
	%tmp.951 = getelementptr %Term_vtable, %Term_vtable* %tmp.950, i32 0, i32 12
	%tmp.952 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.951
	%tmp.953 = bitcast %Lambda* %tmp.946 to %Expr*
	%tmp.954 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.952( %Term* %tmp.947, %Variable* %tmp.906, %Expr* %tmp.953 )
	%tmp.955 = load %Term*, %Term** %tmp.880
	%tmp.956 = icmp eq %Term* %tmp.955, null
	br i1 %tmp.956, label %abort, label %ok.17

ok.17:
	%tmp.957 = getelementptr %Term, %Term* %tmp.955, i32 0, i32 0
	%tmp.958 = load %Term_vtable*, %Term_vtable** %tmp.957
	%tmp.959 = getelementptr %Term_vtable, %Term_vtable* %tmp.958, i32 0, i32 12
	%tmp.960 = load %Lambda* (%Term*,%Variable*,%Expr*) *, %Lambda* (%Term*,%Variable*,%Expr*) ** %tmp.959
	%tmp.961 = bitcast %Lambda* %tmp.954 to %Expr*
	%tmp.962 = call %Lambda*(%Term*, %Variable*, %Expr*) %tmp.960( %Term* %tmp.955, %Variable* %tmp.905, %Expr* %tmp.961 )
	%tmp.963 = bitcast %Lambda* %tmp.962 to %Expr*
	ret %Expr* %tmp.963

abort:
	call void @abort(  )
	unreachable
}

define %Term* @Term_new() {

entry:
	%tmp.964 = getelementptr %Term_vtable, %Term_vtable* @Term_vtable_prototype, i32 0, i32 1
	%tmp.965 = load i32, i32* %tmp.964
	%tmp.966 = call i8*(i32) @malloc( i32 %tmp.965 )
	%tmp.967 = bitcast i8* %tmp.966 to %Term*
	%tmp.968 = getelementptr %Term, %Term* %tmp.967, i32 0, i32 0
	store %Term_vtable* @Term_vtable_prototype, %Term_vtable** %tmp.968
	%tmp.969 = alloca %Term*
	store %Term* %tmp.967, %Term** %tmp.969
	ret %Term* %tmp.967

abort:
	call void @abort(  )
	unreachable
}

define %Expr* @Main_beta_reduce(%Main* %self, %Expr* %e) {

entry:
	%tmp.970 = alloca %Main*
	store %Main* %self, %Main** %tmp.970
	%tmp.971 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.971
	%tmp.972 = load %Main*, %Main** %tmp.970
	%tmp.973 = icmp eq %Main* %tmp.972, null
	br i1 %tmp.973, label %abort, label %ok.0

ok.0:
	%tmp.974 = getelementptr %Main, %Main* %tmp.972, i32 0, i32 0
	%tmp.975 = load %Main_vtable*, %Main_vtable** %tmp.974
	%tmp.976 = getelementptr %Main_vtable, %Main_vtable* %tmp.975, i32 0, i32 7
	%tmp.977 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.976
	%tmp.978 = call %Main*(%Main*, %String*) %tmp.977( %Main* %tmp.972, %String* @String.38 )
	%tmp.979 = load %Expr*, %Expr** %tmp.971
	%tmp.980 = icmp eq %Expr* %tmp.979, null
	br i1 %tmp.980, label %abort, label %ok.1

ok.1:
	%tmp.981 = getelementptr %Expr, %Expr* %tmp.979, i32 0, i32 0
	%tmp.982 = load %Expr_vtable*, %Expr_vtable** %tmp.981
	%tmp.983 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.982, i32 0, i32 11
	%tmp.984 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.983
	%tmp.985 = call %Expr*(%Expr*) %tmp.984( %Expr* %tmp.979 )
	%tmp.986 = alloca i1
	store i1 false, i1* %tmp.986
	%tmp.987 = alloca %Expr*
	store %Expr* null, %Expr** %tmp.987
	br label %loop.0

loop.0:
	%tmp.988 = load i1, i1* %tmp.986
	%tmp.989 = xor i1 %tmp.988, true
	br i1 %tmp.989, label %true.0, label %false.0

true.0:
	%tmp.990 = load %Expr*, %Expr** %tmp.971
	%tmp.991 = icmp eq %Expr* %tmp.990, null
	br i1 %tmp.991, label %abort, label %ok.2

ok.2:
	%tmp.992 = getelementptr %Expr, %Expr* %tmp.990, i32 0, i32 0
	%tmp.993 = load %Expr_vtable*, %Expr_vtable** %tmp.992
	%tmp.994 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.993, i32 0, i32 12
	%tmp.995 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.994
	%tmp.996 = call %Expr*(%Expr*) %tmp.995( %Expr* %tmp.990 )
	store %Expr* %tmp.996, %Expr** %tmp.987
	%tmp.997 = alloca i1
	%tmp.998 = load %Expr*, %Expr** %tmp.987
	%tmp.999 = load %Expr*, %Expr** %tmp.971
	%tmp.1000 = icmp eq %Expr* %tmp.998, %tmp.999
	br i1 %tmp.1000, label %true.1, label %false.1

true.1:
	store i1 true, i1* %tmp.986
	store i1 true, i1* %tmp.997
	br label %end.1

false.1:
	%tmp.1001 = load %Expr*, %Expr** %tmp.987
	store %Expr* %tmp.1001, %Expr** %tmp.971
	%tmp.1002 = load %Main*, %Main** %tmp.970
	%tmp.1003 = icmp eq %Main* %tmp.1002, null
	br i1 %tmp.1003, label %abort, label %ok.3

ok.3:
	%tmp.1004 = getelementptr %Main, %Main* %tmp.1002, i32 0, i32 0
	%tmp.1005 = load %Main_vtable*, %Main_vtable** %tmp.1004
	%tmp.1006 = getelementptr %Main_vtable, %Main_vtable* %tmp.1005, i32 0, i32 7
	%tmp.1007 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1006
	%tmp.1008 = call %Main*(%Main*, %String*) %tmp.1007( %Main* %tmp.1002, %String* @String.39 )
	%tmp.1009 = load %Expr*, %Expr** %tmp.971
	%tmp.1010 = icmp eq %Expr* %tmp.1009, null
	br i1 %tmp.1010, label %abort, label %ok.4

ok.4:
	%tmp.1011 = getelementptr %Expr, %Expr* %tmp.1009, i32 0, i32 0
	%tmp.1012 = load %Expr_vtable*, %Expr_vtable** %tmp.1011
	%tmp.1013 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1012, i32 0, i32 11
	%tmp.1014 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.1013
	%tmp.1015 = call %Expr*(%Expr*) %tmp.1014( %Expr* %tmp.1009 )
	%tmp.1016 = getelementptr %Expr, %Expr* %tmp.1015, i32 0, i32 1
	%tmp.1017 = load i1, i1* %tmp.1016
	store i1 %tmp.1017, i1* %tmp.997
	br label %end.1

end.1:
	%tmp.1018 = load i1, i1* %tmp.997
	br label %loop.0

false.0:
	%tmp.1019 = load %Main*, %Main** %tmp.970
	%tmp.1020 = icmp eq %Main* %tmp.1019, null
	br i1 %tmp.1020, label %abort, label %ok.5

ok.5:
	%tmp.1021 = getelementptr %Main, %Main* %tmp.1019, i32 0, i32 0
	%tmp.1022 = load %Main_vtable*, %Main_vtable** %tmp.1021
	%tmp.1023 = getelementptr %Main_vtable, %Main_vtable* %tmp.1022, i32 0, i32 7
	%tmp.1024 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1023
	%tmp.1025 = call %Main*(%Main*, %String*) %tmp.1024( %Main* %tmp.1019, %String* @String.1 )
	%tmp.1026 = load %Expr*, %Expr** %tmp.971
	ret %Expr* %tmp.1026

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_eval_class(%Main* %self) {

entry:
	%tmp.1027 = alloca %Main*
	store %Main* %self, %Main** %tmp.1027
	%tmp.1028 = load %Main*, %Main** %tmp.1027
	%tmp.1029 = icmp eq %Main* %tmp.1028, null
	br i1 %tmp.1029, label %abort, label %ok.6

ok.6:
	%tmp.1030 = getelementptr %Main, %Main* %tmp.1028, i32 0, i32 0
	%tmp.1031 = load %Main_vtable*, %Main_vtable** %tmp.1030
	%tmp.1032 = getelementptr %Main_vtable, %Main_vtable* %tmp.1031, i32 0, i32 7
	%tmp.1033 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1032
	%tmp.1034 = call %Main*(%Main*, %String*) %tmp.1033( %Main* %tmp.1028, %String* @String.40 )
	%tmp.1035 = load %Main*, %Main** %tmp.1027
	%tmp.1036 = icmp eq %Main* %tmp.1035, null
	br i1 %tmp.1036, label %abort, label %ok.7

ok.7:
	%tmp.1037 = getelementptr %Main, %Main* %tmp.1035, i32 0, i32 0
	%tmp.1038 = load %Main_vtable*, %Main_vtable** %tmp.1037
	%tmp.1039 = getelementptr %Main_vtable, %Main_vtable* %tmp.1038, i32 0, i32 7
	%tmp.1040 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1039
	%tmp.1041 = call %Main*(%Main*, %String*) %tmp.1040( %Main* %tmp.1035, %String* @String.41 )
	%tmp.1042 = load %Main*, %Main** %tmp.1027
	%tmp.1043 = icmp eq %Main* %tmp.1042, null
	br i1 %tmp.1043, label %abort, label %ok.8

ok.8:
	%tmp.1044 = getelementptr %Main, %Main* %tmp.1042, i32 0, i32 0
	%tmp.1045 = load %Main_vtable*, %Main_vtable** %tmp.1044
	%tmp.1046 = getelementptr %Main_vtable, %Main_vtable* %tmp.1045, i32 0, i32 7
	%tmp.1047 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1046
	%tmp.1048 = call %Main*(%Main*, %String*) %tmp.1047( %Main* %tmp.1042, %String* @String.23 )
	ret %Main* %tmp.1048

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_closure_class(%Main* %self) {

entry:
	%tmp.1049 = alloca %Main*
	store %Main* %self, %Main** %tmp.1049
	%tmp.1050 = load %Main*, %Main** %tmp.1049
	%tmp.1051 = icmp eq %Main* %tmp.1050, null
	br i1 %tmp.1051, label %abort, label %ok.9

ok.9:
	%tmp.1052 = getelementptr %Main, %Main* %tmp.1050, i32 0, i32 0
	%tmp.1053 = load %Main_vtable*, %Main_vtable** %tmp.1052
	%tmp.1054 = getelementptr %Main_vtable, %Main_vtable* %tmp.1053, i32 0, i32 7
	%tmp.1055 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1054
	%tmp.1056 = call %Main*(%Main*, %String*) %tmp.1055( %Main* %tmp.1050, %String* @String.42 )
	%tmp.1057 = load %Main*, %Main** %tmp.1049
	%tmp.1058 = icmp eq %Main* %tmp.1057, null
	br i1 %tmp.1058, label %abort, label %ok.10

ok.10:
	%tmp.1059 = getelementptr %Main, %Main* %tmp.1057, i32 0, i32 0
	%tmp.1060 = load %Main_vtable*, %Main_vtable** %tmp.1059
	%tmp.1061 = getelementptr %Main_vtable, %Main_vtable* %tmp.1060, i32 0, i32 7
	%tmp.1062 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1061
	%tmp.1063 = call %Main*(%Main*, %String*) %tmp.1062( %Main* %tmp.1057, %String* @String.43 )
	%tmp.1064 = load %Main*, %Main** %tmp.1049
	%tmp.1065 = icmp eq %Main* %tmp.1064, null
	br i1 %tmp.1065, label %abort, label %ok.11

ok.11:
	%tmp.1066 = getelementptr %Main, %Main* %tmp.1064, i32 0, i32 0
	%tmp.1067 = load %Main_vtable*, %Main_vtable** %tmp.1066
	%tmp.1068 = getelementptr %Main_vtable, %Main_vtable* %tmp.1067, i32 0, i32 7
	%tmp.1069 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1068
	%tmp.1070 = call %Main*(%Main*, %String*) %tmp.1069( %Main* %tmp.1064, %String* @String.44 )
	%tmp.1071 = load %Main*, %Main** %tmp.1049
	%tmp.1072 = icmp eq %Main* %tmp.1071, null
	br i1 %tmp.1072, label %abort, label %ok.12

ok.12:
	%tmp.1073 = getelementptr %Main, %Main* %tmp.1071, i32 0, i32 0
	%tmp.1074 = load %Main_vtable*, %Main_vtable** %tmp.1073
	%tmp.1075 = getelementptr %Main_vtable, %Main_vtable* %tmp.1074, i32 0, i32 7
	%tmp.1076 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1075
	%tmp.1077 = call %Main*(%Main*, %String*) %tmp.1076( %Main* %tmp.1071, %String* @String.45 )
	%tmp.1078 = load %Main*, %Main** %tmp.1049
	%tmp.1079 = icmp eq %Main* %tmp.1078, null
	br i1 %tmp.1079, label %abort, label %ok.13

ok.13:
	%tmp.1080 = getelementptr %Main, %Main* %tmp.1078, i32 0, i32 0
	%tmp.1081 = load %Main_vtable*, %Main_vtable** %tmp.1080
	%tmp.1082 = getelementptr %Main_vtable, %Main_vtable* %tmp.1081, i32 0, i32 7
	%tmp.1083 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1082
	%tmp.1084 = call %Main*(%Main*, %String*) %tmp.1083( %Main* %tmp.1078, %String* @String.46 )
	%tmp.1085 = load %Main*, %Main** %tmp.1049
	%tmp.1086 = icmp eq %Main* %tmp.1085, null
	br i1 %tmp.1086, label %abort, label %ok.14

ok.14:
	%tmp.1087 = getelementptr %Main, %Main* %tmp.1085, i32 0, i32 0
	%tmp.1088 = load %Main_vtable*, %Main_vtable** %tmp.1087
	%tmp.1089 = getelementptr %Main_vtable, %Main_vtable* %tmp.1088, i32 0, i32 7
	%tmp.1090 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1089
	%tmp.1091 = call %Main*(%Main*, %String*) %tmp.1090( %Main* %tmp.1085, %String* @String.47 )
	%tmp.1092 = load %Main*, %Main** %tmp.1049
	%tmp.1093 = icmp eq %Main* %tmp.1092, null
	br i1 %tmp.1093, label %abort, label %ok.15

ok.15:
	%tmp.1094 = getelementptr %Main, %Main* %tmp.1092, i32 0, i32 0
	%tmp.1095 = load %Main_vtable*, %Main_vtable** %tmp.1094
	%tmp.1096 = getelementptr %Main_vtable, %Main_vtable* %tmp.1095, i32 0, i32 7
	%tmp.1097 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1096
	%tmp.1098 = call %Main*(%Main*, %String*) %tmp.1097( %Main* %tmp.1092, %String* @String.48 )
	%tmp.1099 = load %Main*, %Main** %tmp.1049
	%tmp.1100 = icmp eq %Main* %tmp.1099, null
	br i1 %tmp.1100, label %abort, label %ok.16

ok.16:
	%tmp.1101 = getelementptr %Main, %Main* %tmp.1099, i32 0, i32 0
	%tmp.1102 = load %Main_vtable*, %Main_vtable** %tmp.1101
	%tmp.1103 = getelementptr %Main_vtable, %Main_vtable* %tmp.1102, i32 0, i32 7
	%tmp.1104 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1103
	%tmp.1105 = call %Main*(%Main*, %String*) %tmp.1104( %Main* %tmp.1099, %String* @String.23 )
	ret %Main* %tmp.1105

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_gen_code(%Main* %self, %Expr* %e) {

entry:
	%tmp.1106 = alloca %Main*
	store %Main* %self, %Main** %tmp.1106
	%tmp.1107 = alloca %Expr*
	store %Expr* %e, %Expr** %tmp.1107
	%tmp.1108 = call %LambdaListRef* @LambdaListRef_new(  )
	%tmp.1109 = icmp eq %LambdaListRef* %tmp.1108, null
	br i1 %tmp.1109, label %abort, label %ok.17

ok.17:
	%tmp.1110 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1108, i32 0, i32 0
	%tmp.1111 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1110
	%tmp.1112 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1111, i32 0, i32 11
	%tmp.1113 = load %LambdaListRef* (%LambdaListRef*) *, %LambdaListRef* (%LambdaListRef*) ** %tmp.1112
	%tmp.1114 = call %LambdaListRef*(%LambdaListRef*) %tmp.1113( %LambdaListRef* %tmp.1108 )
	%tmp.1115 = alloca %LambdaListRef*
	store %LambdaListRef* %tmp.1114, %LambdaListRef** %tmp.1115
	%tmp.1116 = load %Main*, %Main** %tmp.1106
	%tmp.1117 = icmp eq %Main* %tmp.1116, null
	br i1 %tmp.1117, label %abort, label %ok.18

ok.18:
	%tmp.1118 = getelementptr %Main, %Main* %tmp.1116, i32 0, i32 0
	%tmp.1119 = load %Main_vtable*, %Main_vtable** %tmp.1118
	%tmp.1120 = getelementptr %Main_vtable, %Main_vtable* %tmp.1119, i32 0, i32 7
	%tmp.1121 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1120
	%tmp.1122 = call %Main*(%Main*, %String*) %tmp.1121( %Main* %tmp.1116, %String* @String.49 )
	%tmp.1123 = load %Expr*, %Expr** %tmp.1107
	%tmp.1124 = icmp eq %Expr* %tmp.1123, null
	br i1 %tmp.1124, label %abort, label %ok.19

ok.19:
	%tmp.1125 = getelementptr %Expr, %Expr* %tmp.1123, i32 0, i32 0
	%tmp.1126 = load %Expr_vtable*, %Expr_vtable** %tmp.1125
	%tmp.1127 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1126, i32 0, i32 11
	%tmp.1128 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.1127
	%tmp.1129 = call %Expr*(%Expr*) %tmp.1128( %Expr* %tmp.1123 )
	%tmp.1130 = load %Main*, %Main** %tmp.1106
	%tmp.1131 = icmp eq %Main* %tmp.1130, null
	br i1 %tmp.1131, label %abort, label %ok.20

ok.20:
	%tmp.1132 = getelementptr %Main, %Main* %tmp.1130, i32 0, i32 0
	%tmp.1133 = load %Main_vtable*, %Main_vtable** %tmp.1132
	%tmp.1134 = getelementptr %Main_vtable, %Main_vtable* %tmp.1133, i32 0, i32 7
	%tmp.1135 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1134
	%tmp.1136 = call %Main*(%Main*, %String*) %tmp.1135( %Main* %tmp.1130, %String* @String.50 )
	%tmp.1137 = load %Main*, %Main** %tmp.1106
	%tmp.1138 = icmp eq %Main* %tmp.1137, null
	br i1 %tmp.1138, label %abort, label %ok.21

ok.21:
	%tmp.1139 = getelementptr %Main, %Main* %tmp.1137, i32 0, i32 0
	%tmp.1140 = load %Main_vtable*, %Main_vtable** %tmp.1139
	%tmp.1141 = getelementptr %Main_vtable, %Main_vtable* %tmp.1140, i32 0, i32 7
	%tmp.1142 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1141
	%tmp.1143 = call %Main*(%Main*, %String*) %tmp.1142( %Main* %tmp.1137, %String* @String.51 )
	%tmp.1144 = load %Main*, %Main** %tmp.1106
	%tmp.1145 = icmp eq %Main* %tmp.1144, null
	br i1 %tmp.1145, label %abort, label %ok.22

ok.22:
	%tmp.1146 = getelementptr %Main, %Main* %tmp.1144, i32 0, i32 0
	%tmp.1147 = load %Main_vtable*, %Main_vtable** %tmp.1146
	%tmp.1148 = getelementptr %Main_vtable, %Main_vtable* %tmp.1147, i32 0, i32 18
	%tmp.1149 = load %Main* (%Main*) *, %Main* (%Main*) ** %tmp.1148
	%tmp.1150 = call %Main*(%Main*) %tmp.1149( %Main* %tmp.1144 )
	%tmp.1151 = load %Main*, %Main** %tmp.1106
	%tmp.1152 = icmp eq %Main* %tmp.1151, null
	br i1 %tmp.1152, label %abort, label %ok.23

ok.23:
	%tmp.1153 = getelementptr %Main, %Main* %tmp.1151, i32 0, i32 0
	%tmp.1154 = load %Main_vtable*, %Main_vtable** %tmp.1153
	%tmp.1155 = getelementptr %Main_vtable, %Main_vtable* %tmp.1154, i32 0, i32 19
	%tmp.1156 = load %Main* (%Main*) *, %Main* (%Main*) ** %tmp.1155
	%tmp.1157 = call %Main*(%Main*) %tmp.1156( %Main* %tmp.1151 )
	%tmp.1158 = load %Main*, %Main** %tmp.1106
	%tmp.1159 = icmp eq %Main* %tmp.1158, null
	br i1 %tmp.1159, label %abort, label %ok.24

ok.24:
	%tmp.1160 = getelementptr %Main, %Main* %tmp.1158, i32 0, i32 0
	%tmp.1161 = load %Main_vtable*, %Main_vtable** %tmp.1160
	%tmp.1162 = getelementptr %Main_vtable, %Main_vtable* %tmp.1161, i32 0, i32 7
	%tmp.1163 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1162
	%tmp.1164 = call %Main*(%Main*, %String*) %tmp.1163( %Main* %tmp.1158, %String* @String.52 )
	%tmp.1165 = load %Main*, %Main** %tmp.1106
	%tmp.1166 = icmp eq %Main* %tmp.1165, null
	br i1 %tmp.1166, label %abort, label %ok.25

ok.25:
	%tmp.1167 = getelementptr %Main, %Main* %tmp.1165, i32 0, i32 0
	%tmp.1168 = load %Main_vtable*, %Main_vtable** %tmp.1167
	%tmp.1169 = getelementptr %Main_vtable, %Main_vtable* %tmp.1168, i32 0, i32 7
	%tmp.1170 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1169
	%tmp.1171 = call %Main*(%Main*, %String*) %tmp.1170( %Main* %tmp.1165, %String* @String.53 )
	%tmp.1172 = call %VarList* @VarList_new(  )
	%tmp.1173 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1174 = load %Expr*, %Expr** %tmp.1107
	%tmp.1175 = icmp eq %Expr* %tmp.1174, null
	br i1 %tmp.1175, label %abort, label %ok.26

ok.26:
	%tmp.1176 = getelementptr %Expr, %Expr* %tmp.1174, i32 0, i32 0
	%tmp.1177 = load %Expr_vtable*, %Expr_vtable** %tmp.1176
	%tmp.1178 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1177, i32 0, i32 14
	%tmp.1179 = load %Expr* (%Expr*,%VarList*,%LambdaListRef*) *, %Expr* (%Expr*,%VarList*,%LambdaListRef*) ** %tmp.1178
	%tmp.1180 = call %Expr*(%Expr*, %VarList*, %LambdaListRef*) %tmp.1179( %Expr* %tmp.1174, %VarList* %tmp.1172, %LambdaListRef* %tmp.1173 )
	%tmp.1181 = load %Main*, %Main** %tmp.1106
	%tmp.1182 = icmp eq %Main* %tmp.1181, null
	br i1 %tmp.1182, label %abort, label %ok.27

ok.27:
	%tmp.1183 = getelementptr %Main, %Main* %tmp.1181, i32 0, i32 0
	%tmp.1184 = load %Main_vtable*, %Main_vtable** %tmp.1183
	%tmp.1185 = getelementptr %Main_vtable, %Main_vtable* %tmp.1184, i32 0, i32 7
	%tmp.1186 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1185
	%tmp.1187 = call %Main*(%Main*, %String*) %tmp.1186( %Main* %tmp.1181, %String* @String.54 )
	br label %loop.2

loop.2:
	%tmp.1188 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1189 = icmp eq %LambdaListRef* %tmp.1188, null
	br i1 %tmp.1189, label %abort, label %ok.28

ok.28:
	%tmp.1190 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1188, i32 0, i32 0
	%tmp.1191 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1190
	%tmp.1192 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1191, i32 0, i32 7
	%tmp.1193 = load i1 (%LambdaListRef*) *, i1 (%LambdaListRef*) ** %tmp.1192
	%tmp.1194 = call i1(%LambdaListRef*) %tmp.1193( %LambdaListRef* %tmp.1188 )
	%tmp.1195 = xor i1 %tmp.1194, true
	br i1 %tmp.1195, label %true.2, label %false.2

true.2:
	%tmp.1196 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1197 = icmp eq %LambdaListRef* %tmp.1196, null
	br i1 %tmp.1197, label %abort, label %ok.29

ok.29:
	%tmp.1198 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1196, i32 0, i32 0
	%tmp.1199 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1198
	%tmp.1200 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1199, i32 0, i32 8
	%tmp.1201 = load %VarList* (%LambdaListRef*) *, %VarList* (%LambdaListRef*) ** %tmp.1200
	%tmp.1202 = call %VarList*(%LambdaListRef*) %tmp.1201( %LambdaListRef* %tmp.1196 )
	%tmp.1203 = alloca %VarList*
	store %VarList* %tmp.1202, %VarList** %tmp.1203
	%tmp.1204 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1205 = icmp eq %LambdaListRef* %tmp.1204, null
	br i1 %tmp.1205, label %abort, label %ok.30

ok.30:
	%tmp.1206 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1204, i32 0, i32 0
	%tmp.1207 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1206
	%tmp.1208 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1207, i32 0, i32 9
	%tmp.1209 = load %Lambda* (%LambdaListRef*) *, %Lambda* (%LambdaListRef*) ** %tmp.1208
	%tmp.1210 = call %Lambda*(%LambdaListRef*) %tmp.1209( %LambdaListRef* %tmp.1204 )
	%tmp.1211 = alloca %Lambda*
	store %Lambda* %tmp.1210, %Lambda** %tmp.1211
	%tmp.1212 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1213 = icmp eq %LambdaListRef* %tmp.1212, null
	br i1 %tmp.1213, label %abort, label %ok.31

ok.31:
	%tmp.1214 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1212, i32 0, i32 0
	%tmp.1215 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1214
	%tmp.1216 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1215, i32 0, i32 10
	%tmp.1217 = load i32 (%LambdaListRef*) *, i32 (%LambdaListRef*) ** %tmp.1216
	%tmp.1218 = call i32(%LambdaListRef*) %tmp.1217( %LambdaListRef* %tmp.1212 )
	%tmp.1219 = alloca i32
	store i32 %tmp.1218, i32* %tmp.1219
	%tmp.1220 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1221 = icmp eq %LambdaListRef* %tmp.1220, null
	br i1 %tmp.1221, label %abort, label %ok.32

ok.32:
	%tmp.1222 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1220, i32 0, i32 0
	%tmp.1223 = load %LambdaListRef_vtable*, %LambdaListRef_vtable** %tmp.1222
	%tmp.1224 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* %tmp.1223, i32 0, i32 13
	%tmp.1225 = load %LambdaListRef* (%LambdaListRef*) *, %LambdaListRef* (%LambdaListRef*) ** %tmp.1224
	%tmp.1226 = call %LambdaListRef*(%LambdaListRef*) %tmp.1225( %LambdaListRef* %tmp.1220 )
	%tmp.1227 = load i32, i32* %tmp.1219
	%tmp.1228 = load %VarList*, %VarList** %tmp.1203
	%tmp.1229 = load %LambdaListRef*, %LambdaListRef** %tmp.1115
	%tmp.1230 = load %Lambda*, %Lambda** %tmp.1211
	%tmp.1231 = icmp eq %Lambda* %tmp.1230, null
	br i1 %tmp.1231, label %abort, label %ok.33

ok.33:
	%tmp.1232 = getelementptr %Lambda, %Lambda* %tmp.1230, i32 0, i32 0
	%tmp.1233 = load %Lambda_vtable*, %Lambda_vtable** %tmp.1232
	%tmp.1234 = getelementptr %Lambda_vtable, %Lambda_vtable* %tmp.1233, i32 0, i32 17
	%tmp.1235 = load %Lambda* (%Lambda*,i32,%VarList*,%LambdaListRef*) *, %Lambda* (%Lambda*,i32,%VarList*,%LambdaListRef*) ** %tmp.1234
	%tmp.1236 = call %Lambda*(%Lambda*, i32, %VarList*, %LambdaListRef*) %tmp.1235( %Lambda* %tmp.1230, i32 %tmp.1227, %VarList* %tmp.1228, %LambdaListRef* %tmp.1229 )
	br label %loop.2

false.2:
	%tmp.1237 = load %Main*, %Main** %tmp.1106
	%tmp.1238 = icmp eq %Main* %tmp.1237, null
	br i1 %tmp.1238, label %abort, label %ok.34

ok.34:
	%tmp.1239 = getelementptr %Main, %Main* %tmp.1237, i32 0, i32 0
	%tmp.1240 = load %Main_vtable*, %Main_vtable** %tmp.1239
	%tmp.1241 = getelementptr %Main_vtable, %Main_vtable* %tmp.1240, i32 0, i32 7
	%tmp.1242 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1241
	%tmp.1243 = call %Main*(%Main*, %String*) %tmp.1242( %Main* %tmp.1237, %String* @String.50 )
	ret %Main* %tmp.1243

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_main(%Main* %self) {

entry:
	%tmp.1244 = alloca %Main*
	store %Main* %self, %Main** %tmp.1244
	%tmp.1245 = load %Main*, %Main** %tmp.1244
	%tmp.1246 = icmp eq %Main* %tmp.1245, null
	br i1 %tmp.1246, label %abort, label %ok.35

ok.35:
	%tmp.1247 = getelementptr %Main, %Main* %tmp.1245, i32 0, i32 0
	%tmp.1248 = load %Main_vtable*, %Main_vtable** %tmp.1247
	%tmp.1249 = getelementptr %Main_vtable, %Main_vtable* %tmp.1248, i32 0, i32 14
	%tmp.1250 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1249
	%tmp.1251 = call %Expr*(%Main*) %tmp.1250( %Main* %tmp.1245 )
	%tmp.1252 = icmp eq %Expr* %tmp.1251, null
	br i1 %tmp.1252, label %abort, label %ok.36

ok.36:
	%tmp.1253 = getelementptr %Expr, %Expr* %tmp.1251, i32 0, i32 0
	%tmp.1254 = load %Expr_vtable*, %Expr_vtable** %tmp.1253
	%tmp.1255 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1254, i32 0, i32 11
	%tmp.1256 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.1255
	%tmp.1257 = call %Expr*(%Expr*) %tmp.1256( %Expr* %tmp.1251 )
	%tmp.1258 = load %Main*, %Main** %tmp.1244
	%tmp.1259 = icmp eq %Main* %tmp.1258, null
	br i1 %tmp.1259, label %abort, label %ok.37

ok.37:
	%tmp.1260 = getelementptr %Main, %Main* %tmp.1258, i32 0, i32 0
	%tmp.1261 = load %Main_vtable*, %Main_vtable** %tmp.1260
	%tmp.1262 = getelementptr %Main_vtable, %Main_vtable* %tmp.1261, i32 0, i32 7
	%tmp.1263 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1262
	%tmp.1264 = call %Main*(%Main*, %String*) %tmp.1263( %Main* %tmp.1258, %String* @String.1 )
	%tmp.1265 = load %Main*, %Main** %tmp.1244
	%tmp.1266 = icmp eq %Main* %tmp.1265, null
	br i1 %tmp.1266, label %abort, label %ok.38

ok.38:
	%tmp.1267 = getelementptr %Main, %Main* %tmp.1265, i32 0, i32 0
	%tmp.1268 = load %Main_vtable*, %Main_vtable** %tmp.1267
	%tmp.1269 = getelementptr %Main_vtable, %Main_vtable* %tmp.1268, i32 0, i32 15
	%tmp.1270 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1269
	%tmp.1271 = call %Expr*(%Main*) %tmp.1270( %Main* %tmp.1265 )
	%tmp.1272 = icmp eq %Expr* %tmp.1271, null
	br i1 %tmp.1272, label %abort, label %ok.39

ok.39:
	%tmp.1273 = getelementptr %Expr, %Expr* %tmp.1271, i32 0, i32 0
	%tmp.1274 = load %Expr_vtable*, %Expr_vtable** %tmp.1273
	%tmp.1275 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1274, i32 0, i32 11
	%tmp.1276 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.1275
	%tmp.1277 = call %Expr*(%Expr*) %tmp.1276( %Expr* %tmp.1271 )
	%tmp.1278 = load %Main*, %Main** %tmp.1244
	%tmp.1279 = icmp eq %Main* %tmp.1278, null
	br i1 %tmp.1279, label %abort, label %ok.40

ok.40:
	%tmp.1280 = getelementptr %Main, %Main* %tmp.1278, i32 0, i32 0
	%tmp.1281 = load %Main_vtable*, %Main_vtable** %tmp.1280
	%tmp.1282 = getelementptr %Main_vtable, %Main_vtable* %tmp.1281, i32 0, i32 7
	%tmp.1283 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1282
	%tmp.1284 = call %Main*(%Main*, %String*) %tmp.1283( %Main* %tmp.1278, %String* @String.1 )
	%tmp.1285 = load %Main*, %Main** %tmp.1244
	%tmp.1286 = icmp eq %Main* %tmp.1285, null
	br i1 %tmp.1286, label %abort, label %ok.41

ok.41:
	%tmp.1287 = getelementptr %Main, %Main* %tmp.1285, i32 0, i32 0
	%tmp.1288 = load %Main_vtable*, %Main_vtable** %tmp.1287
	%tmp.1289 = getelementptr %Main_vtable, %Main_vtable* %tmp.1288, i32 0, i32 16
	%tmp.1290 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1289
	%tmp.1291 = call %Expr*(%Main*) %tmp.1290( %Main* %tmp.1285 )
	%tmp.1292 = icmp eq %Expr* %tmp.1291, null
	br i1 %tmp.1292, label %abort, label %ok.42

ok.42:
	%tmp.1293 = getelementptr %Expr, %Expr* %tmp.1291, i32 0, i32 0
	%tmp.1294 = load %Expr_vtable*, %Expr_vtable** %tmp.1293
	%tmp.1295 = getelementptr %Expr_vtable, %Expr_vtable* %tmp.1294, i32 0, i32 11
	%tmp.1296 = load %Expr* (%Expr*) *, %Expr* (%Expr*) ** %tmp.1295
	%tmp.1297 = call %Expr*(%Expr*) %tmp.1296( %Expr* %tmp.1291 )
	%tmp.1298 = load %Main*, %Main** %tmp.1244
	%tmp.1299 = icmp eq %Main* %tmp.1298, null
	br i1 %tmp.1299, label %abort, label %ok.43

ok.43:
	%tmp.1300 = getelementptr %Main, %Main* %tmp.1298, i32 0, i32 0
	%tmp.1301 = load %Main_vtable*, %Main_vtable** %tmp.1300
	%tmp.1302 = getelementptr %Main_vtable, %Main_vtable* %tmp.1301, i32 0, i32 7
	%tmp.1303 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.1302
	%tmp.1304 = call %Main*(%Main*, %String*) %tmp.1303( %Main* %tmp.1298, %String* @String.1 )
	%tmp.1305 = load %Main*, %Main** %tmp.1244
	%tmp.1306 = icmp eq %Main* %tmp.1305, null
	br i1 %tmp.1306, label %abort, label %ok.44

ok.44:
	%tmp.1307 = getelementptr %Main, %Main* %tmp.1305, i32 0, i32 0
	%tmp.1308 = load %Main_vtable*, %Main_vtable** %tmp.1307
	%tmp.1309 = getelementptr %Main_vtable, %Main_vtable* %tmp.1308, i32 0, i32 16
	%tmp.1310 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1309
	%tmp.1311 = call %Expr*(%Main*) %tmp.1310( %Main* %tmp.1305 )
	%tmp.1312 = load %Main*, %Main** %tmp.1244
	%tmp.1313 = icmp eq %Main* %tmp.1312, null
	br i1 %tmp.1313, label %abort, label %ok.45

ok.45:
	%tmp.1314 = getelementptr %Main, %Main* %tmp.1312, i32 0, i32 0
	%tmp.1315 = load %Main_vtable*, %Main_vtable** %tmp.1314
	%tmp.1316 = getelementptr %Main_vtable, %Main_vtable* %tmp.1315, i32 0, i32 15
	%tmp.1317 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1316
	%tmp.1318 = call %Expr*(%Main*) %tmp.1317( %Main* %tmp.1312 )
	%tmp.1319 = load %Main*, %Main** %tmp.1244
	%tmp.1320 = icmp eq %Main* %tmp.1319, null
	br i1 %tmp.1320, label %abort, label %ok.46

ok.46:
	%tmp.1321 = getelementptr %Main, %Main* %tmp.1319, i32 0, i32 0
	%tmp.1322 = load %Main_vtable*, %Main_vtable** %tmp.1321
	%tmp.1323 = getelementptr %Main_vtable, %Main_vtable* %tmp.1322, i32 0, i32 13
	%tmp.1324 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1323
	%tmp.1325 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1324( %Main* %tmp.1319, %Expr* %tmp.1311, %Expr* %tmp.1318 )
	%tmp.1326 = load %Main*, %Main** %tmp.1244
	%tmp.1327 = icmp eq %Main* %tmp.1326, null
	br i1 %tmp.1327, label %abort, label %ok.47

ok.47:
	%tmp.1328 = getelementptr %Main, %Main* %tmp.1326, i32 0, i32 0
	%tmp.1329 = load %Main_vtable*, %Main_vtable** %tmp.1328
	%tmp.1330 = getelementptr %Main_vtable, %Main_vtable* %tmp.1329, i32 0, i32 14
	%tmp.1331 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1330
	%tmp.1332 = call %Expr*(%Main*) %tmp.1331( %Main* %tmp.1326 )
	%tmp.1333 = load %Main*, %Main** %tmp.1244
	%tmp.1334 = icmp eq %Main* %tmp.1333, null
	br i1 %tmp.1334, label %abort, label %ok.48

ok.48:
	%tmp.1335 = getelementptr %Main, %Main* %tmp.1333, i32 0, i32 0
	%tmp.1336 = load %Main_vtable*, %Main_vtable** %tmp.1335
	%tmp.1337 = getelementptr %Main_vtable, %Main_vtable* %tmp.1336, i32 0, i32 13
	%tmp.1338 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1337
	%tmp.1339 = bitcast %App* %tmp.1325 to %Expr*
	%tmp.1340 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1338( %Main* %tmp.1333, %Expr* %tmp.1339, %Expr* %tmp.1332 )
	%tmp.1341 = load %Main*, %Main** %tmp.1244
	%tmp.1342 = icmp eq %Main* %tmp.1341, null
	br i1 %tmp.1342, label %abort, label %ok.49

ok.49:
	%tmp.1343 = getelementptr %Main, %Main* %tmp.1341, i32 0, i32 0
	%tmp.1344 = load %Main_vtable*, %Main_vtable** %tmp.1343
	%tmp.1345 = getelementptr %Main_vtable, %Main_vtable* %tmp.1344, i32 0, i32 14
	%tmp.1346 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1345
	%tmp.1347 = call %Expr*(%Main*) %tmp.1346( %Main* %tmp.1341 )
	%tmp.1348 = load %Main*, %Main** %tmp.1244
	%tmp.1349 = icmp eq %Main* %tmp.1348, null
	br i1 %tmp.1349, label %abort, label %ok.50

ok.50:
	%tmp.1350 = getelementptr %Main, %Main* %tmp.1348, i32 0, i32 0
	%tmp.1351 = load %Main_vtable*, %Main_vtable** %tmp.1350
	%tmp.1352 = getelementptr %Main_vtable, %Main_vtable* %tmp.1351, i32 0, i32 13
	%tmp.1353 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1352
	%tmp.1354 = bitcast %App* %tmp.1340 to %Expr*
	%tmp.1355 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1353( %Main* %tmp.1348, %Expr* %tmp.1354, %Expr* %tmp.1347 )
	%tmp.1356 = load %Main*, %Main** %tmp.1244
	%tmp.1357 = icmp eq %Main* %tmp.1356, null
	br i1 %tmp.1357, label %abort, label %ok.51

ok.51:
	%tmp.1358 = getelementptr %Main, %Main* %tmp.1356, i32 0, i32 0
	%tmp.1359 = load %Main_vtable*, %Main_vtable** %tmp.1358
	%tmp.1360 = getelementptr %Main_vtable, %Main_vtable* %tmp.1359, i32 0, i32 17
	%tmp.1361 = load %Expr* (%Main*,%Expr*) *, %Expr* (%Main*,%Expr*) ** %tmp.1360
	%tmp.1362 = bitcast %App* %tmp.1355 to %Expr*
	%tmp.1363 = call %Expr*(%Main*, %Expr*) %tmp.1361( %Main* %tmp.1356, %Expr* %tmp.1362 )
	%tmp.1364 = load %Main*, %Main** %tmp.1244
	%tmp.1365 = icmp eq %Main* %tmp.1364, null
	br i1 %tmp.1365, label %abort, label %ok.52

ok.52:
	%tmp.1366 = getelementptr %Main, %Main* %tmp.1364, i32 0, i32 0
	%tmp.1367 = load %Main_vtable*, %Main_vtable** %tmp.1366
	%tmp.1368 = getelementptr %Main_vtable, %Main_vtable* %tmp.1367, i32 0, i32 15
	%tmp.1369 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1368
	%tmp.1370 = call %Expr*(%Main*) %tmp.1369( %Main* %tmp.1364 )
	%tmp.1371 = load %Main*, %Main** %tmp.1244
	%tmp.1372 = icmp eq %Main* %tmp.1371, null
	br i1 %tmp.1372, label %abort, label %ok.53

ok.53:
	%tmp.1373 = getelementptr %Main, %Main* %tmp.1371, i32 0, i32 0
	%tmp.1374 = load %Main_vtable*, %Main_vtable** %tmp.1373
	%tmp.1375 = getelementptr %Main_vtable, %Main_vtable* %tmp.1374, i32 0, i32 14
	%tmp.1376 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1375
	%tmp.1377 = call %Expr*(%Main*) %tmp.1376( %Main* %tmp.1371 )
	%tmp.1378 = load %Main*, %Main** %tmp.1244
	%tmp.1379 = icmp eq %Main* %tmp.1378, null
	br i1 %tmp.1379, label %abort, label %ok.54

ok.54:
	%tmp.1380 = getelementptr %Main, %Main* %tmp.1378, i32 0, i32 0
	%tmp.1381 = load %Main_vtable*, %Main_vtable** %tmp.1380
	%tmp.1382 = getelementptr %Main_vtable, %Main_vtable* %tmp.1381, i32 0, i32 13
	%tmp.1383 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1382
	%tmp.1384 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1383( %Main* %tmp.1378, %Expr* %tmp.1370, %Expr* %tmp.1377 )
	%tmp.1385 = load %Main*, %Main** %tmp.1244
	%tmp.1386 = icmp eq %Main* %tmp.1385, null
	br i1 %tmp.1386, label %abort, label %ok.55

ok.55:
	%tmp.1387 = getelementptr %Main, %Main* %tmp.1385, i32 0, i32 0
	%tmp.1388 = load %Main_vtable*, %Main_vtable** %tmp.1387
	%tmp.1389 = getelementptr %Main_vtable, %Main_vtable* %tmp.1388, i32 0, i32 14
	%tmp.1390 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1389
	%tmp.1391 = call %Expr*(%Main*) %tmp.1390( %Main* %tmp.1385 )
	%tmp.1392 = load %Main*, %Main** %tmp.1244
	%tmp.1393 = icmp eq %Main* %tmp.1392, null
	br i1 %tmp.1393, label %abort, label %ok.56

ok.56:
	%tmp.1394 = getelementptr %Main, %Main* %tmp.1392, i32 0, i32 0
	%tmp.1395 = load %Main_vtable*, %Main_vtable** %tmp.1394
	%tmp.1396 = getelementptr %Main_vtable, %Main_vtable* %tmp.1395, i32 0, i32 13
	%tmp.1397 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1396
	%tmp.1398 = bitcast %App* %tmp.1384 to %Expr*
	%tmp.1399 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1397( %Main* %tmp.1392, %Expr* %tmp.1398, %Expr* %tmp.1391 )
	%tmp.1400 = load %Main*, %Main** %tmp.1244
	%tmp.1401 = icmp eq %Main* %tmp.1400, null
	br i1 %tmp.1401, label %abort, label %ok.57

ok.57:
	%tmp.1402 = getelementptr %Main, %Main* %tmp.1400, i32 0, i32 0
	%tmp.1403 = load %Main_vtable*, %Main_vtable** %tmp.1402
	%tmp.1404 = getelementptr %Main_vtable, %Main_vtable* %tmp.1403, i32 0, i32 17
	%tmp.1405 = load %Expr* (%Main*,%Expr*) *, %Expr* (%Main*,%Expr*) ** %tmp.1404
	%tmp.1406 = bitcast %App* %tmp.1399 to %Expr*
	%tmp.1407 = call %Expr*(%Main*, %Expr*) %tmp.1405( %Main* %tmp.1400, %Expr* %tmp.1406 )
	%tmp.1408 = load %Main*, %Main** %tmp.1244
	%tmp.1409 = icmp eq %Main* %tmp.1408, null
	br i1 %tmp.1409, label %abort, label %ok.58

ok.58:
	%tmp.1410 = getelementptr %Main, %Main* %tmp.1408, i32 0, i32 0
	%tmp.1411 = load %Main_vtable*, %Main_vtable** %tmp.1410
	%tmp.1412 = getelementptr %Main_vtable, %Main_vtable* %tmp.1411, i32 0, i32 14
	%tmp.1413 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1412
	%tmp.1414 = call %Expr*(%Main*) %tmp.1413( %Main* %tmp.1408 )
	%tmp.1415 = load %Main*, %Main** %tmp.1244
	%tmp.1416 = icmp eq %Main* %tmp.1415, null
	br i1 %tmp.1416, label %abort, label %ok.59

ok.59:
	%tmp.1417 = getelementptr %Main, %Main* %tmp.1415, i32 0, i32 0
	%tmp.1418 = load %Main_vtable*, %Main_vtable** %tmp.1417
	%tmp.1419 = getelementptr %Main_vtable, %Main_vtable* %tmp.1418, i32 0, i32 14
	%tmp.1420 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1419
	%tmp.1421 = call %Expr*(%Main*) %tmp.1420( %Main* %tmp.1415 )
	%tmp.1422 = load %Main*, %Main** %tmp.1244
	%tmp.1423 = icmp eq %Main* %tmp.1422, null
	br i1 %tmp.1423, label %abort, label %ok.60

ok.60:
	%tmp.1424 = getelementptr %Main, %Main* %tmp.1422, i32 0, i32 0
	%tmp.1425 = load %Main_vtable*, %Main_vtable** %tmp.1424
	%tmp.1426 = getelementptr %Main_vtable, %Main_vtable* %tmp.1425, i32 0, i32 13
	%tmp.1427 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1426
	%tmp.1428 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1427( %Main* %tmp.1422, %Expr* %tmp.1414, %Expr* %tmp.1421 )
	%tmp.1429 = load %Main*, %Main** %tmp.1244
	%tmp.1430 = icmp eq %Main* %tmp.1429, null
	br i1 %tmp.1430, label %abort, label %ok.61

ok.61:
	%tmp.1431 = getelementptr %Main, %Main* %tmp.1429, i32 0, i32 0
	%tmp.1432 = load %Main_vtable*, %Main_vtable** %tmp.1431
	%tmp.1433 = getelementptr %Main_vtable, %Main_vtable* %tmp.1432, i32 0, i32 20
	%tmp.1434 = load %Main* (%Main*,%Expr*) *, %Main* (%Main*,%Expr*) ** %tmp.1433
	%tmp.1435 = bitcast %App* %tmp.1428 to %Expr*
	%tmp.1436 = call %Main*(%Main*, %Expr*) %tmp.1434( %Main* %tmp.1429, %Expr* %tmp.1435 )
	%tmp.1437 = load %Main*, %Main** %tmp.1244
	%tmp.1438 = icmp eq %Main* %tmp.1437, null
	br i1 %tmp.1438, label %abort, label %ok.62

ok.62:
	%tmp.1439 = getelementptr %Main, %Main* %tmp.1437, i32 0, i32 0
	%tmp.1440 = load %Main_vtable*, %Main_vtable** %tmp.1439
	%tmp.1441 = getelementptr %Main_vtable, %Main_vtable* %tmp.1440, i32 0, i32 16
	%tmp.1442 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1441
	%tmp.1443 = call %Expr*(%Main*) %tmp.1442( %Main* %tmp.1437 )
	%tmp.1444 = load %Main*, %Main** %tmp.1244
	%tmp.1445 = icmp eq %Main* %tmp.1444, null
	br i1 %tmp.1445, label %abort, label %ok.63

ok.63:
	%tmp.1446 = getelementptr %Main, %Main* %tmp.1444, i32 0, i32 0
	%tmp.1447 = load %Main_vtable*, %Main_vtable** %tmp.1446
	%tmp.1448 = getelementptr %Main_vtable, %Main_vtable* %tmp.1447, i32 0, i32 15
	%tmp.1449 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1448
	%tmp.1450 = call %Expr*(%Main*) %tmp.1449( %Main* %tmp.1444 )
	%tmp.1451 = load %Main*, %Main** %tmp.1244
	%tmp.1452 = icmp eq %Main* %tmp.1451, null
	br i1 %tmp.1452, label %abort, label %ok.64

ok.64:
	%tmp.1453 = getelementptr %Main, %Main* %tmp.1451, i32 0, i32 0
	%tmp.1454 = load %Main_vtable*, %Main_vtable** %tmp.1453
	%tmp.1455 = getelementptr %Main_vtable, %Main_vtable* %tmp.1454, i32 0, i32 13
	%tmp.1456 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1455
	%tmp.1457 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1456( %Main* %tmp.1451, %Expr* %tmp.1443, %Expr* %tmp.1450 )
	%tmp.1458 = load %Main*, %Main** %tmp.1244
	%tmp.1459 = icmp eq %Main* %tmp.1458, null
	br i1 %tmp.1459, label %abort, label %ok.65

ok.65:
	%tmp.1460 = getelementptr %Main, %Main* %tmp.1458, i32 0, i32 0
	%tmp.1461 = load %Main_vtable*, %Main_vtable** %tmp.1460
	%tmp.1462 = getelementptr %Main_vtable, %Main_vtable* %tmp.1461, i32 0, i32 14
	%tmp.1463 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1462
	%tmp.1464 = call %Expr*(%Main*) %tmp.1463( %Main* %tmp.1458 )
	%tmp.1465 = load %Main*, %Main** %tmp.1244
	%tmp.1466 = icmp eq %Main* %tmp.1465, null
	br i1 %tmp.1466, label %abort, label %ok.66

ok.66:
	%tmp.1467 = getelementptr %Main, %Main* %tmp.1465, i32 0, i32 0
	%tmp.1468 = load %Main_vtable*, %Main_vtable** %tmp.1467
	%tmp.1469 = getelementptr %Main_vtable, %Main_vtable* %tmp.1468, i32 0, i32 13
	%tmp.1470 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1469
	%tmp.1471 = bitcast %App* %tmp.1457 to %Expr*
	%tmp.1472 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1470( %Main* %tmp.1465, %Expr* %tmp.1471, %Expr* %tmp.1464 )
	%tmp.1473 = load %Main*, %Main** %tmp.1244
	%tmp.1474 = icmp eq %Main* %tmp.1473, null
	br i1 %tmp.1474, label %abort, label %ok.67

ok.67:
	%tmp.1475 = getelementptr %Main, %Main* %tmp.1473, i32 0, i32 0
	%tmp.1476 = load %Main_vtable*, %Main_vtable** %tmp.1475
	%tmp.1477 = getelementptr %Main_vtable, %Main_vtable* %tmp.1476, i32 0, i32 14
	%tmp.1478 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1477
	%tmp.1479 = call %Expr*(%Main*) %tmp.1478( %Main* %tmp.1473 )
	%tmp.1480 = load %Main*, %Main** %tmp.1244
	%tmp.1481 = icmp eq %Main* %tmp.1480, null
	br i1 %tmp.1481, label %abort, label %ok.68

ok.68:
	%tmp.1482 = getelementptr %Main, %Main* %tmp.1480, i32 0, i32 0
	%tmp.1483 = load %Main_vtable*, %Main_vtable** %tmp.1482
	%tmp.1484 = getelementptr %Main_vtable, %Main_vtable* %tmp.1483, i32 0, i32 13
	%tmp.1485 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1484
	%tmp.1486 = bitcast %App* %tmp.1472 to %Expr*
	%tmp.1487 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1485( %Main* %tmp.1480, %Expr* %tmp.1486, %Expr* %tmp.1479 )
	%tmp.1488 = load %Main*, %Main** %tmp.1244
	%tmp.1489 = icmp eq %Main* %tmp.1488, null
	br i1 %tmp.1489, label %abort, label %ok.69

ok.69:
	%tmp.1490 = getelementptr %Main, %Main* %tmp.1488, i32 0, i32 0
	%tmp.1491 = load %Main_vtable*, %Main_vtable** %tmp.1490
	%tmp.1492 = getelementptr %Main_vtable, %Main_vtable* %tmp.1491, i32 0, i32 20
	%tmp.1493 = load %Main* (%Main*,%Expr*) *, %Main* (%Main*,%Expr*) ** %tmp.1492
	%tmp.1494 = bitcast %App* %tmp.1487 to %Expr*
	%tmp.1495 = call %Main*(%Main*, %Expr*) %tmp.1493( %Main* %tmp.1488, %Expr* %tmp.1494 )
	%tmp.1496 = load %Main*, %Main** %tmp.1244
	%tmp.1497 = icmp eq %Main* %tmp.1496, null
	br i1 %tmp.1497, label %abort, label %ok.70

ok.70:
	%tmp.1498 = getelementptr %Main, %Main* %tmp.1496, i32 0, i32 0
	%tmp.1499 = load %Main_vtable*, %Main_vtable** %tmp.1498
	%tmp.1500 = getelementptr %Main_vtable, %Main_vtable* %tmp.1499, i32 0, i32 14
	%tmp.1501 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1500
	%tmp.1502 = call %Expr*(%Main*) %tmp.1501( %Main* %tmp.1496 )
	%tmp.1503 = load %Main*, %Main** %tmp.1244
	%tmp.1504 = icmp eq %Main* %tmp.1503, null
	br i1 %tmp.1504, label %abort, label %ok.71

ok.71:
	%tmp.1505 = getelementptr %Main, %Main* %tmp.1503, i32 0, i32 0
	%tmp.1506 = load %Main_vtable*, %Main_vtable** %tmp.1505
	%tmp.1507 = getelementptr %Main_vtable, %Main_vtable* %tmp.1506, i32 0, i32 15
	%tmp.1508 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1507
	%tmp.1509 = call %Expr*(%Main*) %tmp.1508( %Main* %tmp.1503 )
	%tmp.1510 = load %Main*, %Main** %tmp.1244
	%tmp.1511 = icmp eq %Main* %tmp.1510, null
	br i1 %tmp.1511, label %abort, label %ok.72

ok.72:
	%tmp.1512 = getelementptr %Main, %Main* %tmp.1510, i32 0, i32 0
	%tmp.1513 = load %Main_vtable*, %Main_vtable** %tmp.1512
	%tmp.1514 = getelementptr %Main_vtable, %Main_vtable* %tmp.1513, i32 0, i32 13
	%tmp.1515 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1514
	%tmp.1516 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1515( %Main* %tmp.1510, %Expr* %tmp.1502, %Expr* %tmp.1509 )
	%tmp.1517 = load %Main*, %Main** %tmp.1244
	%tmp.1518 = icmp eq %Main* %tmp.1517, null
	br i1 %tmp.1518, label %abort, label %ok.73

ok.73:
	%tmp.1519 = getelementptr %Main, %Main* %tmp.1517, i32 0, i32 0
	%tmp.1520 = load %Main_vtable*, %Main_vtable** %tmp.1519
	%tmp.1521 = getelementptr %Main_vtable, %Main_vtable* %tmp.1520, i32 0, i32 16
	%tmp.1522 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1521
	%tmp.1523 = call %Expr*(%Main*) %tmp.1522( %Main* %tmp.1517 )
	%tmp.1524 = load %Main*, %Main** %tmp.1244
	%tmp.1525 = icmp eq %Main* %tmp.1524, null
	br i1 %tmp.1525, label %abort, label %ok.74

ok.74:
	%tmp.1526 = getelementptr %Main, %Main* %tmp.1524, i32 0, i32 0
	%tmp.1527 = load %Main_vtable*, %Main_vtable** %tmp.1526
	%tmp.1528 = getelementptr %Main_vtable, %Main_vtable* %tmp.1527, i32 0, i32 13
	%tmp.1529 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1528
	%tmp.1530 = bitcast %App* %tmp.1516 to %Expr*
	%tmp.1531 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1529( %Main* %tmp.1524, %Expr* %tmp.1530, %Expr* %tmp.1523 )
	%tmp.1532 = load %Main*, %Main** %tmp.1244
	%tmp.1533 = icmp eq %Main* %tmp.1532, null
	br i1 %tmp.1533, label %abort, label %ok.75

ok.75:
	%tmp.1534 = getelementptr %Main, %Main* %tmp.1532, i32 0, i32 0
	%tmp.1535 = load %Main_vtable*, %Main_vtable** %tmp.1534
	%tmp.1536 = getelementptr %Main_vtable, %Main_vtable* %tmp.1535, i32 0, i32 16
	%tmp.1537 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1536
	%tmp.1538 = call %Expr*(%Main*) %tmp.1537( %Main* %tmp.1532 )
	%tmp.1539 = load %Main*, %Main** %tmp.1244
	%tmp.1540 = icmp eq %Main* %tmp.1539, null
	br i1 %tmp.1540, label %abort, label %ok.76

ok.76:
	%tmp.1541 = getelementptr %Main, %Main* %tmp.1539, i32 0, i32 0
	%tmp.1542 = load %Main_vtable*, %Main_vtable** %tmp.1541
	%tmp.1543 = getelementptr %Main_vtable, %Main_vtable* %tmp.1542, i32 0, i32 13
	%tmp.1544 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1543
	%tmp.1545 = bitcast %App* %tmp.1531 to %Expr*
	%tmp.1546 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1544( %Main* %tmp.1539, %Expr* %tmp.1545, %Expr* %tmp.1538 )
	%tmp.1547 = load %Main*, %Main** %tmp.1244
	%tmp.1548 = icmp eq %Main* %tmp.1547, null
	br i1 %tmp.1548, label %abort, label %ok.77

ok.77:
	%tmp.1549 = getelementptr %Main, %Main* %tmp.1547, i32 0, i32 0
	%tmp.1550 = load %Main_vtable*, %Main_vtable** %tmp.1549
	%tmp.1551 = getelementptr %Main_vtable, %Main_vtable* %tmp.1550, i32 0, i32 15
	%tmp.1552 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1551
	%tmp.1553 = call %Expr*(%Main*) %tmp.1552( %Main* %tmp.1547 )
	%tmp.1554 = load %Main*, %Main** %tmp.1244
	%tmp.1555 = icmp eq %Main* %tmp.1554, null
	br i1 %tmp.1555, label %abort, label %ok.78

ok.78:
	%tmp.1556 = getelementptr %Main, %Main* %tmp.1554, i32 0, i32 0
	%tmp.1557 = load %Main_vtable*, %Main_vtable** %tmp.1556
	%tmp.1558 = getelementptr %Main_vtable, %Main_vtable* %tmp.1557, i32 0, i32 13
	%tmp.1559 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1558
	%tmp.1560 = bitcast %App* %tmp.1546 to %Expr*
	%tmp.1561 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1559( %Main* %tmp.1554, %Expr* %tmp.1560, %Expr* %tmp.1553 )
	%tmp.1562 = load %Main*, %Main** %tmp.1244
	%tmp.1563 = icmp eq %Main* %tmp.1562, null
	br i1 %tmp.1563, label %abort, label %ok.79

ok.79:
	%tmp.1564 = getelementptr %Main, %Main* %tmp.1562, i32 0, i32 0
	%tmp.1565 = load %Main_vtable*, %Main_vtable** %tmp.1564
	%tmp.1566 = getelementptr %Main_vtable, %Main_vtable* %tmp.1565, i32 0, i32 16
	%tmp.1567 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1566
	%tmp.1568 = call %Expr*(%Main*) %tmp.1567( %Main* %tmp.1562 )
	%tmp.1569 = load %Main*, %Main** %tmp.1244
	%tmp.1570 = icmp eq %Main* %tmp.1569, null
	br i1 %tmp.1570, label %abort, label %ok.80

ok.80:
	%tmp.1571 = getelementptr %Main, %Main* %tmp.1569, i32 0, i32 0
	%tmp.1572 = load %Main_vtable*, %Main_vtable** %tmp.1571
	%tmp.1573 = getelementptr %Main_vtable, %Main_vtable* %tmp.1572, i32 0, i32 13
	%tmp.1574 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1573
	%tmp.1575 = bitcast %App* %tmp.1561 to %Expr*
	%tmp.1576 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1574( %Main* %tmp.1569, %Expr* %tmp.1575, %Expr* %tmp.1568 )
	%tmp.1577 = load %Main*, %Main** %tmp.1244
	%tmp.1578 = icmp eq %Main* %tmp.1577, null
	br i1 %tmp.1578, label %abort, label %ok.81

ok.81:
	%tmp.1579 = getelementptr %Main, %Main* %tmp.1577, i32 0, i32 0
	%tmp.1580 = load %Main_vtable*, %Main_vtable** %tmp.1579
	%tmp.1581 = getelementptr %Main_vtable, %Main_vtable* %tmp.1580, i32 0, i32 14
	%tmp.1582 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1581
	%tmp.1583 = call %Expr*(%Main*) %tmp.1582( %Main* %tmp.1577 )
	%tmp.1584 = load %Main*, %Main** %tmp.1244
	%tmp.1585 = icmp eq %Main* %tmp.1584, null
	br i1 %tmp.1585, label %abort, label %ok.82

ok.82:
	%tmp.1586 = getelementptr %Main, %Main* %tmp.1584, i32 0, i32 0
	%tmp.1587 = load %Main_vtable*, %Main_vtable** %tmp.1586
	%tmp.1588 = getelementptr %Main_vtable, %Main_vtable* %tmp.1587, i32 0, i32 13
	%tmp.1589 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1588
	%tmp.1590 = bitcast %App* %tmp.1576 to %Expr*
	%tmp.1591 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1589( %Main* %tmp.1584, %Expr* %tmp.1590, %Expr* %tmp.1583 )
	%tmp.1592 = load %Main*, %Main** %tmp.1244
	%tmp.1593 = icmp eq %Main* %tmp.1592, null
	br i1 %tmp.1593, label %abort, label %ok.83

ok.83:
	%tmp.1594 = getelementptr %Main, %Main* %tmp.1592, i32 0, i32 0
	%tmp.1595 = load %Main_vtable*, %Main_vtable** %tmp.1594
	%tmp.1596 = getelementptr %Main_vtable, %Main_vtable* %tmp.1595, i32 0, i32 15
	%tmp.1597 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1596
	%tmp.1598 = call %Expr*(%Main*) %tmp.1597( %Main* %tmp.1592 )
	%tmp.1599 = load %Main*, %Main** %tmp.1244
	%tmp.1600 = icmp eq %Main* %tmp.1599, null
	br i1 %tmp.1600, label %abort, label %ok.84

ok.84:
	%tmp.1601 = getelementptr %Main, %Main* %tmp.1599, i32 0, i32 0
	%tmp.1602 = load %Main_vtable*, %Main_vtable** %tmp.1601
	%tmp.1603 = getelementptr %Main_vtable, %Main_vtable* %tmp.1602, i32 0, i32 13
	%tmp.1604 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1603
	%tmp.1605 = bitcast %App* %tmp.1591 to %Expr*
	%tmp.1606 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1604( %Main* %tmp.1599, %Expr* %tmp.1605, %Expr* %tmp.1598 )
	%tmp.1607 = load %Main*, %Main** %tmp.1244
	%tmp.1608 = icmp eq %Main* %tmp.1607, null
	br i1 %tmp.1608, label %abort, label %ok.85

ok.85:
	%tmp.1609 = getelementptr %Main, %Main* %tmp.1607, i32 0, i32 0
	%tmp.1610 = load %Main_vtable*, %Main_vtable** %tmp.1609
	%tmp.1611 = getelementptr %Main_vtable, %Main_vtable* %tmp.1610, i32 0, i32 14
	%tmp.1612 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1611
	%tmp.1613 = call %Expr*(%Main*) %tmp.1612( %Main* %tmp.1607 )
	%tmp.1614 = load %Main*, %Main** %tmp.1244
	%tmp.1615 = icmp eq %Main* %tmp.1614, null
	br i1 %tmp.1615, label %abort, label %ok.86

ok.86:
	%tmp.1616 = getelementptr %Main, %Main* %tmp.1614, i32 0, i32 0
	%tmp.1617 = load %Main_vtable*, %Main_vtable** %tmp.1616
	%tmp.1618 = getelementptr %Main_vtable, %Main_vtable* %tmp.1617, i32 0, i32 13
	%tmp.1619 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1618
	%tmp.1620 = bitcast %App* %tmp.1606 to %Expr*
	%tmp.1621 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1619( %Main* %tmp.1614, %Expr* %tmp.1620, %Expr* %tmp.1613 )
	%tmp.1622 = load %Main*, %Main** %tmp.1244
	%tmp.1623 = icmp eq %Main* %tmp.1622, null
	br i1 %tmp.1623, label %abort, label %ok.87

ok.87:
	%tmp.1624 = getelementptr %Main, %Main* %tmp.1622, i32 0, i32 0
	%tmp.1625 = load %Main_vtable*, %Main_vtable** %tmp.1624
	%tmp.1626 = getelementptr %Main_vtable, %Main_vtable* %tmp.1625, i32 0, i32 20
	%tmp.1627 = load %Main* (%Main*,%Expr*) *, %Main* (%Main*,%Expr*) ** %tmp.1626
	%tmp.1628 = bitcast %App* %tmp.1621 to %Expr*
	%tmp.1629 = call %Main*(%Main*, %Expr*) %tmp.1627( %Main* %tmp.1622, %Expr* %tmp.1628 )
	%tmp.1630 = load %Main*, %Main** %tmp.1244
	%tmp.1631 = icmp eq %Main* %tmp.1630, null
	br i1 %tmp.1631, label %abort, label %ok.88

ok.88:
	%tmp.1632 = getelementptr %Main, %Main* %tmp.1630, i32 0, i32 0
	%tmp.1633 = load %Main_vtable*, %Main_vtable** %tmp.1632
	%tmp.1634 = getelementptr %Main_vtable, %Main_vtable* %tmp.1633, i32 0, i32 14
	%tmp.1635 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1634
	%tmp.1636 = call %Expr*(%Main*) %tmp.1635( %Main* %tmp.1630 )
	%tmp.1637 = load %Main*, %Main** %tmp.1244
	%tmp.1638 = icmp eq %Main* %tmp.1637, null
	br i1 %tmp.1638, label %abort, label %ok.89

ok.89:
	%tmp.1639 = getelementptr %Main, %Main* %tmp.1637, i32 0, i32 0
	%tmp.1640 = load %Main_vtable*, %Main_vtable** %tmp.1639
	%tmp.1641 = getelementptr %Main_vtable, %Main_vtable* %tmp.1640, i32 0, i32 15
	%tmp.1642 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1641
	%tmp.1643 = call %Expr*(%Main*) %tmp.1642( %Main* %tmp.1637 )
	%tmp.1644 = load %Main*, %Main** %tmp.1244
	%tmp.1645 = icmp eq %Main* %tmp.1644, null
	br i1 %tmp.1645, label %abort, label %ok.90

ok.90:
	%tmp.1646 = getelementptr %Main, %Main* %tmp.1644, i32 0, i32 0
	%tmp.1647 = load %Main_vtable*, %Main_vtable** %tmp.1646
	%tmp.1648 = getelementptr %Main_vtable, %Main_vtable* %tmp.1647, i32 0, i32 16
	%tmp.1649 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1648
	%tmp.1650 = call %Expr*(%Main*) %tmp.1649( %Main* %tmp.1644 )
	%tmp.1651 = load %Main*, %Main** %tmp.1244
	%tmp.1652 = icmp eq %Main* %tmp.1651, null
	br i1 %tmp.1652, label %abort, label %ok.91

ok.91:
	%tmp.1653 = getelementptr %Main, %Main* %tmp.1651, i32 0, i32 0
	%tmp.1654 = load %Main_vtable*, %Main_vtable** %tmp.1653
	%tmp.1655 = getelementptr %Main_vtable, %Main_vtable* %tmp.1654, i32 0, i32 13
	%tmp.1656 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1655
	%tmp.1657 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1656( %Main* %tmp.1651, %Expr* %tmp.1643, %Expr* %tmp.1650 )
	%tmp.1658 = load %Main*, %Main** %tmp.1244
	%tmp.1659 = icmp eq %Main* %tmp.1658, null
	br i1 %tmp.1659, label %abort, label %ok.92

ok.92:
	%tmp.1660 = getelementptr %Main, %Main* %tmp.1658, i32 0, i32 0
	%tmp.1661 = load %Main_vtable*, %Main_vtable** %tmp.1660
	%tmp.1662 = getelementptr %Main_vtable, %Main_vtable* %tmp.1661, i32 0, i32 13
	%tmp.1663 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1662
	%tmp.1664 = bitcast %App* %tmp.1657 to %Expr*
	%tmp.1665 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1663( %Main* %tmp.1658, %Expr* %tmp.1636, %Expr* %tmp.1664 )
	%tmp.1666 = load %Main*, %Main** %tmp.1244
	%tmp.1667 = icmp eq %Main* %tmp.1666, null
	br i1 %tmp.1667, label %abort, label %ok.93

ok.93:
	%tmp.1668 = getelementptr %Main, %Main* %tmp.1666, i32 0, i32 0
	%tmp.1669 = load %Main_vtable*, %Main_vtable** %tmp.1668
	%tmp.1670 = getelementptr %Main_vtable, %Main_vtable* %tmp.1669, i32 0, i32 15
	%tmp.1671 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1670
	%tmp.1672 = call %Expr*(%Main*) %tmp.1671( %Main* %tmp.1666 )
	%tmp.1673 = load %Main*, %Main** %tmp.1244
	%tmp.1674 = icmp eq %Main* %tmp.1673, null
	br i1 %tmp.1674, label %abort, label %ok.94

ok.94:
	%tmp.1675 = getelementptr %Main, %Main* %tmp.1673, i32 0, i32 0
	%tmp.1676 = load %Main_vtable*, %Main_vtable** %tmp.1675
	%tmp.1677 = getelementptr %Main_vtable, %Main_vtable* %tmp.1676, i32 0, i32 16
	%tmp.1678 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1677
	%tmp.1679 = call %Expr*(%Main*) %tmp.1678( %Main* %tmp.1673 )
	%tmp.1680 = load %Main*, %Main** %tmp.1244
	%tmp.1681 = icmp eq %Main* %tmp.1680, null
	br i1 %tmp.1681, label %abort, label %ok.95

ok.95:
	%tmp.1682 = getelementptr %Main, %Main* %tmp.1680, i32 0, i32 0
	%tmp.1683 = load %Main_vtable*, %Main_vtable** %tmp.1682
	%tmp.1684 = getelementptr %Main_vtable, %Main_vtable* %tmp.1683, i32 0, i32 16
	%tmp.1685 = load %Expr* (%Main*) *, %Expr* (%Main*) ** %tmp.1684
	%tmp.1686 = call %Expr*(%Main*) %tmp.1685( %Main* %tmp.1680 )
	%tmp.1687 = load %Main*, %Main** %tmp.1244
	%tmp.1688 = icmp eq %Main* %tmp.1687, null
	br i1 %tmp.1688, label %abort, label %ok.96

ok.96:
	%tmp.1689 = getelementptr %Main, %Main* %tmp.1687, i32 0, i32 0
	%tmp.1690 = load %Main_vtable*, %Main_vtable** %tmp.1689
	%tmp.1691 = getelementptr %Main_vtable, %Main_vtable* %tmp.1690, i32 0, i32 13
	%tmp.1692 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1691
	%tmp.1693 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1692( %Main* %tmp.1687, %Expr* %tmp.1679, %Expr* %tmp.1686 )
	%tmp.1694 = load %Main*, %Main** %tmp.1244
	%tmp.1695 = icmp eq %Main* %tmp.1694, null
	br i1 %tmp.1695, label %abort, label %ok.97

ok.97:
	%tmp.1696 = getelementptr %Main, %Main* %tmp.1694, i32 0, i32 0
	%tmp.1697 = load %Main_vtable*, %Main_vtable** %tmp.1696
	%tmp.1698 = getelementptr %Main_vtable, %Main_vtable* %tmp.1697, i32 0, i32 13
	%tmp.1699 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1698
	%tmp.1700 = bitcast %App* %tmp.1693 to %Expr*
	%tmp.1701 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1699( %Main* %tmp.1694, %Expr* %tmp.1672, %Expr* %tmp.1700 )
	%tmp.1702 = load %Main*, %Main** %tmp.1244
	%tmp.1703 = icmp eq %Main* %tmp.1702, null
	br i1 %tmp.1703, label %abort, label %ok.98

ok.98:
	%tmp.1704 = getelementptr %Main, %Main* %tmp.1702, i32 0, i32 0
	%tmp.1705 = load %Main_vtable*, %Main_vtable** %tmp.1704
	%tmp.1706 = getelementptr %Main_vtable, %Main_vtable* %tmp.1705, i32 0, i32 13
	%tmp.1707 = load %App* (%Main*,%Expr*,%Expr*) *, %App* (%Main*,%Expr*,%Expr*) ** %tmp.1706
	%tmp.1708 = bitcast %App* %tmp.1665 to %Expr*
	%tmp.1709 = bitcast %App* %tmp.1701 to %Expr*
	%tmp.1710 = call %App*(%Main*, %Expr*, %Expr*) %tmp.1707( %Main* %tmp.1702, %Expr* %tmp.1708, %Expr* %tmp.1709 )
	%tmp.1711 = load %Main*, %Main** %tmp.1244
	%tmp.1712 = icmp eq %Main* %tmp.1711, null
	br i1 %tmp.1712, label %abort, label %ok.99

ok.99:
	%tmp.1713 = getelementptr %Main, %Main* %tmp.1711, i32 0, i32 0
	%tmp.1714 = load %Main_vtable*, %Main_vtable** %tmp.1713
	%tmp.1715 = getelementptr %Main_vtable, %Main_vtable* %tmp.1714, i32 0, i32 20
	%tmp.1716 = load %Main* (%Main*,%Expr*) *, %Main* (%Main*,%Expr*) ** %tmp.1715
	%tmp.1717 = bitcast %App* %tmp.1710 to %Expr*
	%tmp.1718 = call %Main*(%Main*, %Expr*) %tmp.1716( %Main* %tmp.1711, %Expr* %tmp.1717 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.1719 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.1720 = load i32, i32* %tmp.1719
	%tmp.1721 = call i8*(i32) @malloc( i32 %tmp.1720 )
	%tmp.1722 = bitcast i8* %tmp.1721 to %Main*
	%tmp.1723 = getelementptr %Main, %Main* %tmp.1722, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.1723
	%tmp.1724 = alloca %Main*
	store %Main* %tmp.1722, %Main** %tmp.1724
	ret %Main* %tmp.1722

abort:
	call void @abort(  )
	unreachable
}

define i1 @LambdaList_isNil(%LambdaList* %self) {

entry:
	%tmp.1725 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1725
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @LambdaList_headE(%LambdaList* %self) {

entry:
	%tmp.1726 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1726
	%tmp.1727 = load %LambdaList*, %LambdaList** %tmp.1726
	%tmp.1728 = icmp eq %LambdaList* %tmp.1727, null
	br i1 %tmp.1728, label %abort, label %ok.0

ok.0:
	%tmp.1729 = getelementptr %LambdaList, %LambdaList* %tmp.1727, i32 0, i32 0
	%tmp.1730 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1729
	%tmp.1731 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1730, i32 0, i32 4
	%tmp.1732 = load %Object* (%LambdaList*) *, %Object* (%LambdaList*) ** %tmp.1731
	%tmp.1733 = call %Object*(%LambdaList*) %tmp.1732( %LambdaList* %tmp.1727 )
	%tmp.1734 = call %VarList* @VarList_new(  )
	ret %VarList* %tmp.1734

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @LambdaList_headC(%LambdaList* %self) {

entry:
	%tmp.1735 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1735
	%tmp.1736 = load %LambdaList*, %LambdaList** %tmp.1735
	%tmp.1737 = icmp eq %LambdaList* %tmp.1736, null
	br i1 %tmp.1737, label %abort, label %ok.1

ok.1:
	%tmp.1738 = getelementptr %LambdaList, %LambdaList* %tmp.1736, i32 0, i32 0
	%tmp.1739 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1738
	%tmp.1740 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1739, i32 0, i32 4
	%tmp.1741 = load %Object* (%LambdaList*) *, %Object* (%LambdaList*) ** %tmp.1740
	%tmp.1742 = call %Object*(%LambdaList*) %tmp.1741( %LambdaList* %tmp.1736 )
	%tmp.1743 = call %Lambda* @Lambda_new(  )
	ret %Lambda* %tmp.1743

abort:
	call void @abort(  )
	unreachable
}

define i32 @LambdaList_headN(%LambdaList* %self) {

entry:
	%tmp.1744 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1744
	%tmp.1745 = load %LambdaList*, %LambdaList** %tmp.1744
	%tmp.1746 = icmp eq %LambdaList* %tmp.1745, null
	br i1 %tmp.1746, label %abort, label %ok.2

ok.2:
	%tmp.1747 = getelementptr %LambdaList, %LambdaList* %tmp.1745, i32 0, i32 0
	%tmp.1748 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1747
	%tmp.1749 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1748, i32 0, i32 4
	%tmp.1750 = load %Object* (%LambdaList*) *, %Object* (%LambdaList*) ** %tmp.1749
	%tmp.1751 = call %Object*(%LambdaList*) %tmp.1750( %LambdaList* %tmp.1745 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define %LambdaList* @LambdaList_tail(%LambdaList* %self) {

entry:
	%tmp.1752 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1752
	%tmp.1753 = load %LambdaList*, %LambdaList** %tmp.1752
	%tmp.1754 = icmp eq %LambdaList* %tmp.1753, null
	br i1 %tmp.1754, label %abort, label %ok.3

ok.3:
	%tmp.1755 = getelementptr %LambdaList, %LambdaList* %tmp.1753, i32 0, i32 0
	%tmp.1756 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1755
	%tmp.1757 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1756, i32 0, i32 4
	%tmp.1758 = load %Object* (%LambdaList*) *, %Object* (%LambdaList*) ** %tmp.1757
	%tmp.1759 = call %Object*(%LambdaList*) %tmp.1758( %LambdaList* %tmp.1753 )
	%tmp.1760 = call %LambdaList* @LambdaList_new(  )
	ret %LambdaList* %tmp.1760

abort:
	call void @abort(  )
	unreachable
}

define %LambdaList* @LambdaList_add(%LambdaList* %self, %VarList* %e, %Lambda* %x, i32 %n) {

entry:
	%tmp.1761 = alloca %LambdaList*
	store %LambdaList* %self, %LambdaList** %tmp.1761
	%tmp.1762 = alloca %VarList*
	store %VarList* %e, %VarList** %tmp.1762
	%tmp.1763 = alloca %Lambda*
	store %Lambda* %x, %Lambda** %tmp.1763
	%tmp.1764 = alloca i32
	store i32 %n, i32* %tmp.1764
	%tmp.1765 = load %VarList*, %VarList** %tmp.1762
	%tmp.1766 = load %Lambda*, %Lambda** %tmp.1763
	%tmp.1767 = load i32, i32* %tmp.1764
	%tmp.1768 = load %LambdaList*, %LambdaList** %tmp.1761
	%tmp.1769 = call %LambdaListNE* @LambdaListNE_new(  )
	%tmp.1770 = icmp eq %LambdaListNE* %tmp.1769, null
	br i1 %tmp.1770, label %abort, label %ok.4

ok.4:
	%tmp.1771 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1769, i32 0, i32 0
	%tmp.1772 = load %LambdaListNE_vtable*, %LambdaListNE_vtable** %tmp.1771
	%tmp.1773 = getelementptr %LambdaListNE_vtable, %LambdaListNE_vtable* %tmp.1772, i32 0, i32 13
	%tmp.1774 = load %LambdaListNE* (%LambdaListNE*,%VarList*,%Lambda*,i32,%LambdaList*) *, %LambdaListNE* (%LambdaListNE*,%VarList*,%Lambda*,i32,%LambdaList*) ** %tmp.1773
	%tmp.1775 = call %LambdaListNE*(%LambdaListNE*, %VarList*, %Lambda*, i32, %LambdaList*) %tmp.1774( %LambdaListNE* %tmp.1769, %VarList* %tmp.1765, %Lambda* %tmp.1766, i32 %tmp.1767, %LambdaList* %tmp.1768 )
	%tmp.1776 = bitcast %LambdaListNE* %tmp.1775 to %LambdaList*
	ret %LambdaList* %tmp.1776

abort:
	call void @abort(  )
	unreachable
}

define %LambdaList* @LambdaList_new() {

entry:
	%tmp.1777 = getelementptr %LambdaList_vtable, %LambdaList_vtable* @LambdaList_vtable_prototype, i32 0, i32 1
	%tmp.1778 = load i32, i32* %tmp.1777
	%tmp.1779 = call i8*(i32) @malloc( i32 %tmp.1778 )
	%tmp.1780 = bitcast i8* %tmp.1779 to %LambdaList*
	%tmp.1781 = getelementptr %LambdaList, %LambdaList* %tmp.1780, i32 0, i32 0
	store %LambdaList_vtable* @LambdaList_vtable_prototype, %LambdaList_vtable** %tmp.1781
	%tmp.1782 = alloca %LambdaList*
	store %LambdaList* %tmp.1780, %LambdaList** %tmp.1782
	ret %LambdaList* %tmp.1780

abort:
	call void @abort(  )
	unreachable
}

define i1 @LambdaListNE_isNil(%LambdaListNE* %self) {

entry:
	%tmp.1783 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1783
	ret i1 false

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @LambdaListNE_headE(%LambdaListNE* %self) {

entry:
	%tmp.1784 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1784
	%tmp.1785 = load %LambdaListNE*, %LambdaListNE** %tmp.1784
	%tmp.1786 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1785, i32 0, i32 3
	%tmp.1787 = load %VarList*, %VarList** %tmp.1786
	ret %VarList* %tmp.1787

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @LambdaListNE_headC(%LambdaListNE* %self) {

entry:
	%tmp.1788 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1788
	%tmp.1789 = load %LambdaListNE*, %LambdaListNE** %tmp.1788
	%tmp.1790 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1789, i32 0, i32 1
	%tmp.1791 = load %Lambda*, %Lambda** %tmp.1790
	ret %Lambda* %tmp.1791

abort:
	call void @abort(  )
	unreachable
}

define i32 @LambdaListNE_headN(%LambdaListNE* %self) {

entry:
	%tmp.1792 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1792
	%tmp.1793 = load %LambdaListNE*, %LambdaListNE** %tmp.1792
	%tmp.1794 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1793, i32 0, i32 2
	%tmp.1795 = load i32, i32* %tmp.1794
	ret i32 %tmp.1795

abort:
	call void @abort(  )
	unreachable
}

define %LambdaList* @LambdaListNE_tail(%LambdaListNE* %self) {

entry:
	%tmp.1796 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1796
	%tmp.1797 = load %LambdaListNE*, %LambdaListNE** %tmp.1796
	%tmp.1798 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1797, i32 0, i32 4
	%tmp.1799 = load %LambdaList*, %LambdaList** %tmp.1798
	ret %LambdaList* %tmp.1799

abort:
	call void @abort(  )
	unreachable
}

define %LambdaListNE* @LambdaListNE_init(%LambdaListNE* %self, %VarList* %e, %Lambda* %l, i32 %n, %LambdaList* %r) {

entry:
	%tmp.1800 = alloca %LambdaListNE*
	store %LambdaListNE* %self, %LambdaListNE** %tmp.1800
	%tmp.1801 = alloca %VarList*
	store %VarList* %e, %VarList** %tmp.1801
	%tmp.1802 = alloca %Lambda*
	store %Lambda* %l, %Lambda** %tmp.1802
	%tmp.1803 = alloca i32
	store i32 %n, i32* %tmp.1803
	%tmp.1804 = alloca %LambdaList*
	store %LambdaList* %r, %LambdaList** %tmp.1804
	%tmp.1805 = load %VarList*, %VarList** %tmp.1801
	%tmp.1806 = load %LambdaListNE*, %LambdaListNE** %tmp.1800
	%tmp.1807 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1806, i32 0, i32 3
	store %VarList* %tmp.1805, %VarList** %tmp.1807
	%tmp.1808 = load %Lambda*, %Lambda** %tmp.1802
	%tmp.1809 = load %LambdaListNE*, %LambdaListNE** %tmp.1800
	%tmp.1810 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1809, i32 0, i32 1
	store %Lambda* %tmp.1808, %Lambda** %tmp.1810
	%tmp.1811 = load i32, i32* %tmp.1803
	%tmp.1812 = load %LambdaListNE*, %LambdaListNE** %tmp.1800
	%tmp.1813 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1812, i32 0, i32 2
	store i32 %tmp.1811, i32* %tmp.1813
	%tmp.1814 = load %LambdaList*, %LambdaList** %tmp.1804
	%tmp.1815 = load %LambdaListNE*, %LambdaListNE** %tmp.1800
	%tmp.1816 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1815, i32 0, i32 4
	store %LambdaList* %tmp.1814, %LambdaList** %tmp.1816
	%tmp.1817 = load %LambdaListNE*, %LambdaListNE** %tmp.1800
	ret %LambdaListNE* %tmp.1817

abort:
	call void @abort(  )
	unreachable
}

define %LambdaListNE* @LambdaListNE_new() {

entry:
	%tmp.1818 = getelementptr %LambdaListNE_vtable, %LambdaListNE_vtable* @LambdaListNE_vtable_prototype, i32 0, i32 1
	%tmp.1819 = load i32, i32* %tmp.1818
	%tmp.1820 = call i8*(i32) @malloc( i32 %tmp.1819 )
	%tmp.1821 = bitcast i8* %tmp.1820 to %LambdaListNE*
	%tmp.1822 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1821, i32 0, i32 0
	store %LambdaListNE_vtable* @LambdaListNE_vtable_prototype, %LambdaListNE_vtable** %tmp.1822
	%tmp.1823 = alloca %LambdaListNE*
	store %LambdaListNE* %tmp.1821, %LambdaListNE** %tmp.1823
	%tmp.1824 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1821, i32 0, i32 1
	store %Lambda* null, %Lambda** %tmp.1824
	%tmp.1825 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1821, i32 0, i32 2
	store i32 0, i32* %tmp.1825
	%tmp.1826 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1821, i32 0, i32 3
	store %VarList* null, %VarList** %tmp.1826
	%tmp.1827 = getelementptr %LambdaListNE, %LambdaListNE* %tmp.1821, i32 0, i32 4
	store %LambdaList* null, %LambdaList** %tmp.1827
	ret %LambdaListNE* %tmp.1821

abort:
	call void @abort(  )
	unreachable
}

define i1 @LambdaListRef_isNil(%LambdaListRef* %self) {

entry:
	%tmp.1828 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1828
	%tmp.1829 = load %LambdaListRef*, %LambdaListRef** %tmp.1828
	%tmp.1830 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1829, i32 0, i32 2
	%tmp.1831 = load %LambdaList*, %LambdaList** %tmp.1830
	%tmp.1832 = icmp eq %LambdaList* %tmp.1831, null
	br i1 %tmp.1832, label %abort, label %ok.0

ok.0:
	%tmp.1833 = getelementptr %LambdaList, %LambdaList* %tmp.1831, i32 0, i32 0
	%tmp.1834 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1833
	%tmp.1835 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1834, i32 0, i32 7
	%tmp.1836 = load i1 (%LambdaList*) *, i1 (%LambdaList*) ** %tmp.1835
	%tmp.1837 = call i1(%LambdaList*) %tmp.1836( %LambdaList* %tmp.1831 )
	ret i1 %tmp.1837

abort:
	call void @abort(  )
	unreachable
}

define %VarList* @LambdaListRef_headE(%LambdaListRef* %self) {

entry:
	%tmp.1838 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1838
	%tmp.1839 = load %LambdaListRef*, %LambdaListRef** %tmp.1838
	%tmp.1840 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1839, i32 0, i32 2
	%tmp.1841 = load %LambdaList*, %LambdaList** %tmp.1840
	%tmp.1842 = icmp eq %LambdaList* %tmp.1841, null
	br i1 %tmp.1842, label %abort, label %ok.1

ok.1:
	%tmp.1843 = getelementptr %LambdaList, %LambdaList* %tmp.1841, i32 0, i32 0
	%tmp.1844 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1843
	%tmp.1845 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1844, i32 0, i32 8
	%tmp.1846 = load %VarList* (%LambdaList*) *, %VarList* (%LambdaList*) ** %tmp.1845
	%tmp.1847 = call %VarList*(%LambdaList*) %tmp.1846( %LambdaList* %tmp.1841 )
	ret %VarList* %tmp.1847

abort:
	call void @abort(  )
	unreachable
}

define %Lambda* @LambdaListRef_headC(%LambdaListRef* %self) {

entry:
	%tmp.1848 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1848
	%tmp.1849 = load %LambdaListRef*, %LambdaListRef** %tmp.1848
	%tmp.1850 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1849, i32 0, i32 2
	%tmp.1851 = load %LambdaList*, %LambdaList** %tmp.1850
	%tmp.1852 = icmp eq %LambdaList* %tmp.1851, null
	br i1 %tmp.1852, label %abort, label %ok.2

ok.2:
	%tmp.1853 = getelementptr %LambdaList, %LambdaList* %tmp.1851, i32 0, i32 0
	%tmp.1854 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1853
	%tmp.1855 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1854, i32 0, i32 9
	%tmp.1856 = load %Lambda* (%LambdaList*) *, %Lambda* (%LambdaList*) ** %tmp.1855
	%tmp.1857 = call %Lambda*(%LambdaList*) %tmp.1856( %LambdaList* %tmp.1851 )
	ret %Lambda* %tmp.1857

abort:
	call void @abort(  )
	unreachable
}

define i32 @LambdaListRef_headN(%LambdaListRef* %self) {

entry:
	%tmp.1858 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1858
	%tmp.1859 = load %LambdaListRef*, %LambdaListRef** %tmp.1858
	%tmp.1860 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1859, i32 0, i32 2
	%tmp.1861 = load %LambdaList*, %LambdaList** %tmp.1860
	%tmp.1862 = icmp eq %LambdaList* %tmp.1861, null
	br i1 %tmp.1862, label %abort, label %ok.3

ok.3:
	%tmp.1863 = getelementptr %LambdaList, %LambdaList* %tmp.1861, i32 0, i32 0
	%tmp.1864 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1863
	%tmp.1865 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1864, i32 0, i32 10
	%tmp.1866 = load i32 (%LambdaList*) *, i32 (%LambdaList*) ** %tmp.1865
	%tmp.1867 = call i32(%LambdaList*) %tmp.1866( %LambdaList* %tmp.1861 )
	ret i32 %tmp.1867

abort:
	call void @abort(  )
	unreachable
}

define %LambdaListRef* @LambdaListRef_reset(%LambdaListRef* %self) {

entry:
	%tmp.1868 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1868
	%tmp.1869 = load %LambdaListRef*, %LambdaListRef** %tmp.1868
	%tmp.1870 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1869, i32 0, i32 1
	store i32 0, i32* %tmp.1870
	%tmp.1871 = call %LambdaList* @LambdaList_new(  )
	%tmp.1872 = load %LambdaListRef*, %LambdaListRef** %tmp.1868
	%tmp.1873 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1872, i32 0, i32 2
	store %LambdaList* %tmp.1871, %LambdaList** %tmp.1873
	%tmp.1874 = load %LambdaListRef*, %LambdaListRef** %tmp.1868
	ret %LambdaListRef* %tmp.1874

abort:
	call void @abort(  )
	unreachable
}

define i32 @LambdaListRef_add(%LambdaListRef* %self, %VarList* %env, %Lambda* %c) {

entry:
	%tmp.1875 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1875
	%tmp.1876 = alloca %VarList*
	store %VarList* %env, %VarList** %tmp.1876
	%tmp.1877 = alloca %Lambda*
	store %Lambda* %c, %Lambda** %tmp.1877
	%tmp.1878 = load %VarList*, %VarList** %tmp.1876
	%tmp.1879 = load %Lambda*, %Lambda** %tmp.1877
	%tmp.1880 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1881 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1880, i32 0, i32 1
	%tmp.1882 = load i32, i32* %tmp.1881
	%tmp.1883 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1884 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1883, i32 0, i32 2
	%tmp.1885 = load %LambdaList*, %LambdaList** %tmp.1884
	%tmp.1886 = icmp eq %LambdaList* %tmp.1885, null
	br i1 %tmp.1886, label %abort, label %ok.4

ok.4:
	%tmp.1887 = getelementptr %LambdaList, %LambdaList* %tmp.1885, i32 0, i32 0
	%tmp.1888 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1887
	%tmp.1889 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1888, i32 0, i32 12
	%tmp.1890 = load %LambdaList* (%LambdaList*,%VarList*,%Lambda*,i32) *, %LambdaList* (%LambdaList*,%VarList*,%Lambda*,i32) ** %tmp.1889
	%tmp.1891 = call %LambdaList*(%LambdaList*, %VarList*, %Lambda*, i32) %tmp.1890( %LambdaList* %tmp.1885, %VarList* %tmp.1878, %Lambda* %tmp.1879, i32 %tmp.1882 )
	%tmp.1892 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1893 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1892, i32 0, i32 2
	store %LambdaList* %tmp.1891, %LambdaList** %tmp.1893
	%tmp.1894 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1895 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1894, i32 0, i32 1
	%tmp.1896 = load i32, i32* %tmp.1895
	%tmp.1897 = add i32 %tmp.1896, 1
	%tmp.1898 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1899 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1898, i32 0, i32 1
	store i32 %tmp.1897, i32* %tmp.1899
	%tmp.1900 = load %LambdaListRef*, %LambdaListRef** %tmp.1875
	%tmp.1901 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1900, i32 0, i32 1
	%tmp.1902 = load i32, i32* %tmp.1901
	%tmp.1903 = sub i32 %tmp.1902, 1
	ret i32 %tmp.1903

abort:
	call void @abort(  )
	unreachable
}

define %LambdaListRef* @LambdaListRef_removeHead(%LambdaListRef* %self) {

entry:
	%tmp.1904 = alloca %LambdaListRef*
	store %LambdaListRef* %self, %LambdaListRef** %tmp.1904
	%tmp.1905 = load %LambdaListRef*, %LambdaListRef** %tmp.1904
	%tmp.1906 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1905, i32 0, i32 2
	%tmp.1907 = load %LambdaList*, %LambdaList** %tmp.1906
	%tmp.1908 = icmp eq %LambdaList* %tmp.1907, null
	br i1 %tmp.1908, label %abort, label %ok.5

ok.5:
	%tmp.1909 = getelementptr %LambdaList, %LambdaList* %tmp.1907, i32 0, i32 0
	%tmp.1910 = load %LambdaList_vtable*, %LambdaList_vtable** %tmp.1909
	%tmp.1911 = getelementptr %LambdaList_vtable, %LambdaList_vtable* %tmp.1910, i32 0, i32 11
	%tmp.1912 = load %LambdaList* (%LambdaList*) *, %LambdaList* (%LambdaList*) ** %tmp.1911
	%tmp.1913 = call %LambdaList*(%LambdaList*) %tmp.1912( %LambdaList* %tmp.1907 )
	%tmp.1914 = load %LambdaListRef*, %LambdaListRef** %tmp.1904
	%tmp.1915 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1914, i32 0, i32 2
	store %LambdaList* %tmp.1913, %LambdaList** %tmp.1915
	%tmp.1916 = load %LambdaListRef*, %LambdaListRef** %tmp.1904
	ret %LambdaListRef* %tmp.1916

abort:
	call void @abort(  )
	unreachable
}

define %LambdaListRef* @LambdaListRef_new() {

entry:
	%tmp.1917 = getelementptr %LambdaListRef_vtable, %LambdaListRef_vtable* @LambdaListRef_vtable_prototype, i32 0, i32 1
	%tmp.1918 = load i32, i32* %tmp.1917
	%tmp.1919 = call i8*(i32) @malloc( i32 %tmp.1918 )
	%tmp.1920 = bitcast i8* %tmp.1919 to %LambdaListRef*
	%tmp.1921 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1920, i32 0, i32 0
	store %LambdaListRef_vtable* @LambdaListRef_vtable_prototype, %LambdaListRef_vtable** %tmp.1921
	%tmp.1922 = alloca %LambdaListRef*
	store %LambdaListRef* %tmp.1920, %LambdaListRef** %tmp.1922
	%tmp.1923 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1920, i32 0, i32 1
	store i32 0, i32* %tmp.1923
	%tmp.1924 = getelementptr %LambdaListRef, %LambdaListRef* %tmp.1920, i32 0, i32 2
	store %LambdaList* null, %LambdaList** %tmp.1924
	ret %LambdaListRef* %tmp.1920

abort:
	call void @abort(  )
	unreachable
}

