//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully and add code to build an LLVM program
//**************************************************************

#define EXTERN
#include "cgen.h"
#include <string>
#include <sstream>

#ifndef MP3
#define MP3
#endif
//
extern int cgen_debug;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.  Feel free to add your
// own definitions as you see fit.
//
//////////////////////////////////////////////////////////////////////
EXTERN Symbol
	// required classes
	Object,
	IO,
	String,
	Int,
	Bool,
	Main,

	// class methods
	cool_abort,
	type_name,
	cool_copy,
	out_string,
	out_int,
	in_string,
	in_int,
	length,
	concat,
	substr,

	// class members
	val,

	// special symbols
	No_class,  // symbol that can't be the name of any user-defined class
	No_type,   // If e : No_type, then no code is generated for e.
	SELF_TYPE, // Special code is generated for new SELF_TYPE.
	self,	   // self generates code differently than other references

	// extras
	arg,
	arg2,
	prim_string,
	prim_int,
	prim_bool;

//********************************************************
//
// PREDEFINED FUNCTIONS:
//
// The following functions are already coded, you should
// not need to modify them, although you may if necessary.
//
//********************************************************

//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
	Object = idtable.add_string("Object");
	IO = idtable.add_string("IO");
	String = idtable.add_string("String");
	Int = idtable.add_string("Int");
	Bool = idtable.add_string("Bool");
	Main = idtable.add_string("Main");

	cool_abort = idtable.add_string("abort");
	type_name = idtable.add_string("type_name");
	cool_copy = idtable.add_string("copy");
	out_string = idtable.add_string("out_string");
	out_int = idtable.add_string("out_int");
	in_string = idtable.add_string("in_string");
	in_int = idtable.add_string("in_int");
	length = idtable.add_string("length");
	concat = idtable.add_string("concat");
	substr = idtable.add_string("substr");

	val = idtable.add_string("val");

	No_class = idtable.add_string("_no_class");
	No_type = idtable.add_string("_no_type");
	SELF_TYPE = idtable.add_string("SELF_TYPE");
	self = idtable.add_string("self");

	arg = idtable.add_string("arg");
	arg2 = idtable.add_string("arg2");
	prim_string = idtable.add_string("sbyte*");
	prim_int = idtable.add_string("int");
	prim_bool = idtable.add_string("bool");
}

op_type get_type_st(string type_name)
{
	if (type_name == "Int" || type_name == "int")
	{
		return op_type(INT32);
	}
	if (type_name == "Bool" || type_name == "bool")
	{
		return op_type(INT1);
	}
	if (type_name == "sbyte*")
	{
		return op_type(INT8_PTR);
	}
	return op_type(type_name + std::string("*"));
}
string split_str(string x, char delim)
{
	string res;
	int i = 0;
	for (; i < x.length(); i++)
	{
		if (x[i] == delim)
			break;
	}
	return x.substr(i + 1);
}
op_type remove_para_type(op_type type)
{
	string res_str;
	for (char c : type.get_name())
	{
		if (c == ' ')
			break;
		res_str += c;
	}
	op_type res(res_str);
	res.set_name(res_str);
	return res;
}
//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************
void program_class::cgen(ostream &os)
{
	initialize_constants();
	class_table = new CgenClassTable(classes, os);
}

// Create definitions for all String constants
void StrTable::code_string_table(ostream &s, CgenClassTable *ct)
{
	for (List<StringEntry> *l = tbl; l; l = l->tl())
	{
		l->hd()->code_def(s, ct);
	}
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream &s, CgenClassTable *ct)
{
	for (List<IntEntry> *l = tbl; l; l = l->tl())
	{
		l->hd()->code_def(s, ct);
	}
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2.1
//
void CgenClassTable::setup_external_functions()
{
	ValuePrinter vp;
	// setup function: external int strcmp(sbyte*, sbyte*)
	op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
	vector<op_type> strcmp_args;
	strcmp_args.push_back(i8ptr_type);
	strcmp_args.push_back(i8ptr_type);
	vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args);

	// setup function: external int printf(sbyte*, ...)
	vector<op_type> printf_args;
	printf_args.push_back(i8ptr_type);
	printf_args.push_back(vararg_type);
	vp.declare(*ct_stream, i32_type, "printf", printf_args);

	// setup function: external void abort(void)
	op_type void_type(VOID);
	vector<op_type> abort_args;
	vp.declare(*ct_stream, void_type, "abort", abort_args);

	// setup function: external i8* malloc(i32)
	vector<op_type> malloc_args;
	malloc_args.push_back(i32_type);
	vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
	//ADD CODE HERE
	//Setup external functions for built in object class functions
	op_type obj_ptr_type("Object*"), str_ptr_type("String*"), io_ptr_type("IO*"), int_ptr_type("Int*"), bool_ptr_type("Bool*"), i1_type(INT1);

	// setup function: declare %Object* @Object_new()
	vector<op_type> obj_new_args;
	vp.declare(*ct_stream, obj_ptr_type, "Object_new", obj_new_args);

	// setup function: declare %Object* @Object_abort(%Object*)
	vector<op_type> obj_abort_args;
	obj_abort_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, obj_ptr_type, "Object_abort", obj_abort_args);

	// setup function: declare %String* @Object_type_name(%Object*)
	vector<op_type> obj_type_args;
	obj_type_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "Object_type_name", obj_type_args);

	// setup function: declare %Object* @Object_copy(%Object*)
	vector<op_type> obj_copy_args;
	obj_copy_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, obj_ptr_type, "Object_copy", obj_copy_args);

	// setup function: declare %IO* @IO_new()
	vector<op_type> io_new_args;
	vp.declare(*ct_stream, io_ptr_type, "IO_new", io_new_args);

	// setup function: declare %IO* @IO_out_string(%IO*, %String*)
	vector<op_type> io_out_string_args;
	io_out_string_args.push_back(io_ptr_type);
	io_out_string_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, io_ptr_type, "IO_out_string", io_out_string_args);

	// setup function: declare %IO* @IO_out_int(%IO*, i32)
	vector<op_type> io_out_int_args;
	io_out_int_args.push_back(io_ptr_type);
	io_out_int_args.push_back(i32_type);
	vp.declare(*ct_stream, io_ptr_type, "IO_out_int", io_out_int_args);

	// setup function: declare %String* @IO_in_string(%IO*)
	vector<op_type> io_in_string_args;
	io_in_string_args.push_back(io_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "IO_in_string", io_in_string_args);

	// setup function: declare i32 @IO_in_int(%IO*)
	vector<op_type> io_in_int_args;
	io_in_int_args.push_back(io_ptr_type);
	vp.declare(*ct_stream, i32_type, "IO_in_int", io_in_int_args);

	// setup function: declare %String* @String_new()
	vector<op_type> string_new_args;
	vp.declare(*ct_stream, str_ptr_type, "String_new", string_new_args);

	// setup function: declare i32 @String_length(%String*)
	vector<op_type> str_len_args;
	str_len_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, i32_type, "String_length", str_len_args);

	// setup function: declare %String* @String_concat(%String*, %String*)
	vector<op_type> str_concat_args;
	str_concat_args.push_back(str_ptr_type);
	str_concat_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "String_concat", str_concat_args);

	// setup function: declare %String* @String_substr(%String*, i32, i32)
	vector<op_type> str_substr_args;
	str_substr_args.push_back(str_ptr_type);
	str_substr_args.push_back(i32_type);
	str_substr_args.push_back(i32_type);
	vp.declare(*ct_stream, str_ptr_type, "String_substr", str_substr_args);

	// setup function: declare %Int* @Int_new()
	vector<op_type> int_new_args;
	vp.declare(*ct_stream, int_ptr_type, "Int_new", int_new_args);

	// setup function: declare void @Int_init(%Int*, i32)
	vector<op_type> int_init_args;
	int_init_args.push_back(int_ptr_type);
	int_init_args.push_back(i32_type);
	vp.declare(*ct_stream, void_type, "Int_init", int_init_args);

	// setup function: declare %Bool* @Bool_new()
	vector<op_type> bool_new_args;
	vp.declare(*ct_stream, bool_ptr_type, "Bool_new", bool_new_args);

	// setup function: declare void @Bool_init(%Bool*, i1)
	vector<op_type> bool_init_args;
	bool_init_args.push_back(bool_ptr_type);
	bool_init_args.push_back(i1_type);
	vp.declare(*ct_stream, void_type, "Bool_init", bool_init_args);
