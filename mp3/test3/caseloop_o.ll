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
	%Object* (%Main*) *
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
	%Object* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%A_vtable*
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

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%B_vtable*
}

%B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *
}

@B_vtable_prototype = constant %B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
}

@str.C = internal constant [2 x i8] c"C\00"
%C = type {
	%C_vtable*
}

%C_vtable = type {
	i32,
	i32,
	i8*,
	%C* () *,
	%Object* (%C*) *,
	%String* (%C*) *,
	%C* (%C*) *
}

@C_vtable_prototype = constant %C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *)
}

@str.D = internal constant [2 x i8] c"D\00"
%D = type {
	%D_vtable*
}

%D_vtable = type {
	i32,
	i32,
	i8*,
	%D* () *,
	%Object* (%D*) *,
	%String* (%D*) *,
	%D* (%D*) *
}

@D_vtable_prototype = constant %D_vtable {
	i32 9,
	i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.D, i32 0, i32 0),
	%D* () * @D_new,
	%Object* (%D*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%D*) *),
	%String* (%D*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%D*) *),
	%D* (%D*) * bitcast (%Object* (%Object*) * @Object_copy to %D* (%D*) *)
}

@str.E = internal constant [2 x i8] c"E\00"
%E = type {
	%E_vtable*
}

%E_vtable = type {
	i32,
	i32,
	i8*,
	%E* () *,
	%Object* (%E*) *,
	%String* (%E*) *,
	%E* (%E*) *
}

@E_vtable_prototype = constant %E_vtable {
	i32 10,
	i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0),
	%E* () * @E_new,
	%Object* (%E*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%E*) *),
	%String* (%E*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%E*) *),
	%E* (%E*) * bitcast (%Object* (%Object*) * @Object_copy to %E* (%E*) *)
}

@str.F = internal constant [2 x i8] c"F\00"
%F = type {
	%F_vtable*
}

%F_vtable = type {
	i32,
	i32,
	i8*,
	%F* () *,
	%Object* (%F*) *,
	%String* (%F*) *,
	%F* (%F*) *
}

@F_vtable_prototype = constant %F_vtable {
	i32 11,
	i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0),
	%F* () * @F_new,
	%Object* (%F*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%F*) *),
	%String* (%F*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%F*) *),
	%F* (%F*) * bitcast (%Object* (%Object*) * @Object_copy to %F* (%F*) *)
}

@str.G = internal constant [2 x i8] c"G\00"
%G = type {
	%G_vtable*
}

%G_vtable = type {
	i32,
	i32,
	i8*,
	%G* () *,
	%Object* (%G*) *,
	%String* (%G*) *,
	%G* (%G*) *
}

@G_vtable_prototype = constant %G_vtable {
	i32 12,
	i32 ptrtoint (%G* getelementptr (%G, %G* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.G, i32 0, i32 0),
	%G* () * @G_new,
	%Object* (%G*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%G*) *),
	%String* (%G*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%G*) *),
	%G* (%G*) * bitcast (%Object* (%Object*) * @Object_copy to %G* (%G*) *)
}

@str.H = internal constant [2 x i8] c"H\00"
%H = type {
	%H_vtable*
}

%H_vtable = type {
	i32,
	i32,
	i8*,
	%H* () *,
	%Object* (%H*) *,
	%String* (%H*) *,
	%H* (%H*) *
}

@H_vtable_prototype = constant %H_vtable {
	i32 13,
	i32 ptrtoint (%H* getelementptr (%H, %H* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.H, i32 0, i32 0),
	%H* () * @H_new,
	%Object* (%H*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%H*) *),
	%String* (%H*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%H*) *),
	%H* (%H*) * bitcast (%Object* (%Object*) * @Object_copy to %H* (%H*) *)
}

@str.I = internal constant [2 x i8] c"I\00"
%I = type {
	%I_vtable*
}

%I_vtable = type {
	i32,
	i32,
	i8*,
	%I* () *,
	%Object* (%I*) *,
	%String* (%I*) *,
	%I* (%I*) *
}

@I_vtable_prototype = constant %I_vtable {
	i32 14,
	i32 ptrtoint (%I* getelementptr (%I, %I* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.I, i32 0, i32 0),
	%I* () * @I_new,
	%Object* (%I*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%I*) *),
	%String* (%I*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%I*) *),
	%I* (%I*) * bitcast (%Object* (%Object*) * @Object_copy to %I* (%I*) *)
}

@str.J = internal constant [2 x i8] c"J\00"
%J = type {
	%J_vtable*
}

%J_vtable = type {
	i32,
	i32,
	i8*,
	%J* () *,
	%Object* (%J*) *,
	%String* (%J*) *,
	%J* (%J*) *
}

@J_vtable_prototype = constant %J_vtable {
	i32 15,
	i32 ptrtoint (%J* getelementptr (%J, %J* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.J, i32 0, i32 0),
	%J* () * @J_new,
	%Object* (%J*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%J*) *),
	%String* (%J*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%J*) *),
	%J* (%J*) * bitcast (%Object* (%Object*) * @Object_copy to %J* (%J*) *)
}

@str.K = internal constant [2 x i8] c"K\00"
%K = type {
	%K_vtable*
}

%K_vtable = type {
	i32,
	i32,
	i8*,
	%K* () *,
	%Object* (%K*) *,
	%String* (%K*) *,
	%K* (%K*) *
}

@K_vtable_prototype = constant %K_vtable {
	i32 16,
	i32 ptrtoint (%K* getelementptr (%K, %K* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.K, i32 0, i32 0),
	%K* () * @K_new,
	%Object* (%K*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%K*) *),
	%String* (%K*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%K*) *),
	%K* (%K*) * bitcast (%Object* (%Object*) * @Object_copy to %K* (%K*) *)
}

@str.L = internal constant [2 x i8] c"L\00"
%L = type {
	%L_vtable*
}

%L_vtable = type {
	i32,
	i32,
	i8*,
	%L* () *,
	%Object* (%L*) *,
	%String* (%L*) *,
	%L* (%L*) *
}

@L_vtable_prototype = constant %L_vtable {
	i32 17,
	i32 ptrtoint (%L* getelementptr (%L, %L* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.L, i32 0, i32 0),
	%L* () * @L_new,
	%Object* (%L*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%L*) *),
	%String* (%L*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%L*) *),
	%L* (%L*) * bitcast (%Object* (%Object*) * @Object_copy to %L* (%L*) *)
}

