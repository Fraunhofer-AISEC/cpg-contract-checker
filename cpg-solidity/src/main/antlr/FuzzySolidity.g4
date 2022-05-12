// Copyright 2020 Gonçalo Sá <goncalo.sa@consensys.net>
// Copyright 2016-2019 Federico Bond <federicobond@gmail.com>
// Licensed under the MIT license. See LICENSE file in the project root for details.

grammar FuzzySolidity;

sourceUnit
  : NL*
    (
    pragmaDirective
    | importDirective
    | contractDefinition
    | enumDefinition
    | structDefinition
    | functionDefinition
    | fileLevelConstant
    | customErrorDefinition
    | expressionStatement
    | stateVariableDeclaration
    )* EOF ;

pragmaDirective
  : 'pragma' NL* pragmaName pragmaValue eos ;

pragmaName
  : identifier ;

pragmaValue
  : version | expression ;

version
  : versionConstraint (('||' NL*)? versionConstraint)* ;

versionOperator
  : ('^' | '~' | '>=' | '>' | '<' | '<=' | '=') NL* ;

versionConstraint
  : versionOperator? VersionLiteral NL*
  | versionOperator? DecimalNumber NL* ;

importDeclaration
  : identifier ('as' NL* identifier)? ;

importDirective
  : 'import' NL* importPath ('as' NL* identifier)? eos
  | 'import' NL* ('*' NL* | identifier) ('as' NL* identifier)? 'from' NL* importPath eos
  | 'import' NL* '{' NL* importDeclaration ( ',' NL* importDeclaration )* '}' NL* 'from' NL* importPath eos ;

importPath : StringLiteralFragment ;

contractDefinition
  : ('abstract' NL*)? ( 'contract' | 'interface' | 'library' ) NL* identifier
    ( 'is' NL* inheritanceSpecifier (',' NL* inheritanceSpecifier )* )?
    '{' NL* contractPart* '}' NL* ;

inheritanceSpecifier
  : userDefinedTypeName ( '(' NL* expressionList? ')' NL* )? ;

contractPart
  : stateVariableDeclaration
  | usingForDeclaration
  | structDefinition
  | modifierDefinition
  | functionDefinition
  | eventDefinition
  | enumDefinition
  | customErrorDefinition;


stateVariableDeclaration
  : typeName
    ( PublicKeyword NL* | InternalKeyword NL* | PrivateKeyword NL* | ConstantKeyword NL* | ImmutableKeyword NL* | overrideSpecifier )*
    identifier ('=' NL* expression)? eos ;

fileLevelConstant
  : typeName ConstantKeyword NL* identifier '=' NL* expression eos ;

customErrorDefinition
  : 'error' NL* identifier parameterList eos ;

usingForDeclaration
  : 'using' NL* identifier 'for' NL* ('*' NL* | typeName) eos ;

structDefinition
  : 'struct' NL* identifier
    '{' NL* ( variableDeclaration eos (variableDeclaration eos)* )? '}' NL* ;

modifierDefinition
  : 'modifier' NL* identifier parameterList? ( VirtualKeyword NL* | overrideSpecifier )* ( eos | block ) ;

modifierInvocation
  : identifier ( '(' NL* expressionList? ')' NL* )? ;

functionDefinition
  : functionDescriptor parameterList modifierList returnParameters? ( eos | block ) ;

functionDescriptor
  : 'function' NL* identifier?
  | ConstructorKeyword NL*
  | FallbackKeyword NL*
  | ReceiveKeyword NL* ;

returnParameters
  : 'returns' NL* parameterList ;

modifierList
  : (ExternalKeyword NL* | PublicKeyword NL* | InternalKeyword NL* | PrivateKeyword NL* | VirtualKeyword NL* | stateMutability | modifierInvocation | overrideSpecifier )* ;

eventDefinition
  : 'event' NL* identifier eventParameterList (AnonymousKeyword NL*)? eos ;

enumValue
  : identifier ;

enumDefinition
  : 'enum' NL* identifier '{' NL* enumValue? (',' NL* enumValue)* '}' NL* ;

parameterList
  : '(' NL* ( parameter (',' NL* parameter)* )? ')' NL* ;

parameter
  : typeName storageLocation? identifier? ;

eventParameterList
  : '(' NL* ( eventParameter (',' NL* eventParameter)* )? ')' NL* ;

eventParameter
  : typeName (IndexedKeyword NL*)? identifier? ;

functionTypeParameterList
  : '(' NL* ( functionTypeParameter (',' NL* functionTypeParameter)* )? ')' NL* ;

functionTypeParameter
  : typeName storageLocation? ;

variableDeclaration
  : typeName storageLocation? identifier ;