#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes()
{
	// The tree package uses these globals to annotate the classes built below.
	curr_lineno = 0;
	Symbol filename = stringtable.add_string("<basic class>");

	//
	// A few special class names are installed in the lookup table but not
	// the class list. Thus, these classes exist, but are not part of the
	// inheritance hierarchy.

	// No_class serves as the parent of Object and the other special classes.
	Class_ noclasscls = class_(No_class, No_class, nil_Features(), filename);
	install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
	delete noclasscls;

#ifdef MP3
	// SELF_TYPE is the self class; it cannot be redefined or inherited.
	Class_ selftypecls = class_(SELF_TYPE, No_class, nil_Features(), filename);
	install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
	delete selftypecls;
	//
	// Primitive types masquerading as classes. This is done so we can
	// get the necessary Symbols for the innards of String, Int, and Bool
	//
	Class_ primstringcls = class_(prim_string, No_class, nil_Features(), filename);
	install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
	delete primstringcls;
#endif
	Class_ primintcls = class_(prim_int, No_class, nil_Features(), filename);
	install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
	delete primintcls;
	Class_ primboolcls = class_(prim_bool, No_class, nil_Features(), filename);
	install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
	delete primboolcls;
	//
	// The Object class has no parent class. Its methods are
	//        cool_abort() : Object   aborts the program
	//        type_name() : Str       returns a string representation of class name
	//        copy() : SELF_TYPE      returns a copy of the object
	//
	// There is no need for method bodies in the basic classes---these
	// are already built in to the runtime system.
	//
	Class_ objcls =
		class_(Object,
			   No_class,
			   append_Features(
				   append_Features(
					   single_Features(method(cool_abort, nil_Formals(),
											  Object, no_expr())),
					   single_Features(method(type_name, nil_Formals(),
											  String, no_expr()))),
				   single_Features(method(cool_copy, nil_Formals(),
										  SELF_TYPE, no_expr()))),
			   filename);
	install_class(new CgenNode(objcls, CgenNode::Basic, this));
	delete objcls;

	//
	// The Int class has no methods and only a single attribute, the
	// "val" for the integer.
	//
	Class_ intcls =
		class_(Int,
			   Object,
			   single_Features(attr(val, prim_int, no_expr())),
			   filename);
	install_class(new CgenNode(intcls, CgenNode::Basic, this));
	delete intcls;

	//
	// Bool also has only the "val" slot.
	//
	Class_ boolcls =
		class_(Bool,
			   Object,
			   single_Features(attr(val, prim_bool, no_expr())),
			   filename);
	install_class(new CgenNode(boolcls, CgenNode::Basic, this));
	delete boolcls;

#ifdef MP3
	//
	// The class String has a number of slots and operations:
	//       val                                  the string itself
	//       length() : Int                       length of the string
	//       concat(arg: Str) : Str               string concatenation
	//       substr(arg: Int, arg2: Int): Str     substring
	//
	Class_ stringcls =
		class_(String,
			   Object,
			   append_Features(
				   append_Features(
					   append_Features(
						   single_Features(attr(val, prim_string, no_expr())),
						   single_Features(method(length, nil_Formals(),
												  Int, no_expr()))),
					   single_Features(method(concat,
											  single_Formals(formal(arg, String)),
											  String,
											  no_expr()))),
				   single_Features(method(substr,
										  append_Formals(
											  single_Formals(formal(arg, Int)),
											  single_Formals(formal(arg2, Int))),
										  String,
										  no_expr()))),
			   filename);
	install_class(new CgenNode(stringcls, CgenNode::Basic, this));
	delete stringcls;
#endif

#ifdef MP3
	//
	// The IO class inherits from Object. Its methods are
	//        out_string(Str) : SELF_TYPE          writes a string to the output
	//        out_int(Int) : SELF_TYPE               "    an int    "  "     "
	//        in_string() : Str                    reads a string from the input
	//        in_int() : Int                         "   an int     "  "     "
	//
	Class_ iocls =
		class_(IO,
			   Object,
			   append_Features(
				   append_Features(
					   append_Features(
						   single_Features(method(out_string,
												  single_Formals(formal(arg, String)),
												  SELF_TYPE, no_expr())),
						   single_Features(method(out_int, single_Formals(formal(arg, Int)),
												  SELF_TYPE, no_expr()))),
					   single_Features(method(in_string, nil_Formals(), String,
											  no_expr()))),
				   single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
			   filename);
	install_class(new CgenNode(iocls, CgenNode::Basic, this));
	delete iocls;
#endif
}

//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_classes(Classes cs)
{
	for (int i = cs->first(); cs->more(i); i = cs->next(i))
	{
		install_class(new CgenNode(cs->nth(i), CgenNode::NotBasic, this));
	}
}

//
// Add this CgenNode to the class list and the lookup table
//
void CgenClassTable::install_class(CgenNode *nd)
{
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of classes
	// and the symbol table.
	nds = new List<CgenNode>(nd, nds);
	addid(name, nd);
}

//
// Add this CgenNode to the special class list and the lookup table
//
void CgenClassTable::install_special_class(CgenNode *nd)
{
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of special classes
	// and the symbol table.
	special_nds = new List<CgenNode>(nd, special_nds);
	addid(name, nd);
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree()
{
	for (List<CgenNode> *l = nds; l; l = l->tl())
		set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd)
{
	CgenNode *parent_node = probe(nd->get_parent());
	nd->set_parentnd(parent_node);
	parent_node->add_child(nd);
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root()
{
	return probe(Object);
}

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP2-1 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP3

CgenNode *CgenClassTable::getMainmain(CgenNode *c)
{
	if (c && !c->basic())
		return c; // Found it!

	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
	{
		if (CgenNode *foundMain = this->getMainmain(child->hd()))
			return foundMain; // Propagate it up the recursive calls
	}

	return 0; // Make the recursion continue
}

#endif

//-------------------------------------------------------------------
//
// END OF PREDEFINED FUNCTIONS
//
//-------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////
//
// coding string, int, and boolean constants
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type stringEntry.  stringEntry methods are defined both for string
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Create global definitions for constant Cool objects
//
void CgenClassTable::code_constants()
{
#ifdef MP3
	// ADD CODE HERE
	stringtable.code_string_table(*this->ct_stream, this);

#endif
}

// generate code to define a global string constant
void StringEntry::code_def(ostream &s, CgenClassTable *ct)
{
#ifdef MP3
	// ADD CODE HERE
	// @str.IO = internal constant [3 x i8] c"IO\00", align 1
	ValuePrinter vp(s);
	op_arr_type strType(INT8, this->get_len() + 1);
	op_arr_ptr_type strPType(INT8_PTR, this->get_len() + 1);
	const_value conStr(strType, string(this->get_string()), true);
	string output = "str." + std::to_string(this->index);
	vp.init_constant(output, conStr);
	//op types
	vector<op_type> op_types;
	op_type type1("String_vtable*");
	op_type type2(INT8_PTR);
	op_types.push_back(type1);
	op_types.push_back(type2);
	//op values
	vector<const_value> op_values;
	op_values.push_back(const_value(type1, "@String_vtable_prototype", false));
	op_values.push_back(const_value(strType, "@" + output, false));
	string nameOfStruct = "String." + std::to_string(this->index);
	global_value nameGlobal(op_type("String"), nameOfStruct);
	vp.init_struct_constant(nameGlobal, op_types, op_values);
	global_value globalStr(op_type("String*"), nameOfStruct);
	ct->string_global_value.push_back(globalStr);
	ct->string_name.push_back(string(this->get_string()));
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream &s, CgenClassTable *ct)
{
	// Leave this method blank, since we are not going to use global
	// declarations for int constants.
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//
// CgenClassTable constructor orchestrates all code generation
//
CgenClassTable::CgenClassTable(Classes classes, ostream &s)
	: nds(0)
{
	if (cgen_debug)
		std::cerr << "Building CgenClassTable" << endl;
	ct_stream = &s;
	// Make sure we have a scope, both for classes and for constants
	enterscope();

	// Create an inheritance tree with one CgenNode per class.
	install_basic_classes();
	install_classes(classes);
	build_inheritance_tree();

	// First pass
	setup();

	// Second pass
	code_module();
	// Done with code generation: exit scopes
	exitscope();
}

CgenClassTable::~CgenClassTable()
{
}

// The code generation first pass.  Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup()
{
	setup_external_functions();
	setup_classes(root(), 0);
}

void CgenClassTable::setup_classes(CgenNode *c, int depth)
{
	// MAY ADD CODE HERE
	// if you want to give classes more setup information

	c->setup(current_tag++, depth);
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
		setup_classes(child->hd(), depth + 1);

	c->set_max_child(current_tag - 1);

	/*
	if (cgen_debug)
		std::cerr << "Class " << c->get_name() << " assigned tag " 
			<< c->get_tag() << ", max child " << c->get_max_child() 
			<< ", depth " << c->get_depth() << endl;
	*/
}

// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module()
{
	code_constants();

#ifndef MP3
	// This must be after code_module() since that emits constants
	// needed by the code() method for expressions
	CgenNode *mainNode = getMainmain(root());
	mainNode->codeGenMainmain();
#endif
	code_main();

#ifdef MP3
	code_classes(root());
#else
#endif
}

#ifdef MP3
void CgenClassTable::code_classes(CgenNode *c)
{

	// ADD CODE HERE
	c->code_class();
	for (List<CgenNode> *child = c->get_children(); child; child = child->tl())
	{
		code_classes(child->hd());
	}
}
#endif

//
// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
	ValuePrinter vp(*(this->ct_stream));
	string str = "Main.main() returned %d\n";
	const_value conStr(op_arr_type(INT8, str.length() + 1),
					   str, true);
	op_arr_type strType(INT8, str.length() + 1);
	op_arr_ptr_type strPType(INT8, str.length() + 1);
	global_value strName(strPType, "main.printout.str", conStr);
	// vp.init_constant("main.printout.str", conStr);
	// Define a function main that has no parameters and returns an i32
	vp.define(op_type(INT32), "main", vector<operand>());
	// Define an entry basic block
	vp.begin_block("entry");

#ifndef MP3
	// Call Main_main(). This returns int* for phase 1, Object for phase 2
	operand ret = vp.call(vector<op_type>(), op_type(INT32), "Main_main", true, vector<operand>());
	// Get the address of the string "Main_main() returned %d\n" using
	// getelementptr
	operand Saddr = vp.getelementptr(strType, strName, int_value(0), int_value(0), op_type(INT8_PTR));
	// Call printf with the string address of "Main_main() returned %d\n"
	// and the return value of Main_main() as its arguments
	vector<op_type> print_arg_type = {INT8_PTR, VAR_ARG};
	vector<operand> print_arg = {Saddr, ret};
	vp.call(print_arg_type, op_type(INT32), "printf", true, print_arg);
	// Insert return 0
	vp.ret(int_value(0));
#else
	// Phase 2
	//	define i32 @main() {
	//	entry:
	//		%main.obj = call %Main*()* @Main_new( )
	//		%main.retval = call %Object*(%Main*)* @Main_main( %Main* %main.obj )
	//		ret i32 0
	//	}

	//%main.obj = call %Main*()* @Main_new( )
	vector<operand> main_args_values;
	vector<op_type> main_args_types;
	// main_args_values.push_back(operand());
	// main_args_types.push_back(op_type());
	op_type main_type("Main*");
	operand obj_operand(main_type, "main.obj");
	obj_operand.set_type(op_type("Main*()"));
	vp.call(*ct_stream, main_args_types, "Main_new", true, main_args_values, obj_operand);

	//%main.retval = call %Object*(%Main*)* @Main_main( %Main* %main.obj )
	vector<operand> retval_args_values;
	vector<op_type> retval_args_types;
	obj_operand.set_type(op_type("Main*"));
	op_type ret_type = main_return_type;
	operand retval_operand(ret_type, "main.retval");
	retval_args_values.push_back(obj_operand);
	retval_args_types.push_back(main_type);
	vp.call(*ct_stream, retval_args_types, "Main_main", true, retval_args_values, retval_operand);

	//ret i32 0
	vp.ret(int_value(0));
#endif
	vp.end_define();
}

///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTable *ct)
	: class__class((const class__class &)*nd),
	  parentnd(0), children(0), basic_status(bstatus), class_table(ct), tag(-1)
{
	// ADD CODE HERE
}

void CgenNode::add_child(CgenNode *n)
{
	children = new List<CgenNode>(n, children);
}

void CgenNode::set_parentnd(CgenNode *p)
{
	assert(parentnd == NULL);
	assert(p != NULL);
	parentnd = p;
}

//
// Class setup.  You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).
//
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth)
{
	this->tag = tag;
#ifdef MP3
	// ADD CODE HERE
	this->depth = depth;
	layout_features();
	ValuePrinter vp(*(this->get_classtable()->ct_stream));
	setup_buildin_vtable();

	if (!(get_parentnd()->basic()))
	{
		// op_type temp(std::string(get_parentnd()->get_type_name()) + std::string("*"));
		vector<op_type> parent_attr = get_parentnd()->attri_list;
		for (int i = parent_attr.size() - 1; i >= 0; i--)
		{
			// std::cerr << "aaaaaaaaaa" << parent_attr[i].get_name() << endl;
			attri_list.insert(attri_list.begin(), parent_attr[i]);
			attri_name_list.insert(attri_name_list.begin(), get_parentnd()->attri_name_list[i]);
		}
	}

	//@str.Object = internal constant [7 x i8] c"Object\00"
	string GlobalStr = name->get_string();
	op_arr_type str_array(INT8, GlobalStr.length() + 1);
	const_value strConst(str_array, GlobalStr, true);
	vp.init_constant(std::string("str.") + name->get_string(), strConst);
	global_value strGlobal(op_type("String*"), std::string("str.") + name->get_string());
	class_table->string_global_value.push_back(strGlobal);
	class_table->string_name.push_back(name->get_string());

	//Add inherited classes
	if (!basic())
		setup_inherited_class();
	//after adding basic classes to vtables add new ones
	for (size_t i = 0; i < extra_v_types.size(); i++)
	{
		//%String* (%Razz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Razz*) *)
		// std::cerr << extra_v_func_types[i].is_self_ret() << endl;
		vector<op_type> argument = vector<op_type>(extra_v_func_types[i].get_arg_types());
		vector<op_type> ori_argument = vector<op_type>(extra_v_ori_func_types[i].get_arg_types());
		string ori_para, cur_para;
		for (int x = 0; x < argument.size(); x++)
		{
			ori_para += ori_argument[x].get_name();
			cur_para += argument[x].get_name();
			if (x != argument.size() - 1)
			{
				ori_para += ",";
				cur_para += ",";
			}
		}
		string ori_res_type = extra_v_ori_func_types[i].get_result_type().get_name() + " (" + ori_para + ") *";
		string cur_res_type = extra_v_func_types[i].get_result_type().get_name() + " (" + cur_para + ") *";
		string inherited_string = "bitcast (" + ori_res_type + " " + extra_v_values[i].get_name() + " to " + cur_res_type + ")";
		if (extra_v_func_types[i].is_local())
		{
			inherited_string = extra_v_values[i].get_name();
		}

		const_value inherited_const(op_type(cur_res_type), inherited_string, false);
		op_type cur_res_op(cur_res_type);
		cur_res_op.set_name(cur_res_type);
		string function_proto = split_str(this->extra_v_values[i].get_name(), '_');
		bool localFunc = false;
		for (int j = 0; j < vtable_names.size(); j++)
		{
			if (vtable_names[j].compare(function_proto) == 0)
			{
				vtable_types[j] = cur_res_op;
				vtable_values[j] = inherited_const;
				localFunc = true;
				break;
			}
		}
		if (localFunc)
			continue;
		vtable_types.push_back(cur_res_op);
		vtable_values.push_back(inherited_const);
		vtable_names.push_back(split_str(this->extra_v_values[i].get_name(), '_'));
		vtable_func_types.push_back(extra_v_func_types[i]);
	}

	op_type vtable_type(std::string(name->get_string()) + "_vtable", 1);
	vector<op_type> types;

	types.push_back(vtable_type);
	for (size_t i = 0; i < attri_list.size(); i++)
	{
		types.push_back(attri_list[i]);
		// std::cerr << "ccccccccccccc" << attri_list[i].get_name() << endl;
	}
	vp.type_define(name->get_string(), types);

	vp.type_define(std::string(name->get_string()) + "_vtable", vtable_types);

	op_type prototype_op(std::string(std::string(name->get_string()) + std::string("_vtable")));
	global_value prototype_global(prototype_op, std::string(name->get_string()) + std::string("_vtable_prototype"));
	vp.init_struct_constant(prototype_global, vtable_types, vtable_values);

#endif
}

#ifdef MP3
//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class()
{
	// No code generation for basic classes. The runtime will handle that.
	if (basic())
		return;

	// ADD CODE HERE
	//define %Main* @Main_new() {

	// entry:
	// 	%tmp.15 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	// 	%tmp.16 = load i32, i32* %tmp.15
	// 	%tmp.17 = call i8*(i32) @malloc( i32 %tmp.16 )
	// 	%tmp.18 = bitcast i8* %tmp.17 to %Main*
	// 	%tmp.19 = getelementptr %Main, %Main* %tmp.18, i32 0, i32 0
	// 	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.19
	// 	%tmp.20 = alloca %Main*
	// 	store %Main* %tmp.18, %Main** %tmp.20
	// 	%tmp.21 = getelementptr %Main, %Main* %tmp.18, i32 0, i32 1
	// 	store i32 5, i32* %tmp.21
	// 	ret %Main* %tmp.18

	// abort:
	// 	call void @abort(  )
	// 	unreachable
	// }
	// ValuePrinter vp(*(this->get_classtable()->ct_stream));
	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));

	env->method = true;
	int i = features->first();
	while (features->more(i))
	{
		features->nth(i)->code(env);
		i = features->next(i);
	}

	//define %Main* @Main_new() {
	vp.define(get_type_name() + "*", get_type_name() + "_new", {});
	vp.begin_block("entry");
	//%tmp.15 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	std::string vtable_str = get_type_name() + "_vtable";
	op_type class_vtable_type(vtable_str);
	op_type class_vtable_ptr_type(vtable_str + "*");
	global_value class_vtable_global(class_vtable_ptr_type, get_type_name() + "_vtable_prototype");
	operand get_ele = vp.getelementptr(class_vtable_type, class_vtable_global, int_value(0), int_value(1), op_type(INT32_PTR));
	//%tmp.16 = load i32, i32* %tmp.15
	operand load1 = vp.load(op_type(INT32), get_ele);
	//%tmp.17 = call i8*(i32) @malloc( i32 %tmp.16 )
	operand malloc = vp.call({op_type(INT32)}, op_type(INT8_PTR), "malloc", true, {load1});
	// malloc = conform(malloc, op_type(string(this->get_type_name()) + "*"), env);
	//%tmp.18 = bitcast i8* %tmp.17 to %Main*
	op_type class_type(get_type_name());
	op_type class_ptr_type(get_type_name() + "*");
	operand bitcast = vp.bitcast(malloc, class_ptr_type);
	env->real_type = bitcast;
	//%tmp.19 = getelementptr %Main, %Main* %tmp.18, i32 0, i32 0
	op_type class_vtable_ptr_ptr_type(vtable_str + "**");
	operand get_ele2 = vp.getelementptr(class_type, bitcast, int_value(0), int_value(0), class_vtable_ptr_ptr_type);
	//store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.19
	vp.store(class_vtable_global, get_ele2);
	//%tmp.20 = alloca %Main*
	operand alloca_main = vp.alloca_mem(class_ptr_type);
	env->add_local(self, alloca_main);
	// std::cerr << "add local 987 " << endl;
	//store %Main* %tmp.18, %Main** %tmp.20
	vp.store(bitcast, alloca_main);
	env->method = false;

	for (int i = this->depth; i > 0; i--)
	{
		CgenNode *cur = this;
		for (int j = 0; j < i; j++)
		{
			cur = cur->parentnd;
		}
		for (int x = cur->features->first(); cur->features->more(x); x = cur->features->next(x))
		{
			cur->features->nth(x)->code(env);
		}
	}

	int x = features->first();
	while (features->more(x))
	{
		features->nth(x)->code(env);
		x = features->next(x);
	}

	env->kill_local();
	//ret %Main* %tmp.11
	vp.ret(bitcast);

	//abort:
	//	call void @abort(  )
	//	unreachable
	//}
	vp.begin_block("abort");
	vp.call({}, VOID, "abort", true, {});
	vp.unreachable();
	vp.end_define();
}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
	// ADD CODE HERE
	int idx = features->first();
	while (features->more(idx))
	{
		features->nth(idx)->layout_feature(this);
		idx = features->next(idx);
	}
}
#else