@str.M = internal constant [2 x i8] c"M\00"
%M = type {
	%M_vtable*
}

%M_vtable = type {
	i32,
	i32,
	i8*,
	%M* () *,
	%Object* (%M*) *,
	%String* (%M*) *,
	%M* (%M*) *
}

@M_vtable_prototype = constant %M_vtable {
	i32 18,
	i32 ptrtoint (%M* getelementptr (%M, %M* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.M, i32 0, i32 0),
	%M* () * @M_new,
	%Object* (%M*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%M*) *),
	%String* (%M*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%M*) *),
	%M* (%M*) * bitcast (%Object* (%Object*) * @Object_copy to %M* (%M*) *)
}

@str.N = internal constant [2 x i8] c"N\00"
%N = type {
	%N_vtable*
}

%N_vtable = type {
	i32,
	i32,
	i8*,
	%N* () *,
	%Object* (%N*) *,
	%String* (%N*) *,
	%N* (%N*) *
}

@N_vtable_prototype = constant %N_vtable {
	i32 19,
	i32 ptrtoint (%N* getelementptr (%N, %N* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.N, i32 0, i32 0),
	%N* () * @N_new,
	%Object* (%N*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%N*) *),
	%String* (%N*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%N*) *),
	%N* (%N*) * bitcast (%Object* (%Object*) * @Object_copy to %N* (%N*) *)
}

@str.O = internal constant [2 x i8] c"O\00"
%O = type {
	%O_vtable*
}

%O_vtable = type {
	i32,
	i32,
	i8*,
	%O* () *,
	%Object* (%O*) *,
	%String* (%O*) *,
	%O* (%O*) *
}

@O_vtable_prototype = constant %O_vtable {
	i32 20,
	i32 ptrtoint (%O* getelementptr (%O, %O* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.O, i32 0, i32 0),
	%O* () * @O_new,
	%Object* (%O*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%O*) *),
	%String* (%O*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%O*) *),
	%O* (%O*) * bitcast (%Object* (%Object*) * @Object_copy to %O* (%O*) *)
}

@str.P = internal constant [2 x i8] c"P\00"
%P = type {
	%P_vtable*
}

%P_vtable = type {
	i32,
	i32,
	i8*,
	%P* () *,
	%Object* (%P*) *,
	%String* (%P*) *,
	%P* (%P*) *
}

@P_vtable_prototype = constant %P_vtable {
	i32 21,
	i32 ptrtoint (%P* getelementptr (%P, %P* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.P, i32 0, i32 0),
	%P* () * @P_new,
	%Object* (%P*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%P*) *),
	%String* (%P*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%P*) *),
	%P* (%P*) * bitcast (%Object* (%Object*) * @Object_copy to %P* (%P*) *)
}

@str.Q = internal constant [2 x i8] c"Q\00"
%Q = type {
	%Q_vtable*
}

%Q_vtable = type {
	i32,
	i32,
	i8*,
	%Q* () *,
	%Object* (%Q*) *,
	%String* (%Q*) *,
	%Q* (%Q*) *
}

@Q_vtable_prototype = constant %Q_vtable {
	i32 22,
	i32 ptrtoint (%Q* getelementptr (%Q, %Q* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.Q, i32 0, i32 0),
	%Q* () * @Q_new,
	%Object* (%Q*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Q*) *),
	%String* (%Q*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Q*) *),
	%Q* (%Q*) * bitcast (%Object* (%Object*) * @Object_copy to %Q* (%Q*) *)
}

@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [14 x i8] c"caseloop_o.cl\00"
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main*() @Main_new(  )
	%main.retval = call %Object*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = alloca i32
	store i32 0, i32* %tmp.1
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.2
	%tmp.3 = call %A* @A_new(  )
	%tmp.4 = bitcast %A* %tmp.3 to %Object*
	%tmp.5 = alloca %Object*
	store %Object* %tmp.4, %Object** %tmp.5
	%tmp.6 = call %Q* @Q_new(  )
	%tmp.7 = bitcast %Q* %tmp.6 to %Object*
	%tmp.8 = alloca %Object*
	store %Object* %tmp.7, %Object** %tmp.8
	%tmp.9 = alloca i32
	store i32 0, i32* %tmp.9
	br label %loop.0

loop.0:
	%tmp.10 = load i32, i32* %tmp.1
	%tmp.11 = icmp slt i32 %tmp.10, 100
	br i1 %tmp.11, label %true.0, label %false.0

true.0:
	%tmp.12 = load %Object*, %Object** %tmp.8
	%vtpm.0 = icmp eq %Object* %tmp.12, null
	br i1 %vtpm.0, label %abort, label %ok.0

ok.0:
	%tmp.13 = getelementptr %Object, %Object* %tmp.12, i32 0, i32 0
	%tmp.14 = load %Object_vtable*, %Object_vtable** %tmp.13
	%tmp.15 = getelementptr %Object_vtable, %Object_vtable* %tmp.14, i32 0, i32 0
	%tmp.16 = load i32, i32* %tmp.15
	br label %case.hdr.1

case.hdr.1:
	%vtpm.1 = alloca %Int*
	br label %case.22.1

case.22.1:
	%tmp.17 = icmp slt i32 %tmp.16, 22
	br i1 %tmp.17, label %br_exit.22.1, label %src_gte_br.22.1

src_gte_br.22.1:
	%tmp.18 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.18, label %br_exit.22.1, label %src_lte_mc.22.1

src_lte_mc.22.1:
	%tmp.19 = alloca %Q*
	%tmp.20 = bitcast %Object* %tmp.12 to %Q*
	store %Q* %tmp.20, %Q** %tmp.19
	%tmp.21 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.21, i32 17 )
	store %Int* %tmp.21, %Int** %vtpm.1
	br label %case.exit.1

br_exit.22.1:
	br label %case.21.1

case.21.1:
	%tmp.22 = icmp slt i32 %tmp.16, 21
	br i1 %tmp.22, label %br_exit.21.1, label %src_gte_br.21.1

src_gte_br.21.1:
	%tmp.23 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.23, label %br_exit.21.1, label %src_lte_mc.21.1

src_lte_mc.21.1:
	%tmp.24 = alloca %P*
	%tmp.25 = bitcast %Object* %tmp.12 to %P*
	store %P* %tmp.25, %P** %tmp.24
	%tmp.26 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.26, i32 16 )
	store %Int* %tmp.26, %Int** %vtpm.1
	br label %case.exit.1

