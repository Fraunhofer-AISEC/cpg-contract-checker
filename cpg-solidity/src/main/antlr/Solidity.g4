// Downloaded from https://github.com/solidity-parser/antlr/blob/master/Solidity.g4
// https://github.com/solidity-parser/antlr/commit/1f0c0e3fa4d70ac1afa697efcaa78bb8d18ca5c3
// Copyright 2020 Gonçalo Sá <goncalo.sa@consensys.net>
// Copyright 2016-2019 Federico Bond <federicobond@gmail.com>
// Licensed under the MIT license. See LICENSE file in the project root for details.

// Grammar adopted for parsing of Solidity code snippets. 
// Made fuzzier by allowing
// - pull up some rules of commonly appearing code fragments in snippets
// - newlines as statement ending instead of just semicolon

grammar Solidity;

sourceUnit
  : NL*
  (
  pragmaDirective
  | importDirective
  | contractDefinition
  | contractPart // assumption: all snippets are part of a contract
  | enumDefinition
  | structDefinition
  | functionDefinition
  | fileLevelConstant
  | customErrorDefinition
  | typeDefinition
  | usingForDeclaration
  // additional parts found in snippets
  | expressionStatement
  | block
  | statement
  )* EOF ;


pragmaDirective
  : 'pragma' NL* pragmaName pragmaValue eos ;

pragmaName
  : identifier ;

pragmaValue
  : '*' NL* | version | expression ;

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
  | customErrorDefinition
  | typeDefinition;

stateVariableDeclaration
  : typeName
    ( PublicKeyword NL* | InternalKeyword NL* | PrivateKeyword NL* | ConstantKeyword NL* | ImmutableKeyword NL* | overrideSpecifier )*
    identifier ('=' NL* expression)? eos ;

fileLevelConstant
  : typeName ConstantKeyword NL* identifier '=' NL* expression eos ;

customErrorDefinition
  : 'error' NL* identifier parameterList eos ;

typeDefinition
  : 'type' NL* identifier
    'is' NL* elementaryTypeName eos ;

usingForDeclaration
  : 'using' NL* usingForObject 'for' NL* ('*' NL* | typeName) (GlobalKeyword NL*)? eos ;

usingForObject
  : userDefinedTypeName
  | '{' NL* usingForObjectDirective ( ',' NL* usingForObjectDirective )* '}' NL*;

usingForObjectDirective
  : userDefinedTypeName ( 'as' NL* userDefinableOperators )?;

userDefinableOperators
  : ('|' | '&' | '^' | '~' | '+' | '-' | '*' | '/' | '%' | '==' | '!=' | '<' | '>' | '<=' | '>=') NL* ;

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
  : 'mapping' NL* '(' NL* mappingKey mappingKeyName? '=>' NL* typeName mappingValueName? ')' NL* ;

mappingKeyName : identifier;
mappingValueName : identifier;

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
  : 'assembly' NL* (StringLiteralFragment NL*)? ('(' NL* inlineAssemblyStatementFlag ')' NL* )? assemblyBlock ;

inlineAssemblyStatementFlag
  : stringLiteral;

doWhileStatement
  : 'do' NL* statement 'while' NL* '(' NL* expression ')' eos ;

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
  : 'int' (NumberOfBits)? ;

Uint
  : 'uint' (NumberOfBits)? ;

Byte
  : 'bytes' (NumberOfBytes)?;

Fixed
  : 'fixed' ( NumberOfBits 'x' [0-9]+ )? ;

Ufixed
  : 'ufixed' ( NumberOfBits 'x' [0-9]+ )? ;

fragment
NumberOfBits
  : '8' | '16' | '24' | '32' | '40' | '48' | '56' | '64' | '72' | '80' | '88' | '96' | '104' | '112' | '120' | '128' | '136' | '144' | '152' | '160' | '168' | '176' | '184' | '192' | '200' | '208' | '216' | '224' | '232' | '240' | '248' | '256' ;

fragment
NumberOfBytes
  : [1-9] | [12] [0-9] | '3' [0-2] ;

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
  | 'delete' NL* expression
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
  | identifier
  | TypeKeyword NL*
  | PayableKeyword NL*
  | tupleExpression
  | typeName;

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
  : identifier
  | assemblyMember
  | assemblyIdentifierList
  | '(' NL* assemblyIdentifierList ')' NL* ;

assemblyIdentifierList
  : identifier ( ',' NL* identifier )* ;

assemblyStackAssignment
  : assemblyExpression '=:' NL* identifier ;

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
  : stringLiteral | DecimalNumber NL* | HexNumber NL* | hexLiteral | BooleanLiteral ;

tupleExpression
  : '(' NL* ( expression? ( ',' NL* expression? )* ) ')' NL*
  | '[' NL* ( expression ( ',' NL* expression )* )? ']' NL* ;

numberLiteral
  : (DecimalNumber NL* | HexNumber NL*) (NumberUnit NL*)? ;

// some keywords need to be added here to avoid ambiguities
// for example, "revert" is a keyword but it can also be a function name
identifier
  : ('from' | 'calldata' | 'receive' | 'callback' | 'revert' | 'error' | 'address' | GlobalKeyword | ConstructorKeyword | PayableKeyword | LeaveKeyword | Identifier) NL* ;

BooleanLiteral
  : 'true' | 'false' ;

DecimalNumber
  : ( DecimalDigits | (DecimalDigits? '.' DecimalDigits) ) ( [eE] '-'? DecimalDigits )? ;

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
GlobalKeyword : 'global' ;

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
  : 'unicode'? ( '"' DoubleQuotedStringCharacter* '"' | '\'' SingleQuotedStringCharacter* '\'' ) ;

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
  : NL* ';' NL*
  | NL+ ;

NL
  : [\r\n\u000C]+ ;

WS
  : [ \t]+ -> skip ;

COMMENT
  : '/*' .*? '*/' NL? -> channel(HIDDEN) ;

LINE_COMMENT
  : '//' ~[\r\n]* NL? -> channel(HIDDEN) ;

// ignore a few characters often occuring near end-of-file
//IGNORE
//  : '...' -> skip ;
//  : [`'] -> skip ;