//
// code-gen function main() in class Main
//
void CgenNode::codeGenMainmain()
{
	ValuePrinter vp;
	// In Phase 1, this can only be class Main. Get method_class for main().
	assert(std::string(this->name->get_string()) == std::string("Main"));
	method_class *mainMethod = (method_class *)features->nth(features->first());

	// ADD CODE HERE TO GENERATE THE FUNCTION int Mainmain().
	// Generally what you need to do are:
	// -- setup or create the environment, env, for translating this method
	// -- invoke mainMethod->code(env) to translate the method
	CgenEnvironment *env = new CgenEnvironment(*class_table->ct_stream, this);
	mainMethod->code(env);
}

#endif

//
// CgenEnvironment functions
//

//
// Class CgenEnvironment should be constructed by a class prior to code
// generation for each method.  You may need to add parameters to this
// constructor.
//
CgenEnvironment::CgenEnvironment(std::ostream &o, CgenNode *c)
{
	cur_class = c;
	cur_stream = &o;
	var_table.enterscope();
	tmp_count = block_count = ok_count = 0;
	// ADD CODE HERE
}

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t)
{
	return t == SELF_TYPE ? get_class()
						  : get_class()->get_classtable()->lookup(t);
}

// Provided CgenEnvironment methods
// Generate unique string names
std::string CgenEnvironment::new_name()
{
	std::stringstream s;
	s << tmp_count++;
	return "vtpm." + s.str();
}

std::string CgenEnvironment::new_ok_label()
{
	std::stringstream s;
	s << ok_count++;
	return "ok." + s.str();
}
const std::string CgenEnvironment::new_label(const std::string &prefix,
											 bool increment)
{
	std::string suffix = itos(block_count);
	block_count += increment;
	return prefix + suffix;
}

void CgenEnvironment::add_local(Symbol name, operand &vb)
{
	var_table.enterscope();
	var_table.addid(name, &vb);
}

void CgenEnvironment::kill_local()
{
	var_table.exitscope();
}

////////////////////////////////////////////////////////////////////////////
//
// APS class methods
//
////////////////////////////////////////////////////////////////////////////

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.handcode.h'.
//
//*****************************************************************

#ifdef MP3
// conform and get_class_tag are only needed for MP3

// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env)
{
	// ADD CODE HERE (MP3 ONLY)
	std::cerr << "conform" << endl;
	ValuePrinter vp(*(env->cur_stream));
	//box
	string src_type_name = src.get_type().get_name();
	if (type.get_name() == "%String*" && src.get_name() == "null")
	{
		vector<operand> args;
		vector<op_type> arg_types;
		string funName = "String_new";
		operand strOutput = vp.call(arg_types, type, funName, true, args);
		return strOutput;
	}
	if (src_type_name != string(type.get_name()))
	{
		operand output = src;

		if (src_type_name == string(op_type(INT32).get_name()) ||
			src_type_name == string(op_type(INT1).get_name()))
		{
			op_type returnType;
			if (src_type_name == string(op_type(INT32).get_name()))
			{
				returnType = op_type("Int*");
				vector<operand> args;
				vector<op_type> arg_types;
				string funName = "Int_new";
				operand intOutput = vp.call(arg_types, returnType, funName, true, args);

				vector<operand> args2;
				vector<op_type> arg_types2;

				args2.push_back(intOutput);
				arg_types2.push_back(returnType);
				args2.push_back(src);
				arg_types2.push_back(src.get_type());
				string funName2 = "Int_init";
				operand intOutput2 = vp.call(arg_types2, op_type(VOID), funName2, true, args2);
				output = intOutput;
			}
			else
			{
				returnType = op_type("Bool*");
				vector<operand> args;
				vector<op_type> arg_types;
				string funName = "Bool_new";
				operand intOutput = vp.call(arg_types, returnType, funName, true, args);

				vector<operand> args2;
				vector<op_type> arg_types2;

				args2.push_back(intOutput);
				arg_types2.push_back(returnType);
				args2.push_back(src);
				arg_types2.push_back(src.get_type());
				string funName2 = "Bool_init";
				operand intOutput2 = vp.call(arg_types2, op_type(VOID), funName2, true, args2);
				output = intOutput;
			}
		}
		else if (type.get_name() == op_type(INT32).get_name() || type.get_name() == op_type(INT1).get_name())
		{
			if (type.get_name() == op_type(INT32).get_name())
			{
				if (src.get_type().get_name() == op_type("Object*").get_name())
				{
					src = vp.bitcast(src, op_type(INT32_PTR));
				}
				src.set_type_id(OBJ_PTR);
				operand vtable_operand = vp.getelementptr(src.get_type().get_deref_type(), src, int_value(0), int_value(1), op_type(INT32_PTR));
				output = vp.load(type, vtable_operand);
			}
			else
			{

				if (src.get_type().get_name() == op_type("Object*").get_name())
				{
					src = vp.bitcast(src, op_type(INT1_PTR));
				}
				src.set_type_id(OBJ_PTR);
				operand vtable_operand = vp.getelementptr(src.get_type().get_deref_type(), src, int_value(0), int_value(1), op_type(INT1_PTR));
				output = vp.load(type, vtable_operand);
			}
			return output;
		}
		else if (type.get_name() == op_type(INT8_PTR).get_name() && src_type_name == "%String*")
		{
			src.set_type_id(OBJ_PTR);
			operand vtable_operand = vp.getelementptr(src.get_type().get_deref_type(), src, int_value(0), int_value(1), op_type(INT8_PPTR));
			output = vp.load(type, vtable_operand);
			return output;
		}
		if (output.get_typename() != type.get_name())
			output = vp.bitcast(output, type);
		return output;
	}
	return src;
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env)
{
	// ADD CODE HERE (MP3 ONLY)
	ValuePrinter vp(*env->cur_stream);
	string src_name = src_cls->get_type_name();
	string src_type_name = src.get_typename();
	if (src_type_name[src_type_name.length() - 1] == '*' && src_type_name[src_type_name.length() - 2] == '*')
		src.set_type_id(OBJ_PPTR);
	else if (src_type_name[src_type_name.length() - 1] == '*')
		src.set_type_id(OBJ_PTR);
	operand get_ele = vp.getelementptr(src.get_type().get_deref_type(), src, int_value(0),
									   int_value(0), op_type(src_cls->get_type_name() + "_vtable**"));
	get_ele.set_type_id(OBJ_PPTR);
	operand vtable_ptr = vp.load(op_type(src_cls->get_type_name() + "_vtable").get_ptr_type(), get_ele);
	operand get_ele2 = vp.getelementptr(vtable_ptr.get_type().get_deref_type(), vtable_ptr,
										int_value(0), int_value(0), op_type(INT32_PTR));
	return vp.load(op_type(INT32), get_ele2);
}
#endif

//
// Create a method body
//
void method_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "method" << endl;
	// ADD CODE HERE
	if (!(env->method))
		return;
	ValuePrinter vp(*env->cur_stream);

	//	define %Alpha* @Alpha_getSelf(%Alpha* %self) {
	//
	//	entry:
	//		%tmp.0 = alloca %Alpha*
	//		store %Alpha* %self, %Alpha** %tmp.0
	//		%tmp.1 = load %Alpha** %tmp.0
	//		ret %Alpha* %tmp.1
	//
	//	abort:
	//		call void @abort(  )
	//		unreachable
	//	}
	//	class Alpha
	//	{
	//	   getSelf() : Alpha {self};
	//	};

	//define RETURN_TYPE @CLASS_FEATURENAME(SELF< .. OTHER PARAMS) {
	op_type ret_type = env->get_class()->get_type(return_type->get_string());
	string func_str = env->get_class()->get_type_name() + "_" + name->get_string();
	// std::cerr << "line1089" <<std::endl;
	op_type class_type(env->get_class()->get_type_name() + "*");
	operand self_op(class_type, "self");
	env->func_arguments = {};
	env->symbols = {};
	env->func_arguments.push_back(self_op);
	env->symbols.push_back(self);
	for (int x = formals->first(); formals->more(x); x = formals->next(x))
	{
		std::string formal_str = formals->nth(x)->get_type_decl()->get_string();
		op_type formal_type = env->get_class()->get_type(formal_str);
		operand formal_temp_op(formal_type, formals->nth(x)->get_name()->get_string());
		env->func_arguments.push_back(formal_temp_op);
		Symbol formal_symbol = formals->nth(x)->get_name();
		env->symbols.push_back(formal_symbol);
	}
	vp.define(ret_type, func_str, env->func_arguments);

	//entry:
	vp.begin_block("entry");

	// operand alloca;

	//GO ONTO OTHER FORMALS
	for (size_t i = 0; i < env->func_arguments.size(); i++)
	{
		//%tmp.0 = alloca %Main*
		operand *alloca = new operand(vp.alloca_mem(env->func_arguments[i].get_type()));
		// // std::cerr << "symbol vec at " << i << " " << env->symbols[i]->get_string() << std::endl;
		// if (std::string(env->symbols[i]->get_string()) == "self")
		// {
		// 	op_type temp_type = alloca.get_type();
		// 	temp_type.set_id(OBJ_PPTR);
		// 	alloca = operand(temp_type, alloca.get_name().substr(1));
		// }
		Symbol tmp_symbol = env->symbols[i];
		// std::cerr << "symbol vec at " << i << " " << tmp_symbol->get_string() << " with variable " << alloca->get_typename() << endl;
		env->add_local(tmp_symbol, *alloca);
		//store %Main* %self, %Main** %tmp.0
		operand conformed = conform(env->func_arguments[i], alloca->get_type().get_deref_type(), env);
		vp.store(conformed, *alloca);
	}
	operand result = expr->code(env);
	if (result.get_type().get_name() != ret_type.get_name())
		result = conform(result, ret_type, env);
	for (size_t i = 0; i < env->func_arguments.size(); i++)
		env->kill_local();
	vp.ret(result);

	vp.begin_block("abort");
	vp.call({}, VOID, "abort", true, {});
	vp.unreachable();

	vp.end_define();
}

//
// Codegen for expressions.  Note that each expression has a value.
//

operand assign_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "assign" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL

	ValuePrinter vp(*(env->cur_stream));
	operand *assign_op = env->lookup(name);
	operand assign;
	operand expr_operand = expr->code(env);
	if (assign_op)
	{
		assign = *assign_op;
	}
	else
	{
		operand *self_op = env->lookup(self);
		operand load_result = vp.load(self_op->get_type().get_deref_type(), *self_op);

		//%tmp.2 = getelementptr %Main* %tmp.1, i32 0, i32 1
		int_value zero_op(0);
		if (expr_operand.get_type().get_id() == OBJ)
			expr_operand.set_type_id(OBJ_PTR);
		op_type store_type(expr_operand.get_type().get_ptr_type());
		if (load_result.get_type().get_id() == OBJ)
			load_result.set_type_id(OBJ_PTR);
		int index = env->get_class()->get_attribute_index(this->name->get_string());
		assign = vp.getelementptr(load_result.get_type().get_deref_type(), load_result, zero_op, int_value(index + 1), env->get_class()->attri_list[index].get_ptr_type());
	}
	// if (assign.get_type().get_id() == OBJ)
	// 	assign.set_type_id(OBJ_PTR);
	operand conformed = conform(expr_operand, assign.get_type().get_deref_type(), env);
	vp.store(*(env->cur_stream), conformed, assign);
	return expr_operand;
}

operand cond_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "cond" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);

	op_type resType = env->get_class()->get_type(then_exp->get_type()->get_string());
	//check the type to get the allocation size
	// if (then_exp->get_type()->equal_string("Int", 3))
	// {
	// 	resType = op_type(INT32);
	// }
	// else if (then_exp->get_type()->equal_string("Bool", 4))
	// {
	// 	resType = op_type(INT1);
	// }

	operand resPtr = vp.alloca_mem(resType);
	// resPtr.set_type(op_type("Object").get_ptr_type());
	//creat blocks
	string true_label = env->new_label("true.", false);
	string false_label = env->new_label("false.", false);
	string end_label = env->new_label("end.", true);
	//Compute condition expression and setup branch code
	operand cond = pred->code(env);
	vp.branch_cond(cond, true_label, false_label);

	//true label
	vp.begin_block(true_label);
	operand then_op = then_exp->code(env);
	operand conformed = conform(then_op, resPtr.get_type().get_deref_type(), env);
	vp.store(conformed, resPtr);
	vp.branch_uncond(end_label);

	//false label
	vp.begin_block(false_label);
	operand else_op = else_exp->code(env);
	operand conformed2 = conform(else_op, resPtr.get_type().get_deref_type(), env);
	vp.store(conformed2, resPtr);
	vp.branch_uncond(end_label);

	//end label
	vp.begin_block(end_label);

	return vp.load(resType, resPtr);
}

operand loop_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "loop" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);

	//loop start by indicator "loop", followed by a "true" and a "false"
	// increment block idx in false since this loop is over
	string loop_label = env->new_label("loop.", false);
	string true_label = env->new_label("true.", false);
	string false_label = env->new_label("false.", true);

	// enter the condition
	vp.branch_uncond(loop_label);
	vp.begin_block(loop_label);
	operand cond = pred->code(env);

	//either exit or enter the body
	vp.branch_cond(cond, true_label, false_label);
	vp.begin_block(true_label);
	operand bd = body->code(env);
	vp.branch_uncond(loop_label);
	vp.begin_block(false_label);

	// return 0 as required by document
	return int_value(0);
}

operand block_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "block" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	operand blockEle;
	for (int i = body->first(); body->more(i); i = body->next(i))
	{
		blockEle = body->nth(i)->code(env);
	}
	return blockEle;
}

operand let_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "let" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand idValue = init->code(env);
	op_type idType = env->get_class()->get_type(type_decl->get_string());

	if (string(idValue.get_type().get_name()) != "" && string(idValue.get_type().get_name()) != string(idType.get_name()))
		idValue = conform(idValue, idType, env);
	operand idPtr = vp.alloca_mem(idType);
	//store the value into the allocated space
	bool emptyValue = idValue.get_type().get_id() == EMPTY;
	if (emptyValue)
	{
		// string defalutValue;
		operand store_op;
		if (idType.get_id() == INT1)
		{
			store_op = bool_value(false, false);
		}
		else if (idType.get_id() == INT32)
		{
			store_op = int_value(0);
		}
		else
		{
			store_op = null_value(idType);
		}
		operand conformed = conform(store_op, idPtr.get_type().get_deref_type(), env);
		vp.store(conformed, idPtr);
	}
	else
	{
		operand conformed = conform(idValue, idPtr.get_type().get_deref_type(), env);
		vp.store(conformed, idPtr);
	}
	//after initialize the variable, add it to local
	env->add_local(identifier, idPtr);
	// std::cerr << "add local 1503 " << endl;
	//excucate body
	operand bd = body->code(env);
	//exit local
	env->kill_local();
	return bd;
}

operand plus_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "plus" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	return vp.add(A, B);
}

operand sub_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "sub" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	return vp.sub(A, B);
}