br_exit.21.1:
	br label %case.20.1

case.20.1:
	%tmp.27 = icmp slt i32 %tmp.16, 20
	br i1 %tmp.27, label %br_exit.20.1, label %src_gte_br.20.1

src_gte_br.20.1:
	%tmp.28 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.28, label %br_exit.20.1, label %src_lte_mc.20.1

src_lte_mc.20.1:
	%tmp.29 = alloca %O*
	%tmp.30 = bitcast %Object* %tmp.12 to %O*
	store %O* %tmp.30, %O** %tmp.29
	%tmp.31 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.31, i32 15 )
	store %Int* %tmp.31, %Int** %vtpm.1
	br label %case.exit.1

br_exit.20.1:
	br label %case.19.1

case.19.1:
	%tmp.32 = icmp slt i32 %tmp.16, 19
	br i1 %tmp.32, label %br_exit.19.1, label %src_gte_br.19.1

src_gte_br.19.1:
	%tmp.33 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.33, label %br_exit.19.1, label %src_lte_mc.19.1

src_lte_mc.19.1:
	%tmp.34 = alloca %N*
	%tmp.35 = bitcast %Object* %tmp.12 to %N*
	store %N* %tmp.35, %N** %tmp.34
	%tmp.36 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.36, i32 14 )
	store %Int* %tmp.36, %Int** %vtpm.1
	br label %case.exit.1

br_exit.19.1:
	br label %case.18.1

case.18.1:
	%tmp.37 = icmp slt i32 %tmp.16, 18
	br i1 %tmp.37, label %br_exit.18.1, label %src_gte_br.18.1

src_gte_br.18.1:
	%tmp.38 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.38, label %br_exit.18.1, label %src_lte_mc.18.1

src_lte_mc.18.1:
	%tmp.39 = alloca %M*
	%tmp.40 = bitcast %Object* %tmp.12 to %M*
	store %M* %tmp.40, %M** %tmp.39
	%tmp.41 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.41, i32 13 )
	store %Int* %tmp.41, %Int** %vtpm.1
	br label %case.exit.1

br_exit.18.1:
	br label %case.17.1

case.17.1:
	%tmp.42 = icmp slt i32 %tmp.16, 17
	br i1 %tmp.42, label %br_exit.17.1, label %src_gte_br.17.1

src_gte_br.17.1:
	%tmp.43 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.43, label %br_exit.17.1, label %src_lte_mc.17.1

src_lte_mc.17.1:
	%tmp.44 = alloca %L*
	%tmp.45 = bitcast %Object* %tmp.12 to %L*
	store %L* %tmp.45, %L** %tmp.44
	%tmp.46 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.46, i32 12 )
	store %Int* %tmp.46, %Int** %vtpm.1
	br label %case.exit.1

br_exit.17.1:
	br label %case.16.1

case.16.1:
	%tmp.47 = icmp slt i32 %tmp.16, 16
	br i1 %tmp.47, label %br_exit.16.1, label %src_gte_br.16.1

src_gte_br.16.1:
	%tmp.48 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.48, label %br_exit.16.1, label %src_lte_mc.16.1

src_lte_mc.16.1:
	%tmp.49 = alloca %K*
	%tmp.50 = bitcast %Object* %tmp.12 to %K*
	store %K* %tmp.50, %K** %tmp.49
	%tmp.51 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.51, i32 11 )
	store %Int* %tmp.51, %Int** %vtpm.1
	br label %case.exit.1

br_exit.16.1:
	br label %case.15.1

case.15.1:
	%tmp.52 = icmp slt i32 %tmp.16, 15
	br i1 %tmp.52, label %br_exit.15.1, label %src_gte_br.15.1

src_gte_br.15.1:
	%tmp.53 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.53, label %br_exit.15.1, label %src_lte_mc.15.1

src_lte_mc.15.1:
	%tmp.54 = alloca %J*
	%tmp.55 = bitcast %Object* %tmp.12 to %J*
	store %J* %tmp.55, %J** %tmp.54
	%tmp.56 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.56, i32 10 )
	store %Int* %tmp.56, %Int** %vtpm.1
	br label %case.exit.1

br_exit.15.1:
	br label %case.14.1

case.14.1:
	%tmp.57 = icmp slt i32 %tmp.16, 14
	br i1 %tmp.57, label %br_exit.14.1, label %src_gte_br.14.1

src_gte_br.14.1:
	%tmp.58 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.58, label %br_exit.14.1, label %src_lte_mc.14.1

src_lte_mc.14.1:
	%tmp.59 = alloca %I*
	%tmp.60 = bitcast %Object* %tmp.12 to %I*
	store %I* %tmp.60, %I** %tmp.59
	%tmp.61 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.61, i32 9 )
	store %Int* %tmp.61, %Int** %vtpm.1
	br label %case.exit.1

br_exit.14.1:
	br label %case.13.1

case.13.1:
	%tmp.62 = icmp slt i32 %tmp.16, 13
	br i1 %tmp.62, label %br_exit.13.1, label %src_gte_br.13.1

src_gte_br.13.1:
	%tmp.63 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.63, label %br_exit.13.1, label %src_lte_mc.13.1

src_lte_mc.13.1:
	%tmp.64 = alloca %H*
	%tmp.65 = bitcast %Object* %tmp.12 to %H*
	store %H* %tmp.65, %H** %tmp.64
	%tmp.66 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.66, i32 8 )
	store %Int* %tmp.66, %Int** %vtpm.1
	br label %case.exit.1

br_exit.13.1:
	br label %case.12.1

case.12.1:
	%tmp.67 = icmp slt i32 %tmp.16, 12
	br i1 %tmp.67, label %br_exit.12.1, label %src_gte_br.12.1

src_gte_br.12.1:
	%tmp.68 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.68, label %br_exit.12.1, label %src_lte_mc.12.1

src_lte_mc.12.1:
	%tmp.69 = alloca %G*
	%tmp.70 = bitcast %Object* %tmp.12 to %G*
	store %G* %tmp.70, %G** %tmp.69
	%tmp.71 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.71, i32 7 )
	store %Int* %tmp.71, %Int** %vtpm.1
	br label %case.exit.1

br_exit.12.1:
	br label %case.11.1