typeName
  : elementaryTypeName
  | userDefinedTypeName
  | mapping
  | typeName '[' NL* expression? ']' NL*
  | functionTypeName
  | 'address' NL* 'payable' NL* ;

userDefinedTypeName
  : identifier ( '.' NL* identifier )* ;

mappingKey
  : elementaryTypeName
  | userDefinedTypeName ;

mapping
  : 'mapping' NL* '(' NL* mappingKey '=>' NL* typeName ')' NL* ;

functionTypeName
  : 'function' NL* functionTypeParameterList
    ( InternalKeyword NL* | ExternalKeyword NL* | stateMutability )*
    ( 'returns' NL* functionTypeParameterList )? ;

storageLocation
  : ('memory' | 'storage' | 'calldata') NL*;

stateMutability
  : (PureKeyword | ConstantKeyword | ViewKeyword | PayableKeyword) NL*  ;

block
  : '{' NL* statement* '}' NL* ;

statement
  : ifStatement
  | tryStatement
  | whileStatement
  | forStatement
  | block
  | inlineAssemblyStatement
  | doWhileStatement
  | continueStatement
  | breakStatement
  | returnStatement
  | throwStatement
  | emitStatement
  | simpleStatement
  | uncheckedStatement
  | revertStatement;

expressionStatement
  : expression eos ;

ifStatement
  : 'if' NL* '(' NL* expression ')' NL* statement ( 'else' NL* statement )? ;

tryStatement : 'try' NL* expression returnParameters? block catchClause+ ;

// In reality catch clauses still are not processed as below
// the identifier can only be a set string: "Error". But plans
// of the Solidity team include possible expansion so we'll
// leave this as is, befitting with the Solidity docs.
catchClause : 'catch' NL* ( identifier? parameterList )? block ;

whileStatement
  : 'while' NL* '(' NL* expression ')' NL* statement ;

simpleStatement
  : ( variableDeclarationStatement | expressionStatement ) ;

uncheckedStatement
  : 'unchecked' NL* block ;

forStatement
  : 'for' NL* '(' NL* ( simpleStatement | ';' NL* ) ( expressionStatement | ';' NL* ) expression? ')' NL* statement ;

inlineAssemblyStatement
  : 'assembly' NL* (StringLiteralFragment NL*)? assemblyBlock ;

doWhileStatement
  : 'do' NL* statement 'while' NL* '(' NL* expression ')' NL* eos ;

continueStatement
  : 'continue' eos ;

breakStatement
  : 'break' eos ;

returnStatement
  : 'return' NL* expression? eos ;

throwStatement
  : 'throw' eos ;

emitStatement
  : 'emit' NL* functionCall eos ;

revertStatement
  : 'revert' NL* functionCall eos ;

variableDeclarationStatement
  : ( 'var' NL* identifierList | variableDeclaration | '(' NL* variableDeclarationList ')' NL* ) ( '=' NL* expression )? eos;

variableDeclarationList
  : variableDeclaration? (',' NL* variableDeclaration? )* ;

identifierList
  : '(' NL* ( identifier? ',' NL* )* identifier? ')' NL* ;

elementaryTypeName
  : ('address' | 'bool' | 'string' | 'var' | Int | Uint | 'byte' | Byte | Fixed | Ufixed) NL* ;

Int
  : 'int' | 'int8' | 'int16' | 'int24' | 'int32' | 'int40' | 'int48' | 'int56' | 'int64' | 'int72' | 'int80' | 'int88' | 'int96' | 'int104' | 'int112' | 'int120' | 'int128' | 'int136' | 'int144' | 'int152' | 'int160' | 'int168' | 'int176' | 'int184' | 'int192' | 'int200' | 'int208' | 'int216' | 'int224' | 'int232' | 'int240' | 'int248' | 'int256' ;

Uint
  : 'uint' | 'uint8' | 'uint16' | 'uint24' | 'uint32' | 'uint40' | 'uint48' | 'uint56' | 'uint64' | 'uint72' | 'uint80' | 'uint88' | 'uint96' | 'uint104' | 'uint112' | 'uint120' | 'uint128' | 'uint136' | 'uint144' | 'uint152' | 'uint160' | 'uint168' | 'uint176' | 'uint184' | 'uint192' | 'uint200' | 'uint208' | 'uint216' | 'uint224' | 'uint232' | 'uint240' | 'uint248' | 'uint256' ;