operand mul_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "mul" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	return vp.mul(A, B);
}

operand divide_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "div" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	operand Zero = int_value(0);
	operand Eq = vp.icmp(EQ, B, Zero);
	string ok_label = env->new_ok_label();
	vp.branch_cond(Eq, "abort", ok_label);

	vp.begin_block(ok_label);
	return vp.div(A, B);
}

operand neg_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "neg" << endl;

	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	A = conform(A, op_type(INT32), env);
	operand B = int_value(0);
	return vp.sub(B, A);
}

operand lt_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "lt" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	return vp.icmp(LT, A, B);
}

operand eq_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "eq" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	if (A.get_typename() == "%String*" || B.get_typename() == "%String*")
	{
		A = conform(A, op_type(INT8_PTR), env);
		B = conform(B, op_type(INT8_PTR), env);
		vector<op_type> arg_types = {op_type(INT8_PTR), op_type(INT8_PTR)};
		vector<operand> arg_values = {A, B};
		operand compare_res = vp.call(arg_types, op_type(INT32), "strcmp", true, arg_values);
		return vp.icmp(EQ, compare_res, int_value(0));
	}
	// A = conform(A, op_type(INT32), env);
	// B = conform(B, op_type(INT32), env);
	return vp.icmp(EQ, A, B);
}

operand leq_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "leq" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	operand B = e2->code(env);
	A = conform(A, op_type(INT32), env);
	B = conform(B, op_type(INT32), env);
	return vp.icmp(LE, A, B);
}

operand comp_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "complement" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand A = e1->code(env);
	A = conform(A, op_type(INT1), env);
	return vp.xor_in(A, bool_value(true, true));
}

operand int_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "Integer Constant" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	return int_value(atoi(token->get_string()));
}

operand bool_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "Boolean Constant" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	return bool_value(val, false);
}

operand object_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "Object" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*(env->cur_stream));

	operand load_operand;

	operand *object_id = env->lookup(this->name);

	if (object_id)
	{
		load_operand = vp.load(object_id->get_type().get_deref_type(), *object_id);
	}
	else
	{
		string this_name(this->name->get_string());
		int formal_index = env->get_symbol_index(this_name);
		if (formal_index >= 0)
		{
			operand formal_operand = env->func_arguments[formal_index];
			load_operand = vp.load(formal_operand.get_type().get_deref_type(), formal_operand);
			//return load_operand;
		}
		else
		{
			//operand self_ptr = env->pointer_to_this_class;
			operand self_ptr;
			//  if(temp_ptr == nullptr)
			operand *cur_self_ptr = env->lookup(self);

			if (cur_self_ptr != 0)
			{
				//self_ptr = vp.load(cur_self_ptr.get_type().get_deref_type(), cur_self_ptr);
				self_ptr = *cur_self_ptr;
			}
			else
				self_ptr = env->func_arguments[0];
			//else
			//  self_ptr = *(temp_ptr);

			//operand self_ptr = *(env->lookup(self));
			operand operand_self = vp.load(self_ptr.get_type().get_deref_type(), self_ptr);

			int attr_index = env->get_class()->get_attribute_index(this->name->get_string());

			if (attr_index >= 0)
			{

				op_type attr_type = env->get_class()->attri_list[attr_index];
				string operand_self_name = operand_self.get_typename();
				if (operand_self_name[operand_self_name.length() - 1] == '*' && operand_self_name[operand_self_name.length() - 2] == '*')
					operand_self.set_type_id(OBJ_PPTR);
				else if (operand_self_name[operand_self_name.length() - 1] == '*')
					operand_self.set_type_id(OBJ_PTR);
				operand attr_ptr = vp.getelementptr(operand_self.get_type().get_deref_type(), operand_self, int_value(0), int_value(attr_index + 1), attr_type.get_ptr_type());

				load_operand = vp.load(attr_type, attr_ptr);
				//	return load_operand;
			}
			else
			{
				return operand();
			}
		}
	}

	return load_operand;
}

operand no_expr_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "No_expr" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	return operand();
}

//*****************************************************************
// The next few functions are for node types not supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "static dispatch" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL

	// cerr << "type name: " << type_name->get_string() << endl;
	// cerr << "name: " << name->get_string() << endl;
	ValuePrinter vp(*env->cur_stream);
	vector<op_type> arg_types;
	vector<operand> args;
	//string fun= string(type_name->get_string()) + "_" + string(name->get_string());
	int i = 0;
	operand output;
	while (actual->more(i))
	{
		output = actual->nth(i)->code(env);
		i++;
		args.push_back(output);
		//arg_types.push_back(output.get_type());
		//TODO:record during exxecution?
	}
	operand result = expr->code(env);

	operand testZero = vp.icmp(EQ, result, null_value(result.get_type()));
	string tempBlock = env->new_ok_label();
	vp.branch_cond(testZero, "abort", tempBlock);
	vp.begin_block(tempBlock);

	if (cgen_debug)
		std::cerr << result.get_type().get_name() << endl;

	//arg_types.insert(arg_types.begin(), op_type(string(type_name->get_string()) + "*") );
	//may have error
	//env->add_local(self, result);
	CgenNode *tempClass = env->type_to_class(type_name);

	//operand getElementOut = vp.getelementptr(result.get_type().get_deref_type(), result, int_value(0),
	//int_value(0), op_type(string(type_name->get_string())+ "_vtable**") );
	//std::cerr <<  "hello1"<< endl;
	//operand vtable_ptr = vp.load( op_type(string(type_name->get_string())+ "_vtable*"), getElementOut);
	//std::cerr <<  "hello2"<< endl;
	string fun;
	int indix = 0;
	for (int i = tempClass->vtable_names.size() - 1; i >= 0; i--)
	{
		if (string(name->get_string()) == tempClass->vtable_names[i])
		{
			fun = tempClass->vtable_names[i];
			indix = i;
			break;
		}
	}

	global_value beta_proto(op_type(string(type_name->get_string()) + "_vtable*"), string(type_name->get_string()) + "_vtable_prototype");
	beta_proto.set_type_id(OBJ_PTR);
	operand funcResult = vp.getelementptr(beta_proto.get_type().get_deref_type(), beta_proto,
										  int_value(0), int_value(indix), tempClass->vtable_types[indix].get_ptr_type());
	string tmp_name = funcResult.get_typename();
	if (tmp_name.length() >= 2 && tmp_name[1] == '3' && tmp_name[0] == '%')
	{
		tmp_name[0] = 'i';
		funcResult.set_type_name(tmp_name);
	}
	operand func = vp.load(tempClass->vtable_types[indix], funcResult);
	//std::cerr << tempClass->vtable_types[indix].get_name() << endl;
	//std::cerr <<  "hello4"<< endl;
	// vector<op_type> formal_target = tempClass->vtable_types[indix].get_arg_types();
	op_type static_type = op_type(type_name->get_string()).get_ptr_type();
	if (std::string(result.get_typename()) != static_type.get_name())
		result = conform(result, static_type, env);
	args.insert(args.begin(), result);
	for (int i = 0; i < args.size(); i++)
	{
		arg_types.push_back(args[i].get_type());
	}
	op_type call_res_type = remove_para_type(tempClass->vtable_types[indix]);
	operand realoutput = vp.call(arg_types, call_res_type, func.get_name().substr(1), false, args);
	//realoutput = conform(realoutput, op_type(string(result.get_type().get_name()) + "*"),env);
	if (cgen_debug)
		std::cerr << result.get_type().get_name() << endl;
	// if (tempClass->return_self_type[indix])
	// {
	// 	realoutput = conform(realoutput, result.get_type(), env);
	// 	//realoutput = vp.bitcast(realoutput, op_type(string(tempClass->get_type_name()) + "*"));
	// }

	//operand realoutput = vp.call(arg_types, result_type, fun, true, args);

	return realoutput;
#endif
	return operand();
}

operand string_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "string_const" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	string temp = string(this->token->get_string());
	int result = -1;
	for (int i = 0; i < env->get_class()->get_classtable()->string_name.size(); i++)
	{
		if (env->get_class()->get_classtable()->string_name[i] == temp)
		{
			result = i;
		}
	}

	if (result >= 0)
	{
		return env->get_class()->get_classtable()->string_global_value[result];
	}
	else
	{
		return operand();
	}
#endif
	return operand();
}