case.11.1:
	%tmp.72 = icmp slt i32 %tmp.16, 11
	br i1 %tmp.72, label %br_exit.11.1, label %src_gte_br.11.1

src_gte_br.11.1:
	%tmp.73 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.73, label %br_exit.11.1, label %src_lte_mc.11.1

src_lte_mc.11.1:
	%tmp.74 = alloca %F*
	%tmp.75 = bitcast %Object* %tmp.12 to %F*
	store %F* %tmp.75, %F** %tmp.74
	%tmp.76 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.76, i32 6 )
	store %Int* %tmp.76, %Int** %vtpm.1
	br label %case.exit.1

br_exit.11.1:
	br label %case.10.1

case.10.1:
	%tmp.77 = icmp slt i32 %tmp.16, 10
	br i1 %tmp.77, label %br_exit.10.1, label %src_gte_br.10.1

src_gte_br.10.1:
	%tmp.78 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.78, label %br_exit.10.1, label %src_lte_mc.10.1

src_lte_mc.10.1:
	%tmp.79 = alloca %E*
	%tmp.80 = bitcast %Object* %tmp.12 to %E*
	store %E* %tmp.80, %E** %tmp.79
	%tmp.81 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.81, i32 5 )
	store %Int* %tmp.81, %Int** %vtpm.1
	br label %case.exit.1

br_exit.10.1:
	br label %case.9.1

case.9.1:
	%tmp.82 = icmp slt i32 %tmp.16, 9
	br i1 %tmp.82, label %br_exit.9.1, label %src_gte_br.9.1

src_gte_br.9.1:
	%tmp.83 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.83, label %br_exit.9.1, label %src_lte_mc.9.1

src_lte_mc.9.1:
	%tmp.84 = alloca %D*
	%tmp.85 = bitcast %Object* %tmp.12 to %D*
	store %D* %tmp.85, %D** %tmp.84
	%tmp.86 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.86, i32 4 )
	store %Int* %tmp.86, %Int** %vtpm.1
	br label %case.exit.1

br_exit.9.1:
	br label %case.8.1

case.8.1:
	%tmp.87 = icmp slt i32 %tmp.16, 8
	br i1 %tmp.87, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%tmp.88 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.88, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%tmp.89 = alloca %C*
	%tmp.90 = bitcast %Object* %tmp.12 to %C*
	store %C* %tmp.90, %C** %tmp.89
	%tmp.91 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.91, i32 3 )
	store %Int* %tmp.91, %Int** %vtpm.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%tmp.92 = icmp slt i32 %tmp.16, 7
	br i1 %tmp.92, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%tmp.93 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.93, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%tmp.94 = alloca %B*
	%tmp.95 = bitcast %Object* %tmp.12 to %B*
	store %B* %tmp.95, %B** %tmp.94
	%tmp.96 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.96, i32 2 )
	store %Int* %tmp.96, %Int** %vtpm.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%tmp.97 = icmp slt i32 %tmp.16, 6
	br i1 %tmp.97, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%tmp.98 = icmp sgt i32 %tmp.16, 22
	br i1 %tmp.98, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%tmp.99 = alloca %A*
	%tmp.100 = bitcast %Object* %tmp.12 to %A*
	store %A* %tmp.100, %A** %tmp.99
	%tmp.101 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.101, i32 1 )
	store %Int* %tmp.101, %Int** %vtpm.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%vtpm.2 = load %Int*, %Int** %vtpm.1
	%tmp.102 = getelementptr %Int, %Int* %vtpm.2, i32 0, i32 1
	%tmp.103 = load i32, i32* %tmp.102
	store i32 %tmp.103, i32* %tmp.9
	%tmp.104 = load i32, i32* %tmp.1
	%tmp.105 = add i32 %tmp.104, 1
	store i32 %tmp.105, i32* %tmp.1
	br label %loop.0

false.0:
	%tmp.106 = alloca i32
	%tmp.107 = load i32, i32* %tmp.9
	%tmp.108 = icmp eq i32 %tmp.107, 17
	%tmp.109 = xor i1 %tmp.108, true
	br i1 %tmp.109, label %true.2, label %false.2

true.2:
	%tmp.110 = load i32, i32* %tmp.2
	%tmp.111 = add i32 %tmp.110, 1
	store i32 %tmp.111, i32* %tmp.2
	store i32 %tmp.111, i32* %tmp.106
	br label %end.2

false.2:
	store i32 0, i32* %tmp.106
	br label %end.2

end.2:
	%tmp.112 = load i32, i32* %tmp.106
	store i32 0, i32* %tmp.1
	br label %loop.3

loop.3:
	%tmp.113 = load i32, i32* %tmp.1
	%tmp.114 = icmp slt i32 %tmp.113, 10
	br i1 %tmp.114, label %true.3, label %false.3

true.3:
	%tmp.115 = load %Object*, %Object** %tmp.5
	%vtpm.3 = icmp eq %Object* %tmp.115, null
	br i1 %vtpm.3, label %abort, label %ok.1

ok.1:
	%tmp.116 = getelementptr %Object, %Object* %tmp.115, i32 0, i32 0
	%tmp.117 = load %Object_vtable*, %Object_vtable** %tmp.116
	%tmp.118 = getelementptr %Object_vtable, %Object_vtable* %tmp.117, i32 0, i32 0
	%tmp.119 = load i32, i32* %tmp.118
	br label %case.hdr.4

case.hdr.4:
	%vtpm.4 = alloca %Int*
	br label %case.22.4

case.22.4:
	%tmp.120 = icmp slt i32 %tmp.119, 22
	br i1 %tmp.120, label %br_exit.22.4, label %src_gte_br.22.4

src_gte_br.22.4:
	%tmp.121 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.121, label %br_exit.22.4, label %src_lte_mc.22.4

src_lte_mc.22.4:
	%tmp.122 = alloca %Q*
	%tmp.123 = bitcast %Object* %tmp.115 to %Q*
	store %Q* %tmp.123, %Q** %tmp.122
	%tmp.124 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.124, i32 17 )
	store %Int* %tmp.124, %Int** %vtpm.4
	br label %case.exit.4

br_exit.22.4:
	br label %case.21.4

case.21.4:
	%tmp.125 = icmp slt i32 %tmp.119, 21
	br i1 %tmp.125, label %br_exit.21.4, label %src_gte_br.21.4

src_gte_br.21.4:
	%tmp.126 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.126, label %br_exit.21.4, label %src_lte_mc.21.4