Byte
  : 'bytes' | 'bytes1' | 'bytes2' | 'bytes3' | 'bytes4' | 'bytes5' | 'bytes6' | 'bytes7' | 'bytes8' | 'bytes9' | 'bytes10' | 'bytes11' | 'bytes12' | 'bytes13' | 'bytes14' | 'bytes15' | 'bytes16' | 'bytes17' | 'bytes18' | 'bytes19' | 'bytes20' | 'bytes21' | 'bytes22' | 'bytes23' | 'bytes24' | 'bytes25' | 'bytes26' | 'bytes27' | 'bytes28' | 'bytes29' | 'bytes30' | 'bytes31' | 'bytes32'  ;

Fixed
  : 'fixed' | ( 'fixed' [0-9]+ 'x' [0-9]+ ) ;

Ufixed
  : 'ufixed' | ( 'ufixed' [0-9]+ 'x' [0-9]+ ) ;

expression
  : expression ('++' | '--') NL*
  | 'new' NL* typeName
  | expression '[' NL* expression ']' NL*
  | expression '[' NL* expression? ':' NL* expression? ']' NL*
  | expression '.' NL* identifier
  | expression '{' NL* nameValueList '}' NL*
  | expression '(' NL* functionCallArguments ')' NL*
  | '(' NL* expression ')' NL*
  | ('++' | '--') NL* expression
  | ('+' | '-') NL* expression
  | ('after' | 'delete') NL* expression
  | '!' NL* expression
  | '~' NL* expression
  | expression '**' NL* expression
  | expression ('*' | '/' | '%') NL* expression
  | expression ('+' | '-') NL* expression
  | expression ('<<' | '>>') NL* expression
  | expression '&' NL* expression
  | expression '^' NL* expression
  | expression '|' NL* expression
  | expression ('<' | '>' | '<=' | '>=') NL* expression
  | expression ('==' | '!=') NL* expression
  | expression '&&' NL* expression
  | expression '||' NL* expression
  | expression '?' NL* expression ':' NL* expression
  | expression ('=' | '|=' | '^=' | '&=' | '<<=' | '>>=' | '+=' | '-=' | '*=' | '/=' | '%=') NL* expression
  | primaryExpression ;

primaryExpression
  : BooleanLiteral NL*
  | numberLiteral
  | hexLiteral
  | stringLiteral
  | identifier ('[' NL* ']' NL*)?
  | TypeKeyword NL*
  | PayableKeyword NL*
  | tupleExpression
  | typeNameExpression ('[' NL* ']' NL*)? ;

expressionList
  : expression (',' NL* expression)* ;

nameValueList
  : nameValue (',' NL* nameValue)* (',' NL*)? ;

nameValue
  : identifier ':' NL* expression ;

functionCallArguments
  : '{' NL* nameValueList? '}' NL*
  | expressionList? ;

functionCall
  : expression '(' NL* functionCallArguments ')' NL* ;

assemblyBlock
  : '{' NL* assemblyItem* '}' NL* ;

assemblyItem
  : identifier
  | assemblyBlock
  | assemblyExpression
  | assemblyLocalDefinition
  | assemblyAssignment
  | assemblyStackAssignment
  | labelDefinition
  | assemblySwitch
  | assemblyFunctionDefinition
  | assemblyFor
  | assemblyIf
  | BreakKeyword NL*
  | ContinueKeyword NL*
  | LeaveKeyword NL*
  | subAssembly
  | numberLiteral
  | stringLiteral
  | hexLiteral ;

assemblyExpression
  : assemblyCall | assemblyLiteral | assemblyMember ;

assemblyMember
  : identifier '.' NL* identifier ;

assemblyCall
  : ( 'return' NL* | 'address' NL* | 'byte' NL* | identifier ) ( '(' NL* assemblyExpression? ( ',' NL* assemblyExpression )* ')' NL* )? ;

assemblyLocalDefinition
  : 'let' NL* assemblyIdentifierOrList ( ':=' NL* assemblyExpression )? ;

assemblyAssignment
  : assemblyIdentifierOrList ':=' NL* assemblyExpression ;

assemblyIdentifierOrList
  : identifier | assemblyMember | '(' NL* assemblyIdentifierList ')' NL* ;

assemblyIdentifierList
  : identifier ( ',' NL* identifier )* ;

assemblyStackAssignment
  : '=:' NL* identifier ;

labelDefinition
  : identifier ':' NL* ;

assemblySwitch
  : 'switch' NL* assemblyExpression assemblyCase* ;

assemblyCase
  : 'case' NL* assemblyLiteral assemblyBlock
  | 'default' NL* assemblyBlock ;

assemblyFunctionDefinition
  : 'function' NL* identifier '(' NL* assemblyIdentifierList? ')' NL*
    assemblyFunctionReturns? assemblyBlock ;

assemblyFunctionReturns
  : ( '->' NL* assemblyIdentifierList ) ;

assemblyFor
  : 'for' NL* ( assemblyBlock | assemblyExpression )
    assemblyExpression ( assemblyBlock | assemblyExpression ) assemblyBlock ;