operand dispatch_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "dispatch" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL

	ValuePrinter vp(*(env->cur_stream));
	op_type param_op_type;
	vector<operand> args;
	vector<op_type> arg_types;
	int i = actual->first();
	while (actual->more(i))
	{
		operand actual_op = actual->nth(i)->code(env);
		args.push_back(actual_op);
		i = actual->next(i);
	}

	operand expr_op = expr->code(env);
	if (expr_op.get_typename() == "i32" || expr_op.get_typename() == "i1")
	{
		op_type target;
		if (expr_op.get_typename() == "i32")
			target = op_type("Int*");
		else
			target = op_type("Bool*");
		expr_op = conform(expr_op, target, env);
	}
	else
	{
		op_type bool_type(INT1);
		null_value null_op(expr_op.get_type());
		operand icmp_result = vp.icmp(EQ,
									  expr_op,
									  null_op);

		string ok_label = env->new_ok_label();
		vp.branch_cond(*(env->cur_stream), icmp_result, "abort", ok_label);

		//ok label
		vp.begin_block(ok_label);
	}
	args.insert(args.begin(), expr_op);
	int_value zero_val(0);
	string vtable_ptr_string(env->type_to_class(expr->get_type())->get_type_name() + "_vtable**");
	op_type vtable_ptr_type(vtable_ptr_string);
	vtable_ptr_type.set_id(OBJ_PPTR);
	expr_op.set_type_id(OBJ_PTR);

	// %tmp.11 = getelementptr %Main* %tmp.9, i32 0, i32 0
	operand get_main_vtable = vp.getelementptr(
		expr_op.get_type().get_deref_type(),
		expr_op,
		zero_val,
		zero_val,
		vtable_ptr_type);

	//	%tmp.12 = load %Main_vtable** %tmp.11
	operand vtable_load_result = vp.load(get_main_vtable.get_type().get_deref_type(), get_main_vtable);

	//	%tmp.13 = getelementptr %Main_vtable* %tmp.12, i32 0, i32 8
	operand get_offset;
	CgenNode *vtable_Class = env->type_to_class(expr->get_type());
	// std::cerr << env->type_to_class(expr->get_type())->get_type_name() << endl;
	for (int i = 0; i < vtable_Class->vtable_names.size(); i++)
	{
		// std::cerr << "ZZZZZZ: " << vtable_Class->vtable_names.at(i) << "  " << name->get_string() << endl;
		if (std::string(vtable_Class->vtable_names[i]) == std::string(name->get_string()))
		{
			// std::cerr << env->get_class()->vtable_names.at(i) << " matched in get_offset " << name->get_string() << " offset: " << i << endl;
			int_value offset_val(i);
			get_offset = vp.getelementptr(
				vtable_load_result.get_type().get_deref_type(),
				vtable_load_result,
				zero_val,
				offset_val,
				vtable_ptr_type);
			arg_types = vtable_Class->vtable_func_types[i].get_arg_types();
			break;
		}
	}
	//	%tmp.14 = load %Main* (%Main*,i32) ** %tmp.13
	operand load_func_op;
	op_type func_type_ptr;
	for (int i = 0; i < vtable_Class->vtable_names.size(); i++)
	{
		// std::cerr << "i = " << i << "\n"
		// 		  << vtable_Class->vtable_names.at(i) << endl;
		// std::cerr << name->get_string() << endl;
		if (std::string(vtable_Class->vtable_names.at(i)) == std::string(name->get_string()))
		{
			// std::cerr << vtable_Class->vtable_names.at(i) << " matched " << name->get_string() << endl;
			// std::cerr << "CCCCCCCCCCCCC " << vtable_Class->vtable_types.at(i).get_name() << endl;
			if (vtable_Class->vtable_types.at(i).get_name()[0] == '%')
			{
				func_type_ptr = op_type(vtable_Class->vtable_types.at(i).get_name().substr(1), 1);
				func_type_ptr.set_id(OBJ_PTR);
			}
			else
			{
				func_type_ptr = op_type(vtable_Class->vtable_types.at(i).get_name(), 1);
				func_type_ptr.set_id(OBJ_PTR);
				// func_type_ptr.set_name(vtable_Class->vtable_types.at(i).get_name());
				// std::cerr << func_type_ptr.get_name() << endl;
			}
			// std::cerr << func_type_ptr.get_ptr_type().get_name() << endl;
			load_func_op = operand(func_type_ptr, get_offset.get_name().substr(1)); //.get_ptr_type()
			// load_func_op.set_type(func_type_ptr);
			// std::cerr << load_func_op->get_type().get_name() << endl;
			break;
		}
	}
	load_func_op.set_type_id(OBJ_PPTR);
	string tmp_name = load_func_op.get_typename();
	if (tmp_name.length() >= 2 && tmp_name[1] == 'i' && tmp_name[0] == '%')
	{
		load_func_op.set_type_name(tmp_name.substr(1));
	}
	operand load_func_result = vp.load(load_func_op.get_type().get_deref_type(), load_func_op);
	//	%tmp.15 = call %Main*(%Main*, i32 )* %tmp.14( %Main* %tmp.9, i32 %tmp.8 )

	for (int m = 0; m < args.size(); m++)
	{
		operand arg = args[m];
		// cerr << arg.get_typename() << endl;
		// op_type arg_type;
		// string arg_type_str = arg.get_typename();
		// if (arg_type_str[0] == '%')
		// 	arg_type = op_type(arg_type_str.substr(1));
		// else
		// 	arg_type = arg.get_type();
		arg = conform(arg, arg_types[m], env);
		// arg_types.push_back(arg_type);
		args[m] = arg;
	}
	string call_type_str;
	for (char c : load_func_result.get_typename())
	{
		if (c == ' ')
			break;
		call_type_str += c;
	}
	op_type class_type(call_type_str);
	class_type.set_name(call_type_str);
	operand call_result = vp.call(
		arg_types,
		class_type,
		//load_func_result.get_type(),
		load_func_result.get_name().substr(1),
		false,
		args);
	return call_result;
#endif
	return operand();
}

operand typcase_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "typecase::code()" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp(*env->cur_stream);
	CgenClassTable *ct = env->get_class()->get_classtable();

	string header_label = env->new_label("case.hdr.", false);
	string exit_label = env->new_label("case.exit.", false);

	// Generate code for expression to select on, and get its static type
	operand code_val = expr->code(env);
	operand expr_val = code_val;
	string code_val_t = code_val.get_typename();
	op_type join_type = env->type_to_class(type)->get_type_name();
	CgenNode *cls = env->type_to_class(expr->get_type());

	// Check for case on void, which gives a runtime error
	if (code_val.get_type().get_id() != INT32_PTR && code_val.get_type().get_id() != INT1_PTR)
	{
		op_type bool_type(INT1), empty_type;
		null_value null_op(code_val.get_type());
		operand icmp_result(bool_type, env->new_name());
		vp.icmp(*env->cur_stream, EQ, code_val, null_op, icmp_result);
		string ok_label = env->new_ok_label();
		vp.branch_cond(icmp_result, "abort", ok_label);
		vp.begin_block(ok_label);
	}

	operand tag = get_class_tag(expr_val, cls, env);
	vp.branch_uncond(header_label);
	string prev_label = header_label;
	vp.begin_block(header_label);

	// Get result type of case expression
	branch_class *b = (branch_class *)cases->nth(cases->first());
	string case_result_type = b->get_expr()->get_type()->get_string();
	if (case_result_type == "SELF_TYPE")
		case_result_type = env->get_class()->get_type_name();

	// Allocate space for result of case expression
	op_type alloca_type(case_result_type, 1);
	operand alloca_final(alloca_type, env->new_name());
	env->branch_operand = alloca_final;
	vp.alloca_mem(*env->cur_stream, alloca_type, alloca_final);

	std::vector<operand> values;
	env->next_label = exit_label;

	// Generate code for the branches
	for (int i = ct->get_num_classes() - 1; i >= 0; --i)
	{
		for (int j = cases->first(); cases->more(j); j = cases->next(j))
		{
			if (i == ct->lookup(cases->nth(j)->get_type_decl())->get_tag())
			{
				string prefix = string("case.") + itos(i) + ".";
				string case_label = env->new_label(prefix, false);
				vp.branch_uncond(case_label);
				vp.begin_block(case_label);
				operand val = cases->nth(j)->code(expr_val, tag,
												  join_type, env);
				values.push_back(val);
			}
		}
	}

	// Abort if there was not a branch covering the actual type
	vp.branch_uncond("abort");

	// Done with case expression: get final result
	env->new_label("", true);
	vp.begin_block(exit_label);
	operand final_result(alloca_type, env->new_name());
	alloca_final.set_type(alloca_final.get_type().get_ptr_type());
	vp.load(*env->cur_stream, alloca_final.get_type().get_deref_type(), alloca_final,
			final_result);
	alloca_final.set_type(alloca_final.get_type().get_deref_type());

	if (cgen_debug)
		cerr << "Done typcase::code()" << endl;
	return final_result;
#endif
}

operand new__class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "newClass" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	//%main.obj = call %Main*() @Main_new( )
	vector<op_type> arg_types;
	vector<operand> args;
	ValuePrinter vp(*env->cur_stream);

	string func = string(type_name->get_string()) + "_new";
	op_type res_type(std::string(type_name->get_string()) + "*");
	operand call_res = vp.call(arg_types, res_type, func, true, args);
	return call_res;
#endif
	return operand();
}

operand isvoid_class::code(CgenEnvironment *env)
{
	if (cgen_debug)
		std::cerr << "isvoid" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
	// MORE MEANINGFUL
	ValuePrinter vp(*env->cur_stream);
	operand result = e1->code(env);
	operand output = vp.icmp(EQ, result, null_value(result.get_type()));
	return output;
#endif
	return operand();
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE
	if (cgen_debug)
		std::cerr << "method layout\n";

	if (string(name->get_string()) == "main")
	{
		cls->get_classtable()->main_return_type = cls->get_type(string(return_type->get_string()));
	}
	vector<op_type> formal_arg;
	formal_arg.push_back(cls->get_type(cls->get_type_name()));
	operand formal_op(cls->get_type(cls->get_type_name()), cls->get_type_name());
	cls->formal_ops.push_back(formal_op);
	for (auto i = formals->first(); formals->more(i); i = formals->next(i))
	{
		string type_name = formals->nth(i)->get_type_decl()->get_string();
		string formal_name = formals->nth(i)->get_name()->get_string();
		op_type temp(cls->get_type(type_name));
		operand formal_temp_op(temp, formal_name);
		formal_arg.push_back(temp);
		cls->formal_ops.push_back(formal_temp_op);
	}

	//add the id and type of the feature to attr_types
	// cls->add_attr_type(return_type, name);

	//If it is not a basic class add its features to the Main__main vtable
	std::string new_type_name = cls->get_type_name();
	// std::cerr << "------------------------------" << new_type_name << endl;
	// std::cerr << "type name: " << new_type_name << endl;
	// std::cerr << "name name: " << name->get_string() << endl;
	// std::cerr << "return_type name: " << return_type->get_string() << endl;
	// std::cerr << "------------------------------" << new_type_name << endl;
	if (new_type_name != "Object" && new_type_name != "IO" && new_type_name != "Bool" && new_type_name != "String" && new_type_name != "Int")
	{
		//add the new feature to vtable
		op_type vt_return(cls->get_type(return_type->get_string()));
		op_func_type *vt_func_op = new op_func_type(vt_return, formal_arg);
		vt_func_op->set_self_ret(false);
		if (std::string(return_type->get_string()).compare("SELF_TYPE") == 0)
		{
			vt_func_op->set_self_ret(true);
		}
		vt_func_op->set_local(true);
		cls->extra_v_types.push_back(*vt_func_op);
		cls->extra_v_return_types.push_back(return_type->get_string());
		cls->extra_v_func_types.push_back(*vt_func_op);
		cls->extra_v_ori_func_types.push_back(*vt_func_op);

		//add the new feature to vtable prototype
		std::string v_feature_name = cls->get_type_name() + "_" + name->get_string();
		op_type v_ft_op(v_feature_name);
		const_value vtp_ft_const(v_ft_op, "@" + v_feature_name, false);
		cls->extra_v_values.push_back(vtp_ft_const);
	}
#endif
}

// If the source tag is >= the branch tag and <= (max child of the branch class) tag,
// then the branch is a superclass of the source
operand branch_class::code(operand expr_val, operand tag,
						   op_type join_type, CgenEnvironment *env)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	operand empty;
	ValuePrinter vp(*env->cur_stream);
	if (cgen_debug)
		cerr << "In branch_class::code()" << endl;

	CgenNode *cls = env->get_class()->get_classtable()->lookup(type_decl);
	int my_tag = cls->get_tag();
	int max_child = cls->get_max_child();

	// Generate unique labels for branching into >= branch tag and <= max child
	string sg_label =
		env->new_label(string("src_gte_br") + "." + itos(my_tag) + ".", false);
	string sl_label =
		env->new_label(string("src_lte_mc") + "." + itos(my_tag) + ".", false);
	string exit_label =
		env->new_label(string("br_exit") + "." + itos(my_tag) + ".", false);

	int_value my_tag_val(my_tag);
	op_type old_tag_t(tag.get_type()), i32_t(INT32);
	tag.set_type(i32_t);

	// Compare the source tag to the class tag
	operand icmp_result = vp.icmp(LT, tag, my_tag_val);
	vp.branch_cond(icmp_result, exit_label, sg_label);
	vp.begin_block(sg_label);
	int_value max_child_val(max_child);

	// Compare the source tag to max child
	operand icmp2_result = vp.icmp(GT, tag, max_child_val);
	vp.branch_cond(icmp2_result, exit_label, sl_label);
	vp.begin_block(sl_label);
	tag.set_type(old_tag_t);

	// Handle casts of *arbitrary* types to Int or Bool.  We need to:
	// (a) cast expr_val to boxed type (struct Int* or struct Bool*)
	// (b) unwrap value field from the boxed type
	// At run-time, if source object is not Int or Bool, this will never
	// be invoked (assuming no bugs in the type checker).
	if (cls->get_type_name() == "Int" || cls->get_type_name() == "Bool")
	{
		op_type lbl_t(cls->get_type_name(), 1);
		expr_val = conform(expr_val, lbl_t, env);
	}

	// If the case expression is of the right type, make a new local
	// variable for the type-casted version of it, which can be used
	// within the expression to evaluate on this branch.
	op_type alloc_type(cls->get_type_name(), 1);
	operand alloc_op = vp.alloca_mem(alloc_type);
	operand conf_result = conform(expr_val, alloc_type, env);
	vp.store(conf_result, alloc_op);
	env->add_local(name, alloc_op);
	// std::cerr << "add local 2218 " << endl;

	// Generate code for the expression to evaluate on this branch
	operand val = conform(expr->code(env), join_type.get_ptr_type(), env);
	operand conformed = conform(val, env->branch_operand.get_type(), env);
	env->branch_operand.set_type(env->branch_operand.get_type()
									 .get_ptr_type());
	// Store result of the expression evaluated
	vp.store(conformed, env->branch_operand);
	env->branch_operand.set_type(env->branch_operand.get_type()
									 .get_deref_type());
	env->kill_local();
	// Branch to case statement exit label
	vp.branch_uncond(env->next_label);
	vp.begin_block(exit_label);
	if (cgen_debug)
		cerr << "Done branch_class::code()" << endl;
	return conformed;