src_lte_mc.21.4:
	%tmp.127 = alloca %P*
	%tmp.128 = bitcast %Object* %tmp.115 to %P*
	store %P* %tmp.128, %P** %tmp.127
	%tmp.129 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.129, i32 16 )
	store %Int* %tmp.129, %Int** %vtpm.4
	br label %case.exit.4

br_exit.21.4:
	br label %case.20.4

case.20.4:
	%tmp.130 = icmp slt i32 %tmp.119, 20
	br i1 %tmp.130, label %br_exit.20.4, label %src_gte_br.20.4

src_gte_br.20.4:
	%tmp.131 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.131, label %br_exit.20.4, label %src_lte_mc.20.4

src_lte_mc.20.4:
	%tmp.132 = alloca %O*
	%tmp.133 = bitcast %Object* %tmp.115 to %O*
	store %O* %tmp.133, %O** %tmp.132
	%tmp.134 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.134, i32 15 )
	store %Int* %tmp.134, %Int** %vtpm.4
	br label %case.exit.4

br_exit.20.4:
	br label %case.19.4

case.19.4:
	%tmp.135 = icmp slt i32 %tmp.119, 19
	br i1 %tmp.135, label %br_exit.19.4, label %src_gte_br.19.4

src_gte_br.19.4:
	%tmp.136 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.136, label %br_exit.19.4, label %src_lte_mc.19.4

src_lte_mc.19.4:
	%tmp.137 = alloca %N*
	%tmp.138 = bitcast %Object* %tmp.115 to %N*
	store %N* %tmp.138, %N** %tmp.137
	%tmp.139 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.139, i32 14 )
	store %Int* %tmp.139, %Int** %vtpm.4
	br label %case.exit.4

br_exit.19.4:
	br label %case.18.4

case.18.4:
	%tmp.140 = icmp slt i32 %tmp.119, 18
	br i1 %tmp.140, label %br_exit.18.4, label %src_gte_br.18.4

src_gte_br.18.4:
	%tmp.141 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.141, label %br_exit.18.4, label %src_lte_mc.18.4

src_lte_mc.18.4:
	%tmp.142 = alloca %M*
	%tmp.143 = bitcast %Object* %tmp.115 to %M*
	store %M* %tmp.143, %M** %tmp.142
	%tmp.144 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.144, i32 13 )
	store %Int* %tmp.144, %Int** %vtpm.4
	br label %case.exit.4

br_exit.18.4:
	br label %case.17.4

case.17.4:
	%tmp.145 = icmp slt i32 %tmp.119, 17
	br i1 %tmp.145, label %br_exit.17.4, label %src_gte_br.17.4

src_gte_br.17.4:
	%tmp.146 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.146, label %br_exit.17.4, label %src_lte_mc.17.4

src_lte_mc.17.4:
	%tmp.147 = alloca %L*
	%tmp.148 = bitcast %Object* %tmp.115 to %L*
	store %L* %tmp.148, %L** %tmp.147
	%tmp.149 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.149, i32 12 )
	store %Int* %tmp.149, %Int** %vtpm.4
	br label %case.exit.4

br_exit.17.4:
	br label %case.16.4

case.16.4:
	%tmp.150 = icmp slt i32 %tmp.119, 16
	br i1 %tmp.150, label %br_exit.16.4, label %src_gte_br.16.4

src_gte_br.16.4:
	%tmp.151 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.151, label %br_exit.16.4, label %src_lte_mc.16.4

src_lte_mc.16.4:
	%tmp.152 = alloca %K*
	%tmp.153 = bitcast %Object* %tmp.115 to %K*
	store %K* %tmp.153, %K** %tmp.152
	%tmp.154 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.154, i32 11 )
	store %Int* %tmp.154, %Int** %vtpm.4
	br label %case.exit.4

br_exit.16.4:
	br label %case.15.4

case.15.4:
	%tmp.155 = icmp slt i32 %tmp.119, 15
	br i1 %tmp.155, label %br_exit.15.4, label %src_gte_br.15.4

src_gte_br.15.4:
	%tmp.156 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.156, label %br_exit.15.4, label %src_lte_mc.15.4

src_lte_mc.15.4:
	%tmp.157 = alloca %J*
	%tmp.158 = bitcast %Object* %tmp.115 to %J*
	store %J* %tmp.158, %J** %tmp.157
	%tmp.159 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.159, i32 10 )
	store %Int* %tmp.159, %Int** %vtpm.4
	br label %case.exit.4

br_exit.15.4:
	br label %case.14.4

case.14.4:
	%tmp.160 = icmp slt i32 %tmp.119, 14
	br i1 %tmp.160, label %br_exit.14.4, label %src_gte_br.14.4

src_gte_br.14.4:
	%tmp.161 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.161, label %br_exit.14.4, label %src_lte_mc.14.4

src_lte_mc.14.4:
	%tmp.162 = alloca %I*
	%tmp.163 = bitcast %Object* %tmp.115 to %I*
	store %I* %tmp.163, %I** %tmp.162
	%tmp.164 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.164, i32 9 )
	store %Int* %tmp.164, %Int** %vtpm.4
	br label %case.exit.4

br_exit.14.4:
	br label %case.13.4

case.13.4:
	%tmp.165 = icmp slt i32 %tmp.119, 13
	br i1 %tmp.165, label %br_exit.13.4, label %src_gte_br.13.4

src_gte_br.13.4:
	%tmp.166 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.166, label %br_exit.13.4, label %src_lte_mc.13.4

src_lte_mc.13.4:
	%tmp.167 = alloca %H*
	%tmp.168 = bitcast %Object* %tmp.115 to %H*
	store %H* %tmp.168, %H** %tmp.167
	%tmp.169 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.169, i32 8 )
	store %Int* %tmp.169, %Int** %vtpm.4
	br label %case.exit.4

br_exit.13.4:
	br label %case.12.4

case.12.4:
	%tmp.170 = icmp slt i32 %tmp.119, 12
	br i1 %tmp.170, label %br_exit.12.4, label %src_gte_br.12.4

src_gte_br.12.4:
	%tmp.171 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.171, label %br_exit.12.4, label %src_lte_mc.12.4

src_lte_mc.12.4:
	%tmp.172 = alloca %G*
	%tmp.173 = bitcast %Object* %tmp.115 to %G*
	store %G* %tmp.173, %G** %tmp.172
	%tmp.174 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.174, i32 7 )
	store %Int* %tmp.174, %Int** %vtpm.4
	br label %case.exit.4