assemblyIf
  : 'if' NL* assemblyExpression assemblyBlock ;

assemblyLiteral
  : stringLiteral | DecimalNumber NL* | HexNumber NL* | hexLiteral ;

subAssembly
  : 'assembly' NL* identifier assemblyBlock ;

tupleExpression
  : '(' NL* ( expression? ( ',' NL* expression? )* ) ')' NL*
  | '[' NL* ( expression ( ',' NL* expression )* )? ']' NL* ;

typeNameExpression
  : elementaryTypeName
  | userDefinedTypeName ;

numberLiteral
  : (DecimalNumber NL* | HexNumber NL*) (NumberUnit NL*)? ;

// some keywords need to be added here to avoid ambiguities
// for example, "revert" is a keyword but it can also be a function name
identifier
  : ('from' | 'calldata' | 'receive' | 'callback' | 'revert' | 'error' | ConstructorKeyword | PayableKeyword | LeaveKeyword | Identifier) NL* ;

BooleanLiteral
  : ('true' | 'false') ;

DecimalNumber
  : ( DecimalDigits | (DecimalDigits? '.' DecimalDigits) ) ( [eE] DecimalDigits )? ;

fragment
DecimalDigits
  : [0-9] ( '_'? [0-9] )* ;

HexNumber
  : '0' [xX] HexDigits ;

fragment
HexDigits
  : HexCharacter ( '_'? HexCharacter )* ;

NumberUnit
  : 'wei' | 'gwei' | 'szabo' | 'finney' | 'ether'
  | 'seconds' | 'minutes' | 'hours' | 'days' | 'weeks' | 'years' ;

hexLiteral : (HexLiteralFragment NL*)+ ;

HexLiteralFragment : 'hex' ('"' HexDigits? '"' | '\'' HexDigits? '\'') ;

fragment
HexPair
  : HexCharacter HexCharacter ;

fragment
HexCharacter
  : [0-9A-Fa-f] ;

ReservedKeyword
  : 'abstract'
  | 'after'
  | 'case'
  | 'catch'
  | 'default'
  | 'final'
  | 'in'
  | 'inline'
  | 'let'
  | 'match'
  | 'null'
  | 'of'
  | 'relocatable'
  | 'static'
  | 'switch'
  | 'try'
  | 'typeof' ;

AnonymousKeyword : 'anonymous' ;
BreakKeyword : 'break' ;
ConstantKeyword : 'constant' ;
ImmutableKeyword : 'immutable' ;
ContinueKeyword : 'continue' ;
LeaveKeyword : 'leave' ;
ExternalKeyword : 'external' ;
IndexedKeyword : 'indexed' ;
InternalKeyword : 'internal' ;
PayableKeyword : 'payable' ;
PrivateKeyword : 'private' ;
PublicKeyword : 'public' ;
VirtualKeyword : 'virtual' ;
PureKeyword : 'pure' ;
TypeKeyword : 'type' ;
ViewKeyword : 'view' ;

ConstructorKeyword : 'constructor' ;
FallbackKeyword : 'fallback' ;
ReceiveKeyword : 'receive' ;

overrideSpecifier : 'override' NL* ( '(' NL* userDefinedTypeName (',' NL* userDefinedTypeName)* ')' NL* )? ;

Identifier
  : IdentifierStart IdentifierPart* ;

fragment
IdentifierStart
  : [a-zA-Z$_] ;

fragment
IdentifierPart
  : [a-zA-Z0-9$_] ;

stringLiteral
  : (StringLiteralFragment NL*)+ ;

StringLiteralFragment
  : 'unicode'? '"' DoubleQuotedStringCharacter* '"'
  | 'unicode'? '\'' SingleQuotedStringCharacter* '\'' ;

fragment
DoubleQuotedStringCharacter
  : ~["\r\n\\] | ('\\' .) ;

fragment
SingleQuotedStringCharacter
  : ~['\r\n\\] | ('\\' .) ;

VersionLiteral
  : [0-9]+ '.' [0-9]+ ('.' [0-9]+)? ;

/* end-of-statement (line) marker:
 *
 * allow for semicolon based statement/line ending or NL as often used in
 * code snippets
 */
eos
  : ';' NL*
  | NL+ ;

NL
  : [\r\n]+ ;

WS
  : [ \t\u000C]+ -> skip ;

COMMENT
  : '/*' .*? '*/' NL* -> channel(HIDDEN) ;

LINE_COMMENT
  : '//' ~[\r\n]* NL+ -> channel(HIDDEN) ;

// ignore a few characters often occuring near end-of-file
IGNORE
  : [`'] -> skip ;