#endif
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE
	// if (cgen_debug)
	// 	std::cerr << "attribute layout\n";
	CgenEnvironment *env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	op_type tmp = cls->get_type(type_decl->get_string());
	cls->attri_list.push_back(tmp);
	cls->attri_name_list.push_back(name->get_string());
	// std::cerr << name->get_string() << " in " << cls->get_name() << endl;

#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE
	if (env->method)
	{
		op_type type_decl_op_type(env->get_class()->get_type(type_decl->get_string()));
		operand *null_operand = new operand(type_decl_op_type, "null op");
		// env->symbols.push_back(name);
		// env->add_local(name, *null_operand);
		return;
	}
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug)
		std::cerr << "attribute\n";

	//evaluate the expression
	int index = env->get_class()->get_attribute_index(this->name->get_string());
	op_type attr_type = env->get_class()->attri_list[index];
	op_type attr_op_type(std::string(env->get_class()->get_type_name()) + "*");
	operand attr_operand(attr_op_type, env->real_type.get_name().substr(1, env->real_type.get_name().length() - 1));
	operand attr_ret_op = vp.getelementptr(env->get_class()->get_type_name(), attr_operand, int_value(0), int_value(index + 1), attr_type.get_ptr_type());
	operand attr_expr_operand = init->code(env);
	if (attr_expr_operand.get_name() == "")
	{
		if (attr_type.get_id() == INT1)
		{
			attr_expr_operand = bool_value(false, false);
		}
		else if (attr_type.get_id() == INT32)
		{
			attr_expr_operand = int_value(0);
		}
		else
		{
			attr_expr_operand = null_value(attr_type);
		}
	}
	attr_expr_operand = conform(attr_expr_operand, attr_type, env);
	// op_type expr_op_type(attr_expr_operand.get_type().get_ptr_type());
	vp.store(*(env->cur_stream), attr_expr_operand, attr_ret_op);
#endif
}

op_type CgenNode::get_type(string type_name)
{
	if (type_name == "Int" || type_name == "int")
	{
		return op_type(INT32);
	}
	if (type_name == "Bool" || type_name == "bool")
	{
		return op_type(INT1);
	}
	if (type_name == "sbyte*")
	{
		return op_type(INT8_PTR);
	}
	if (type_name == "SELF_TYPE")
	{
		return op_type(this->get_type_name() + "*");
	}
	return op_type(type_name + std::string("*"));
}

void CgenNode::setup_buildin_vtable()
{
	op_type i32_type(INT32), i1_type(INT1), i8_ptr_type(INT8_PTR);
	op_type class_type(get_type_name() + std::string("* () "), /*int ptr_level*/ 1);

	//invariant vtable struct
	// i32,
	// i32,
	// i8*,
	// %Object* () *
	vtable_types.push_back(i32_type);
	vtable_types.push_back(i32_type);
	vtable_types.push_back(i8_ptr_type);
	vtable_types.push_back(class_type);

	//i32 0,
	const_value id_const(i32_type, std::to_string(this->tag), false);
	vtable_values.push_back(id_const);
	vtable_names.push_back("tag");
	vtable_func_types.push_back(op_func_type(op_type(), {}));

	//i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	string ptrtoint = "ptrtoint (%" + get_type_name() + "* getelementptr (%" + get_type_name() + ", %" + get_type_name() + "* null, i32 1) to i32)";
	const_value ptrtoint_const(i32_type, ptrtoint, false);
	vtable_values.push_back(ptrtoint_const);
	vtable_names.push_back("address");
	vtable_func_types.push_back(op_func_type(op_type(), {}));

	//i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	int name_len = ((int)(this->get_type_name().length()) + 1);
	std::string len_const = "[" + std::to_string(name_len) + " x i8]";
	std::string name_value = "getelementptr (" + len_const + ", " + len_const + "* @str." + get_type_name() + ", i32 0, i32 0)";
	const_value name_const(i8_ptr_type, name_value, false);
	vtable_values.push_back(name_const);
	vtable_names.push_back("class_name");
	vtable_func_types.push_back(op_func_type(op_type(), {}));

	//%Object* () * @Object_new,
	string new_Obj = "@" + get_type_name() + "_new";
	const_value new_const(new_Obj, new_Obj, false);
	vtable_values.push_back(new_const);
	vtable_names.push_back("class_new");
	vtable_func_types.push_back(op_func_type(op_type(), {}));

	//Object
	if (get_type_name() == "Object")
	{
		//%Object* (%Object*) * @Object_abort,
		vector<op_type> obj_abort_op;
		op_type obj_abort_res("Object*");
		obj_abort_op.push_back(obj_abort_res);
		op_func_type obj_abort_op_func(obj_abort_res, obj_abort_op);
		// this->vtable_funcs.push_back(obj_abort_op_func);
		vtable_types.push_back(obj_abort_op_func);

		string abort_string = "@" + get_type_name() + "_abort";
		const_value abort_const(class_type, abort_string, false);
		vtable_values.push_back(abort_const);
		vtable_names.push_back("abort");
		vtable_func_types.push_back(obj_abort_op_func);

		//%String* (%Object*) * @Object_type_name
		vector<op_type> obj_type_name_op;
		op_type obj_type_name_obj("Object*");
		op_type obj_type_name_res("String*");
		obj_type_name_op.push_back(obj_type_name_obj);
		op_func_type obj_type_name_op_func(obj_type_name_res, obj_type_name_op);
		// this->vtable_funcs.push_back(obj_type_name_op_func);
		vtable_types.push_back(obj_type_name_op_func);

		string type_name_string = "@" + get_type_name() + "_type_name";
		const_value type_name_const(class_type, type_name_string, false);
		vtable_values.push_back(type_name_const);
		vtable_names.push_back("type_name");
		vtable_func_types.push_back(obj_type_name_op_func);

		//%Object* (%Object*) * @Object_copy
		vector<op_type> obj_copy_op;
		op_type obj_copy_res("Object*");
		obj_copy_op.push_back(obj_copy_res);
		op_func_type obj_copy_op_func(obj_copy_res, obj_copy_op);
		// this->vtable_funcs.push_back(obj_copy_op_func);
		this->vtable_types.push_back(obj_copy_op_func);

		string copy_string = "@" + get_type_name() + "_copy";
		const_value copy_const(class_type, copy_string, false);
		vtable_values.push_back(copy_const);
		vtable_names.push_back("copy");
		vtable_func_types.push_back(obj_copy_op_func);
	}
	else
	{
		string class_name = (name->get_string() == "SELF_TYPE") ? this->get_type_name() : name->get_string();
		//%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
		vector<op_type> obj_abort_op;
		op_type obj_abort_func_res("Object*");
		op_type obj_abort_func_class(class_name + "*");
		obj_abort_op.push_back(obj_abort_func_class);
		op_func_type obj_abort_op_func(obj_abort_func_res, obj_abort_op);
		vtable_types.push_back(obj_abort_op_func);

		string abort_string = "bitcast (%Object* (%Object*) * @Object_abort to %Object* (%" + class_name + "*) *)";
		const_value abort_const(class_type, abort_string, false);
		vtable_values.push_back(abort_const);
		vtable_names.push_back("abort");
		vtable_func_types.push_back(obj_abort_op_func);

		//%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
		vector<op_type> obj_type_name_op;
		op_type obj_type_name_func_res("String*");
		op_type obj_type_name_func_class(class_name + "*");
		obj_type_name_op.push_back(obj_type_name_func_class);
		op_func_type obj_type_name_op_func(obj_type_name_func_res, obj_type_name_op);
		vtable_types.push_back(obj_type_name_op_func);

		string type_name_string = "bitcast (%String* (%Object*) * @Object_type_name to %String* (%" + class_name + "*) *)";
		const_value type_name_const(class_type, type_name_string, false);
		vtable_values.push_back(type_name_const);
		vtable_names.push_back("type_name");
		vtable_func_types.push_back(obj_type_name_op_func);

		//%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
		vector<op_type> obj_copy_op;
		op_type obj_copy_func_res(class_name + "*");
		obj_copy_op.push_back(obj_copy_func_res);
		op_func_type obj_copy_op_func(obj_copy_func_res, obj_copy_op);
		vtable_types.push_back(obj_copy_op_func);

		string copy_string = "bitcast (%Object* (%Object*) * @Object_copy to %" + class_name + "* (%" + class_name + "*) *)";
		const_value copy_const(class_type, copy_string, false);
		vtable_values.push_back(copy_const);
		vtable_names.push_back("copy");
		vtable_func_types.push_back(obj_copy_op_func);
	}

	//String
	if (get_type_name() == "String")
	{
		//i32 (%String*) * @String_length,
		vector<op_type> str_length_op;
		op_type str_length_str("String*");
		str_length_op.push_back(str_length_str);
		op_func_type str_length_op_func(op_type(INT32), str_length_op);
		vtable_types.push_back(str_length_op_func);

		string length_string = "@" + get_type_name() + "_length";
		const_value length_const(class_type, length_string, false);
		vtable_values.push_back(length_const);
		vtable_names.push_back("length");
		vtable_func_types.push_back(str_length_op_func);

		//%String* (%String*,%String*) * @String_concat,
		vector<op_type> str_concat_op;
		op_type str_concat_res("String*");
		str_concat_op.push_back(str_concat_res);
		str_concat_op.push_back(str_concat_res);
		op_func_type str_concat_op_func(str_concat_res, str_concat_op);
		this->vtable_types.push_back(str_concat_op_func);

		string concat_string = "@" + get_type_name() + "_concat";
		const_value concat_const(class_type, concat_string, false);
		vtable_values.push_back(concat_const);
		vtable_names.push_back("concat");
		vtable_func_types.push_back(str_concat_op_func);

		//%String* (%String*,i32,i32) * @String_substr
		vector<op_type> str_substr_op;
		op_type str_substr_res("String*");
		str_substr_op.push_back(str_substr_res);
		str_substr_op.push_back(op_type(INT32));
		str_substr_op.push_back(op_type(INT32));
		op_func_type str_substr_op_func(str_substr_res, str_substr_op);
		vtable_types.push_back(str_substr_op_func);

		string substr_string = "@" + get_type_name() + "_substr";
		const_value substr_const(class_type, substr_string, false);
		vtable_values.push_back(substr_const);
		vtable_names.push_back("substr");
		vtable_func_types.push_back(str_substr_op_func);
	}

	//IO
	if (get_type_name() == "IO")
	{
		//TYPES
		//%IO* (%IO*,%String*) * @IO_out_string,
		vector<op_type> io_out_string_op;
		op_type io_out_string_func_res("IO*");
		op_type io_out_string_func_str("String*");
		io_out_string_op.push_back(io_out_string_func_res);
		io_out_string_op.push_back(io_out_string_func_str);
		op_func_type io_out_string_op_func(io_out_string_func_res, io_out_string_op);
		vtable_types.push_back(io_out_string_op_func);

		string out_string_string = "@" + get_type_name() + "_out_string";
		const_value out_string_const(class_type, out_string_string, false);
		this->vtable_values.push_back(out_string_const);
		vtable_names.push_back("out_string");
		vtable_func_types.push_back(io_out_string_op_func);

		//%IO* (%IO*,i32) * @IO_out_int,
		vector<op_type> io_out_int_op;
		op_type io_out_int_func_res("IO*");
		io_out_int_op.push_back(io_out_int_func_res);
		io_out_int_op.push_back(op_type(INT32));
		op_func_type io_out_int_op_func(io_out_int_func_res, io_out_int_op);
		this->vtable_types.push_back(io_out_int_op_func);

		string out_int_string = "@" + get_type_name() + "_out_int";
		const_value out_int_const(class_type, out_int_string, false);
		vtable_values.push_back(out_int_const);
		vtable_names.push_back("out_int");
		vtable_func_types.push_back(io_out_int_op_func);

		//%String* (%IO*) * @IO_in_string,
		vector<op_type> io_in_string_op;
		op_type io_in_string_func_io("IO*");
		op_type io_in_string_func_res("String*");
		io_in_string_op.push_back(io_in_string_func_io);
		op_func_type io_in_string_op_func(io_in_string_func_res, io_in_string_op);
		vtable_types.push_back(io_in_string_op_func);

		string in_string_string = "@" + get_type_name() + "_in_string";
		const_value in_string_const(class_type, in_string_string, false);
		vtable_values.push_back(in_string_const);
		vtable_names.push_back("in_string");
		vtable_func_types.push_back(io_in_string_op_func);

		//i32 (%IO*) * @IO_in_int
		vector<op_type> io_in_int_op;
		op_type io_in_int_func_io("IO*");
		io_in_int_op.push_back(io_in_int_func_io);
		op_func_type io_in_int_op_func(op_type(INT32), io_in_int_op);
		vtable_types.push_back(io_in_int_op_func);

		string in_int_string = "@" + get_type_name() + "_in_int";
		const_value in_int_const(class_type, in_int_string, false);
		vtable_values.push_back(in_int_const);
		vtable_names.push_back("in_int");
		vtable_func_types.push_back(io_in_int_op_func);
	}
}