br_exit.12.4:
	br label %case.11.4

case.11.4:
	%tmp.175 = icmp slt i32 %tmp.119, 11
	br i1 %tmp.175, label %br_exit.11.4, label %src_gte_br.11.4

src_gte_br.11.4:
	%tmp.176 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.176, label %br_exit.11.4, label %src_lte_mc.11.4

src_lte_mc.11.4:
	%tmp.177 = alloca %F*
	%tmp.178 = bitcast %Object* %tmp.115 to %F*
	store %F* %tmp.178, %F** %tmp.177
	%tmp.179 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.179, i32 6 )
	store %Int* %tmp.179, %Int** %vtpm.4
	br label %case.exit.4

br_exit.11.4:
	br label %case.10.4

case.10.4:
	%tmp.180 = icmp slt i32 %tmp.119, 10
	br i1 %tmp.180, label %br_exit.10.4, label %src_gte_br.10.4

src_gte_br.10.4:
	%tmp.181 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.181, label %br_exit.10.4, label %src_lte_mc.10.4

src_lte_mc.10.4:
	%tmp.182 = alloca %E*
	%tmp.183 = bitcast %Object* %tmp.115 to %E*
	store %E* %tmp.183, %E** %tmp.182
	%tmp.184 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.184, i32 5 )
	store %Int* %tmp.184, %Int** %vtpm.4
	br label %case.exit.4

br_exit.10.4:
	br label %case.9.4

case.9.4:
	%tmp.185 = icmp slt i32 %tmp.119, 9
	br i1 %tmp.185, label %br_exit.9.4, label %src_gte_br.9.4

src_gte_br.9.4:
	%tmp.186 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.186, label %br_exit.9.4, label %src_lte_mc.9.4

src_lte_mc.9.4:
	%tmp.187 = alloca %D*
	%tmp.188 = bitcast %Object* %tmp.115 to %D*
	store %D* %tmp.188, %D** %tmp.187
	%tmp.189 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.189, i32 4 )
	store %Int* %tmp.189, %Int** %vtpm.4
	br label %case.exit.4

br_exit.9.4:
	br label %case.8.4

case.8.4:
	%tmp.190 = icmp slt i32 %tmp.119, 8
	br i1 %tmp.190, label %br_exit.8.4, label %src_gte_br.8.4

src_gte_br.8.4:
	%tmp.191 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.191, label %br_exit.8.4, label %src_lte_mc.8.4

src_lte_mc.8.4:
	%tmp.192 = alloca %C*
	%tmp.193 = bitcast %Object* %tmp.115 to %C*
	store %C* %tmp.193, %C** %tmp.192
	%tmp.194 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.194, i32 3 )
	store %Int* %tmp.194, %Int** %vtpm.4
	br label %case.exit.4

br_exit.8.4:
	br label %case.7.4

case.7.4:
	%tmp.195 = icmp slt i32 %tmp.119, 7
	br i1 %tmp.195, label %br_exit.7.4, label %src_gte_br.7.4

src_gte_br.7.4:
	%tmp.196 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.196, label %br_exit.7.4, label %src_lte_mc.7.4

src_lte_mc.7.4:
	%tmp.197 = alloca %B*
	%tmp.198 = bitcast %Object* %tmp.115 to %B*
	store %B* %tmp.198, %B** %tmp.197
	%tmp.199 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.199, i32 2 )
	store %Int* %tmp.199, %Int** %vtpm.4
	br label %case.exit.4

br_exit.7.4:
	br label %case.6.4

case.6.4:
	%tmp.200 = icmp slt i32 %tmp.119, 6
	br i1 %tmp.200, label %br_exit.6.4, label %src_gte_br.6.4

src_gte_br.6.4:
	%tmp.201 = icmp sgt i32 %tmp.119, 22
	br i1 %tmp.201, label %br_exit.6.4, label %src_lte_mc.6.4

src_lte_mc.6.4:
	%tmp.202 = alloca %A*
	%tmp.203 = bitcast %Object* %tmp.115 to %A*
	store %A* %tmp.203, %A** %tmp.202
	%tmp.204 = call %Int* @Int_new(  )
	call void(%Int*, i32) @Int_init( %Int* %tmp.204, i32 1 )
	store %Int* %tmp.204, %Int** %vtpm.4
	br label %case.exit.4

br_exit.6.4:
	br label %abort

case.exit.4:
	%vtpm.5 = load %Int*, %Int** %vtpm.4
	%tmp.205 = getelementptr %Int, %Int* %vtpm.5, i32 0, i32 1
	%tmp.206 = load i32, i32* %tmp.205
	store i32 %tmp.206, i32* %tmp.9
	%tmp.207 = load i32, i32* %tmp.1
	%tmp.208 = add i32 %tmp.207, 1
	store i32 %tmp.208, i32* %tmp.1
	br label %loop.3

false.3:
	%tmp.209 = alloca i32
	%tmp.210 = load i32, i32* %tmp.9
	%tmp.211 = icmp eq i32 %tmp.210, 1
	%tmp.212 = xor i1 %tmp.211, true
	br i1 %tmp.212, label %true.5, label %false.5

true.5:
	%tmp.213 = load i32, i32* %tmp.2
	%tmp.214 = add i32 %tmp.213, 1
	store i32 %tmp.214, i32* %tmp.2
	store i32 %tmp.214, i32* %tmp.209
	br label %end.5

false.5:
	store i32 0, i32* %tmp.209
	br label %end.5

end.5:
	%tmp.215 = load i32, i32* %tmp.209
	%tmp.216 = load i32, i32* %tmp.2
	%tmp.217 = load %Main*, %Main** %tmp.0
	%tmp.218 = icmp eq %Main* %tmp.217, null
	br i1 %tmp.218, label %abort, label %ok.2

