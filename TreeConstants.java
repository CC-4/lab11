/** For convenience, this clas defines a large number of symbols.  These
 * symbols include the primitive type and method names, as well as fixed
 * names used by the runtime system.  */
class TreeConstants {
    
    public static final AbstractSymbol Bool 
	= AbstractTable.idtable.addString("boolean");
	
	public static final AbstractSymbol Main 
	= AbstractTable.idtable.addString("main");

	public static final AbstractSymbol Float 
	= AbstractTable.idtable.addString("float");
    
    public static final AbstractSymbol Int 
	= AbstractTable.idtable.addString("int");
}