void CgenNode::setup_inherited_class()
{
	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));
	auto parent = this->get_parentnd();
	op_type current_type(name->get_string() + std::string("* () "), 1);
	std::string parent_class_type = (parent->name->get_string() == "SELF_TYPE") ? parent->get_type_name() : parent->name->get_string();
	std::string class_type = (name->get_string() == "SELF_TYPE") ? this->get_type_name() : name->get_string();
	std::cerr << "setup_inherited_class " << class_type << endl;
	//add inherited functions to vtable and check to make sure you don't override them
	if (!(parent->basic()))
	{
		for (size_t i = 0; i < parent->extra_v_func_types.size(); i++)
		{
			op_type res_type = parent->extra_v_func_types[i].get_result_type();
			string parent_class = op_type(std::string(parent->name->get_string()) + "*").get_name();
			std::cerr << parent->extra_v_func_types[i].is_self_ret() << endl;
			if (parent->extra_v_func_types[i].is_self_ret())
			{
				// std::cerr << class_type << endl;
				res_type = op_type(get_type(class_type));
			}
			// op_type vt_ft_func = parent->extra_v_func_types[i].get_result_type();
			vector<op_type> argument = vector<op_type>(parent->extra_v_func_types[i].get_arg_types());
			vector<op_type> ori_argument = vector<op_type>(parent->extra_v_ori_func_types[i].get_arg_types());
			argument[0] = get_type(class_type);
			// std::cerr << "aaaaaa" << argument[0].get_name() << endl;
			op_func_type *vt_ft_op_func = new op_func_type(res_type, argument);
			vt_ft_op_func->set_self_ret(false);
			if (parent->extra_v_func_types[i].is_self_ret())
			{
				vt_ft_op_func->set_self_ret(true);
				// cerr << "aaaaaaaaaaaaaaaaaaaaaaa" << endl;
			}
			extra_v_types.insert(extra_v_types.begin() + i, *vt_ft_op_func);
			extra_v_func_types.insert(extra_v_func_types.begin() + i, *vt_ft_op_func);
			extra_v_func_types[i].set_local(false);
			extra_v_ori_func_types.insert(extra_v_ori_func_types.begin() + i, parent->extra_v_ori_func_types[i]);
			extra_v_values.insert(extra_v_values.begin() + i, parent->extra_v_values[i]);
		}
	}
	else
	{
		//Add the basic classes inherited functions
		if (parent->get_type_name() == "IO")
		{
			op_type self_type(std::string(name->get_string()) + "*"), str_type("String*"), INT32_type(INT32), io_type("IO*");

			//%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
			vector<op_type> io_out_string_op;
			io_out_string_op.push_back(io_type);
			io_out_string_op.push_back(str_type);
			op_func_type io_out_string_op_func(io_type, io_out_string_op);
			inherit_io_types.push_back(io_out_string_op_func);
			inherit_io_ori_func_types.push_back(io_out_string_op_func);

			string out_string_string = "@IO_out_string";
			const_value out_string_const(current_type, out_string_string, false);
			inherit_io_values.push_back(out_string_const);

			vector<op_type> io_self_out_string_op;
			io_self_out_string_op.push_back(self_type);
			io_self_out_string_op.push_back(str_type);
			op_func_type io_self_out_string_op_func(self_type, io_self_out_string_op);
			io_self_out_string_op_func.set_self_ret(true);
			inherit_io_self_types.push_back(io_self_out_string_op_func);
			inherit_io_func_types.push_back(io_self_out_string_op_func);

			//%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
			vector<op_type> io_out_int_op;
			io_out_int_op.push_back(io_type);
			io_out_int_op.push_back(INT32_type);
			op_func_type io_out_int_op_func_ptr(io_type, io_out_int_op);
			inherit_io_types.push_back(io_out_int_op_func_ptr);
			inherit_io_ori_func_types.push_back(io_out_int_op_func_ptr);

			string out_int_string = "@IO_out_int";
			const_value out_int_const(current_type, out_int_string, false);
			inherit_io_values.push_back(out_int_const);

			vector<op_type> io_self_out_int_op;
			io_self_out_int_op.push_back(self_type);
			io_self_out_int_op.push_back(INT32_type);
			op_func_type io_self_out_int_op_func(self_type, io_self_out_int_op);
			io_self_out_int_op_func.set_self_ret(true);
			inherit_io_self_types.push_back(io_self_out_int_op_func);
			inherit_io_func_types.push_back(io_self_out_int_op_func);

			//%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
			vector<op_type> io_in_string_op;
			io_in_string_op.push_back(io_type);
			op_func_type io_in_string_op_func(str_type, io_in_string_op);
			inherit_io_types.push_back(io_in_string_op_func);
			inherit_io_ori_func_types.push_back(io_in_string_op_func);

			string in_string_string = "@IO_in_string";
			const_value in_string_const(current_type, in_string_string, false);
			inherit_io_values.push_back(in_string_const);

			vector<op_type> io_self_in_string_op;
			io_self_in_string_op.push_back(self_type);
			op_func_type io_self_in_string_op_func(str_type, io_self_in_string_op);
			inherit_io_self_types.push_back(io_self_in_string_op_func);
			inherit_io_func_types.push_back(io_self_in_string_op_func);

			//i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
			vector<op_type> io_in_int_op;
			io_in_int_op.push_back(io_type);
			op_func_type io_in_int_op_func(INT32_type, io_in_int_op);
			inherit_io_types.push_back(io_in_int_op_func);
			inherit_io_ori_func_types.push_back(io_in_int_op_func);

			string in_int_string = "@IO_in_int";
			const_value in_int_const(current_type, in_int_string, false);
			inherit_io_values.push_back(in_int_const);

			vector<op_type> io_self_in_int_op;
			io_self_in_int_op.push_back(self_type);
			op_func_type io_self_in_int_op_func(INT32_type, io_self_in_int_op);
			inherit_io_self_types.push_back(io_self_in_int_op_func);
			inherit_io_func_types.push_back(io_self_in_int_op_func);

			for (size_t i = 0; i < inherit_io_values.size(); i++)
			{
				//bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
				string bitcast_val = "bitcast (" + inherit_io_types[i].get_name() + " " + inherit_io_values[i].get_name() +
									 " to " + inherit_io_self_types[i].get_name() + ")";
				const_value old_type_val(inherit_io_types[i], bitcast_val, false);
				// vtable_types.push_back(inherit_io_self_types[i]);
				// vtable_values.push_back(old_type_val);
				// vtable_names.push_back(split_str(inherit_io_values[i].get_name(), '_'));
				extra_v_types.insert(extra_v_types.begin() + i, inherit_io_self_types[i]);
				extra_v_values.insert(extra_v_values.begin() + i, inherit_io_values[i]);
				extra_v_return_types.insert(extra_v_return_types.begin() + i, inherit_io_types[i].get_name());
				extra_v_func_types.insert(extra_v_func_types.begin() + i, inherit_io_func_types[i]);
				extra_v_ori_func_types.insert(extra_v_ori_func_types.begin() + i, inherit_io_ori_func_types[i]);
				extra_v_func_types[i].set_local(false);
			}
		}
	}
}

int CgenEnvironment::get_symbol_index(string name)
{
	for (int i = 0; i < this->symbols.size(); i++)
	{
		if (this->symbols[i]->get_string() == name)
		{
			return i;
		}
	}
	return -1;
}

int CgenNode::get_attribute_index(string attri_name)
{
	for (int i = 0; i < this->attri_name_list.size(); i++)
	{
		if (this->attri_name_list[i] == attri_name)
		{
			return i;
		}
	}
	return -1;
}