ok.2:
	%tmp.219 = getelementptr %Main, %Main* %tmp.217, i32 0, i32 0
	%tmp.220 = load %Main_vtable*, %Main_vtable** %tmp.219
	%tmp.221 = getelementptr %Main_vtable, %Main_vtable* %tmp.220, i32 0, i32 8
	%tmp.222 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.221
	%tmp.223 = call %Main*(%Main*, i32) %tmp.222( %Main* %tmp.217, i32 %tmp.216 )
	%tmp.224 = load %Main*, %Main** %tmp.0
	%tmp.225 = bitcast %Main* %tmp.224 to %Object*
	ret %Object* %tmp.225

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.226 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.227 = load i32, i32* %tmp.226
	%tmp.228 = call i8*(i32) @malloc( i32 %tmp.227 )
	%tmp.229 = bitcast i8* %tmp.228 to %Main*
	%tmp.230 = getelementptr %Main, %Main* %tmp.229, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.230
	%tmp.231 = alloca %Main*
	store %Main* %tmp.229, %Main** %tmp.231
	ret %Main* %tmp.229

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%tmp.232 = getelementptr %A_vtable, %A_vtable* @A_vtable_prototype, i32 0, i32 1
	%tmp.233 = load i32, i32* %tmp.232
	%tmp.234 = call i8*(i32) @malloc( i32 %tmp.233 )
	%tmp.235 = bitcast i8* %tmp.234 to %A*
	%tmp.236 = getelementptr %A, %A* %tmp.235, i32 0, i32 0
	store %A_vtable* @A_vtable_prototype, %A_vtable** %tmp.236
	%tmp.237 = alloca %A*
	store %A* %tmp.235, %A** %tmp.237
	ret %A* %tmp.235

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%tmp.238 = getelementptr %B_vtable, %B_vtable* @B_vtable_prototype, i32 0, i32 1
	%tmp.239 = load i32, i32* %tmp.238
	%tmp.240 = call i8*(i32) @malloc( i32 %tmp.239 )
	%tmp.241 = bitcast i8* %tmp.240 to %B*
	%tmp.242 = getelementptr %B, %B* %tmp.241, i32 0, i32 0
	store %B_vtable* @B_vtable_prototype, %B_vtable** %tmp.242
	%tmp.243 = alloca %B*
	store %B* %tmp.241, %B** %tmp.243
	ret %B* %tmp.241

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%tmp.244 = getelementptr %C_vtable, %C_vtable* @C_vtable_prototype, i32 0, i32 1
	%tmp.245 = load i32, i32* %tmp.244
	%tmp.246 = call i8*(i32) @malloc( i32 %tmp.245 )
	%tmp.247 = bitcast i8* %tmp.246 to %C*
	%tmp.248 = getelementptr %C, %C* %tmp.247, i32 0, i32 0
	store %C_vtable* @C_vtable_prototype, %C_vtable** %tmp.248
	%tmp.249 = alloca %C*
	store %C* %tmp.247, %C** %tmp.249
	ret %C* %tmp.247

abort:
	call void @abort(  )
	unreachable
}

define %D* @D_new() {

entry:
	%tmp.250 = getelementptr %D_vtable, %D_vtable* @D_vtable_prototype, i32 0, i32 1
	%tmp.251 = load i32, i32* %tmp.250
	%tmp.252 = call i8*(i32) @malloc( i32 %tmp.251 )
	%tmp.253 = bitcast i8* %tmp.252 to %D*
	%tmp.254 = getelementptr %D, %D* %tmp.253, i32 0, i32 0
	store %D_vtable* @D_vtable_prototype, %D_vtable** %tmp.254
	%tmp.255 = alloca %D*
	store %D* %tmp.253, %D** %tmp.255
	ret %D* %tmp.253

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%tmp.256 = getelementptr %E_vtable, %E_vtable* @E_vtable_prototype, i32 0, i32 1
	%tmp.257 = load i32, i32* %tmp.256
	%tmp.258 = call i8*(i32) @malloc( i32 %tmp.257 )
	%tmp.259 = bitcast i8* %tmp.258 to %E*
	%tmp.260 = getelementptr %E, %E* %tmp.259, i32 0, i32 0
	store %E_vtable* @E_vtable_prototype, %E_vtable** %tmp.260
	%tmp.261 = alloca %E*
	store %E* %tmp.259, %E** %tmp.261
	ret %E* %tmp.259

abort:
	call void @abort(  )
	unreachable
}

define %F* @F_new() {

entry:
	%tmp.262 = getelementptr %F_vtable, %F_vtable* @F_vtable_prototype, i32 0, i32 1
	%tmp.263 = load i32, i32* %tmp.262
	%tmp.264 = call i8*(i32) @malloc( i32 %tmp.263 )
	%tmp.265 = bitcast i8* %tmp.264 to %F*
	%tmp.266 = getelementptr %F, %F* %tmp.265, i32 0, i32 0
	store %F_vtable* @F_vtable_prototype, %F_vtable** %tmp.266
	%tmp.267 = alloca %F*
	store %F* %tmp.265, %F** %tmp.267
	ret %F* %tmp.265

abort:
	call void @abort(  )
	unreachable
}

define %G* @G_new() {

entry:
	%tmp.268 = getelementptr %G_vtable, %G_vtable* @G_vtable_prototype, i32 0, i32 1
	%tmp.269 = load i32, i32* %tmp.268
	%tmp.270 = call i8*(i32) @malloc( i32 %tmp.269 )
	%tmp.271 = bitcast i8* %tmp.270 to %G*
	%tmp.272 = getelementptr %G, %G* %tmp.271, i32 0, i32 0
	store %G_vtable* @G_vtable_prototype, %G_vtable** %tmp.272
	%tmp.273 = alloca %G*
	store %G* %tmp.271, %G** %tmp.273
	ret %G* %tmp.271

abort:
	call void @abort(  )
	unreachable
}

define %H* @H_new() {

entry:
	%tmp.274 = getelementptr %H_vtable, %H_vtable* @H_vtable_prototype, i32 0, i32 1
	%tmp.275 = load i32, i32* %tmp.274
	%tmp.276 = call i8*(i32) @malloc( i32 %tmp.275 )
	%tmp.277 = bitcast i8* %tmp.276 to %H*
	%tmp.278 = getelementptr %H, %H* %tmp.277, i32 0, i32 0
	store %H_vtable* @H_vtable_prototype, %H_vtable** %tmp.278
	%tmp.279 = alloca %H*
	store %H* %tmp.277, %H** %tmp.279
	ret %H* %tmp.277

abort:
	call void @abort(  )
	unreachable
}

define %I* @I_new() {

entry:
	%tmp.280 = getelementptr %I_vtable, %I_vtable* @I_vtable_prototype, i32 0, i32 1
	%tmp.281 = load i32, i32* %tmp.280
	%tmp.282 = call i8*(i32) @malloc( i32 %tmp.281 )
	%tmp.283 = bitcast i8* %tmp.282 to %I*
	%tmp.284 = getelementptr %I, %I* %tmp.283, i32 0, i32 0
	store %I_vtable* @I_vtable_prototype, %I_vtable** %tmp.284
	%tmp.285 = alloca %I*
	store %I* %tmp.283, %I** %tmp.285
	ret %I* %tmp.283

abort:
	call void @abort(  )
	unreachable
}

define %J* @J_new() {

entry:
	%tmp.286 = getelementptr %J_vtable, %J_vtable* @J_vtable_prototype, i32 0, i32 1
	%tmp.287 = load i32, i32* %tmp.286
	%tmp.288 = call i8*(i32) @malloc( i32 %tmp.287 )
	%tmp.289 = bitcast i8* %tmp.288 to %J*
	%tmp.290 = getelementptr %J, %J* %tmp.289, i32 0, i32 0
	store %J_vtable* @J_vtable_prototype, %J_vtable** %tmp.290
	%tmp.291 = alloca %J*
	store %J* %tmp.289, %J** %tmp.291
	ret %J* %tmp.289

abort:
	call void @abort(  )
	unreachable
}

define %K* @K_new() {

entry:
	%tmp.292 = getelementptr %K_vtable, %K_vtable* @K_vtable_prototype, i32 0, i32 1
	%tmp.293 = load i32, i32* %tmp.292
	%tmp.294 = call i8*(i32) @malloc( i32 %tmp.293 )
	%tmp.295 = bitcast i8* %tmp.294 to %K*
	%tmp.296 = getelementptr %K, %K* %tmp.295, i32 0, i32 0
	store %K_vtable* @K_vtable_prototype, %K_vtable** %tmp.296
	%tmp.297 = alloca %K*
	store %K* %tmp.295, %K** %tmp.297
	ret %K* %tmp.295

abort:
	call void @abort(  )
	unreachable
}

define %L* @L_new() {

entry:
	%tmp.298 = getelementptr %L_vtable, %L_vtable* @L_vtable_prototype, i32 0, i32 1
	%tmp.299 = load i32, i32* %tmp.298
	%tmp.300 = call i8*(i32) @malloc( i32 %tmp.299 )
	%tmp.301 = bitcast i8* %tmp.300 to %L*
	%tmp.302 = getelementptr %L, %L* %tmp.301, i32 0, i32 0
	store %L_vtable* @L_vtable_prototype, %L_vtable** %tmp.302
	%tmp.303 = alloca %L*
	store %L* %tmp.301, %L** %tmp.303
	ret %L* %tmp.301

abort:
	call void @abort(  )
	unreachable
}

define %M* @M_new() {

entry:
	%tmp.304 = getelementptr %M_vtable, %M_vtable* @M_vtable_prototype, i32 0, i32 1
	%tmp.305 = load i32, i32* %tmp.304
	%tmp.306 = call i8*(i32) @malloc( i32 %tmp.305 )
	%tmp.307 = bitcast i8* %tmp.306 to %M*
	%tmp.308 = getelementptr %M, %M* %tmp.307, i32 0, i32 0
	store %M_vtable* @M_vtable_prototype, %M_vtable** %tmp.308
	%tmp.309 = alloca %M*
	store %M* %tmp.307, %M** %tmp.309
	ret %M* %tmp.307

abort:
	call void @abort(  )
	unreachable
}

define %N* @N_new() {

entry:
	%tmp.310 = getelementptr %N_vtable, %N_vtable* @N_vtable_prototype, i32 0, i32 1
	%tmp.311 = load i32, i32* %tmp.310
	%tmp.312 = call i8*(i32) @malloc( i32 %tmp.311 )
	%tmp.313 = bitcast i8* %tmp.312 to %N*
	%tmp.314 = getelementptr %N, %N* %tmp.313, i32 0, i32 0
	store %N_vtable* @N_vtable_prototype, %N_vtable** %tmp.314
	%tmp.315 = alloca %N*
	store %N* %tmp.313, %N** %tmp.315
	ret %N* %tmp.313

abort:
	call void @abort(  )
	unreachable
}

define %O* @O_new() {

entry:
	%tmp.316 = getelementptr %O_vtable, %O_vtable* @O_vtable_prototype, i32 0, i32 1
	%tmp.317 = load i32, i32* %tmp.316
	%tmp.318 = call i8*(i32) @malloc( i32 %tmp.317 )
	%tmp.319 = bitcast i8* %tmp.318 to %O*
	%tmp.320 = getelementptr %O, %O* %tmp.319, i32 0, i32 0
	store %O_vtable* @O_vtable_prototype, %O_vtable** %tmp.320
	%tmp.321 = alloca %O*
	store %O* %tmp.319, %O** %tmp.321
	ret %O* %tmp.319

abort:
	call void @abort(  )
	unreachable
}

define %P* @P_new() {

entry:
	%tmp.322 = getelementptr %P_vtable, %P_vtable* @P_vtable_prototype, i32 0, i32 1
	%tmp.323 = load i32, i32* %tmp.322
	%tmp.324 = call i8*(i32) @malloc( i32 %tmp.323 )
	%tmp.325 = bitcast i8* %tmp.324 to %P*
	%tmp.326 = getelementptr %P, %P* %tmp.325, i32 0, i32 0
	store %P_vtable* @P_vtable_prototype, %P_vtable** %tmp.326
	%tmp.327 = alloca %P*
	store %P* %tmp.325, %P** %tmp.327
	ret %P* %tmp.325

abort:
	call void @abort(  )
	unreachable
}

define %Q* @Q_new() {

entry:
	%tmp.328 = getelementptr %Q_vtable, %Q_vtable* @Q_vtable_prototype, i32 0, i32 1
	%tmp.329 = load i32, i32* %tmp.328
	%tmp.330 = call i8*(i32) @malloc( i32 %tmp.329 )
	%tmp.331 = bitcast i8* %tmp.330 to %Q*
	%tmp.332 = getelementptr %Q, %Q* %tmp.331, i32 0, i32 0
	store %Q_vtable* @Q_vtable_prototype, %Q_vtable** %tmp.332
	%tmp.333 = alloca %Q*
	store %Q* %tmp.331, %Q** %tmp.333
	ret %Q* %tmp.331

abort:
	call void @abort(  )
	unreachable
}

