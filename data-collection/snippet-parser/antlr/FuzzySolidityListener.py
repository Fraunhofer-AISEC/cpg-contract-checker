# Generated from antlr/FuzzySolidity.g4 by ANTLR 4.10.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .FuzzySolidityParser import FuzzySolidityParser
else:
    from FuzzySolidityParser import FuzzySolidityParser

# This class defines a complete listener for a parse tree produced by FuzzySolidityParser.
class FuzzySolidityListener(ParseTreeListener):

    # Enter a parse tree produced by FuzzySolidityParser#sourceUnit.
    def enterSourceUnit(self, ctx:FuzzySolidityParser.SourceUnitContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#sourceUnit.
    def exitSourceUnit(self, ctx:FuzzySolidityParser.SourceUnitContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#pragmaDirective.
    def enterPragmaDirective(self, ctx:FuzzySolidityParser.PragmaDirectiveContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#pragmaDirective.
    def exitPragmaDirective(self, ctx:FuzzySolidityParser.PragmaDirectiveContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#pragmaName.
    def enterPragmaName(self, ctx:FuzzySolidityParser.PragmaNameContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#pragmaName.
    def exitPragmaName(self, ctx:FuzzySolidityParser.PragmaNameContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#pragmaValue.
    def enterPragmaValue(self, ctx:FuzzySolidityParser.PragmaValueContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#pragmaValue.
    def exitPragmaValue(self, ctx:FuzzySolidityParser.PragmaValueContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#version.
    def enterVersion(self, ctx:FuzzySolidityParser.VersionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#version.
    def exitVersion(self, ctx:FuzzySolidityParser.VersionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#versionOperator.
    def enterVersionOperator(self, ctx:FuzzySolidityParser.VersionOperatorContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#versionOperator.
    def exitVersionOperator(self, ctx:FuzzySolidityParser.VersionOperatorContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#versionConstraint.
    def enterVersionConstraint(self, ctx:FuzzySolidityParser.VersionConstraintContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#versionConstraint.
    def exitVersionConstraint(self, ctx:FuzzySolidityParser.VersionConstraintContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#importDeclaration.
    def enterImportDeclaration(self, ctx:FuzzySolidityParser.ImportDeclarationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#importDeclaration.
    def exitImportDeclaration(self, ctx:FuzzySolidityParser.ImportDeclarationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#importDirective.
    def enterImportDirective(self, ctx:FuzzySolidityParser.ImportDirectiveContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#importDirective.
    def exitImportDirective(self, ctx:FuzzySolidityParser.ImportDirectiveContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#importPath.
    def enterImportPath(self, ctx:FuzzySolidityParser.ImportPathContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#importPath.
    def exitImportPath(self, ctx:FuzzySolidityParser.ImportPathContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#contractDefinition.
    def enterContractDefinition(self, ctx:FuzzySolidityParser.ContractDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#contractDefinition.
    def exitContractDefinition(self, ctx:FuzzySolidityParser.ContractDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#inheritanceSpecifier.
    def enterInheritanceSpecifier(self, ctx:FuzzySolidityParser.InheritanceSpecifierContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#inheritanceSpecifier.
    def exitInheritanceSpecifier(self, ctx:FuzzySolidityParser.InheritanceSpecifierContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#contractPart.
    def enterContractPart(self, ctx:FuzzySolidityParser.ContractPartContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#contractPart.
    def exitContractPart(self, ctx:FuzzySolidityParser.ContractPartContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#stateVariableDeclaration.
    def enterStateVariableDeclaration(self, ctx:FuzzySolidityParser.StateVariableDeclarationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#stateVariableDeclaration.
    def exitStateVariableDeclaration(self, ctx:FuzzySolidityParser.StateVariableDeclarationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#fileLevelConstant.
    def enterFileLevelConstant(self, ctx:FuzzySolidityParser.FileLevelConstantContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#fileLevelConstant.
    def exitFileLevelConstant(self, ctx:FuzzySolidityParser.FileLevelConstantContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#customErrorDefinition.
    def enterCustomErrorDefinition(self, ctx:FuzzySolidityParser.CustomErrorDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#customErrorDefinition.
    def exitCustomErrorDefinition(self, ctx:FuzzySolidityParser.CustomErrorDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#usingForDeclaration.
    def enterUsingForDeclaration(self, ctx:FuzzySolidityParser.UsingForDeclarationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#usingForDeclaration.
    def exitUsingForDeclaration(self, ctx:FuzzySolidityParser.UsingForDeclarationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#structDefinition.
    def enterStructDefinition(self, ctx:FuzzySolidityParser.StructDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#structDefinition.
    def exitStructDefinition(self, ctx:FuzzySolidityParser.StructDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#modifierDefinition.
    def enterModifierDefinition(self, ctx:FuzzySolidityParser.ModifierDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#modifierDefinition.
    def exitModifierDefinition(self, ctx:FuzzySolidityParser.ModifierDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#modifierInvocation.
    def enterModifierInvocation(self, ctx:FuzzySolidityParser.ModifierInvocationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#modifierInvocation.
    def exitModifierInvocation(self, ctx:FuzzySolidityParser.ModifierInvocationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionDefinition.
    def enterFunctionDefinition(self, ctx:FuzzySolidityParser.FunctionDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionDefinition.
    def exitFunctionDefinition(self, ctx:FuzzySolidityParser.FunctionDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionDescriptor.
    def enterFunctionDescriptor(self, ctx:FuzzySolidityParser.FunctionDescriptorContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionDescriptor.
    def exitFunctionDescriptor(self, ctx:FuzzySolidityParser.FunctionDescriptorContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#returnParameters.
    def enterReturnParameters(self, ctx:FuzzySolidityParser.ReturnParametersContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#returnParameters.
    def exitReturnParameters(self, ctx:FuzzySolidityParser.ReturnParametersContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#modifierList.
    def enterModifierList(self, ctx:FuzzySolidityParser.ModifierListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#modifierList.
    def exitModifierList(self, ctx:FuzzySolidityParser.ModifierListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#eventDefinition.
    def enterEventDefinition(self, ctx:FuzzySolidityParser.EventDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#eventDefinition.
    def exitEventDefinition(self, ctx:FuzzySolidityParser.EventDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#enumValue.
    def enterEnumValue(self, ctx:FuzzySolidityParser.EnumValueContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#enumValue.
    def exitEnumValue(self, ctx:FuzzySolidityParser.EnumValueContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#enumDefinition.
    def enterEnumDefinition(self, ctx:FuzzySolidityParser.EnumDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#enumDefinition.
    def exitEnumDefinition(self, ctx:FuzzySolidityParser.EnumDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#parameterList.
    def enterParameterList(self, ctx:FuzzySolidityParser.ParameterListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#parameterList.
    def exitParameterList(self, ctx:FuzzySolidityParser.ParameterListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#parameter.
    def enterParameter(self, ctx:FuzzySolidityParser.ParameterContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#parameter.
    def exitParameter(self, ctx:FuzzySolidityParser.ParameterContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#eventParameterList.
    def enterEventParameterList(self, ctx:FuzzySolidityParser.EventParameterListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#eventParameterList.
    def exitEventParameterList(self, ctx:FuzzySolidityParser.EventParameterListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#eventParameter.
    def enterEventParameter(self, ctx:FuzzySolidityParser.EventParameterContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#eventParameter.
    def exitEventParameter(self, ctx:FuzzySolidityParser.EventParameterContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionTypeParameterList.
    def enterFunctionTypeParameterList(self, ctx:FuzzySolidityParser.FunctionTypeParameterListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionTypeParameterList.
    def exitFunctionTypeParameterList(self, ctx:FuzzySolidityParser.FunctionTypeParameterListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionTypeParameter.
    def enterFunctionTypeParameter(self, ctx:FuzzySolidityParser.FunctionTypeParameterContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionTypeParameter.
    def exitFunctionTypeParameter(self, ctx:FuzzySolidityParser.FunctionTypeParameterContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#variableDeclaration.
    def enterVariableDeclaration(self, ctx:FuzzySolidityParser.VariableDeclarationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#variableDeclaration.
    def exitVariableDeclaration(self, ctx:FuzzySolidityParser.VariableDeclarationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#typeName.
    def enterTypeName(self, ctx:FuzzySolidityParser.TypeNameContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#typeName.
    def exitTypeName(self, ctx:FuzzySolidityParser.TypeNameContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#userDefinedTypeName.
    def enterUserDefinedTypeName(self, ctx:FuzzySolidityParser.UserDefinedTypeNameContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#userDefinedTypeName.
    def exitUserDefinedTypeName(self, ctx:FuzzySolidityParser.UserDefinedTypeNameContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#mappingKey.
    def enterMappingKey(self, ctx:FuzzySolidityParser.MappingKeyContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#mappingKey.
    def exitMappingKey(self, ctx:FuzzySolidityParser.MappingKeyContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#mapping.
    def enterMapping(self, ctx:FuzzySolidityParser.MappingContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#mapping.
    def exitMapping(self, ctx:FuzzySolidityParser.MappingContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionTypeName.
    def enterFunctionTypeName(self, ctx:FuzzySolidityParser.FunctionTypeNameContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionTypeName.
    def exitFunctionTypeName(self, ctx:FuzzySolidityParser.FunctionTypeNameContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#storageLocation.
    def enterStorageLocation(self, ctx:FuzzySolidityParser.StorageLocationContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#storageLocation.
    def exitStorageLocation(self, ctx:FuzzySolidityParser.StorageLocationContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#stateMutability.
    def enterStateMutability(self, ctx:FuzzySolidityParser.StateMutabilityContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#stateMutability.
    def exitStateMutability(self, ctx:FuzzySolidityParser.StateMutabilityContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#block.
    def enterBlock(self, ctx:FuzzySolidityParser.BlockContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#block.
    def exitBlock(self, ctx:FuzzySolidityParser.BlockContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#statement.
    def enterStatement(self, ctx:FuzzySolidityParser.StatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#statement.
    def exitStatement(self, ctx:FuzzySolidityParser.StatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#expressionStatement.
    def enterExpressionStatement(self, ctx:FuzzySolidityParser.ExpressionStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#expressionStatement.
    def exitExpressionStatement(self, ctx:FuzzySolidityParser.ExpressionStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#ifStatement.
    def enterIfStatement(self, ctx:FuzzySolidityParser.IfStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#ifStatement.
    def exitIfStatement(self, ctx:FuzzySolidityParser.IfStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#tryStatement.
    def enterTryStatement(self, ctx:FuzzySolidityParser.TryStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#tryStatement.
    def exitTryStatement(self, ctx:FuzzySolidityParser.TryStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#catchClause.
    def enterCatchClause(self, ctx:FuzzySolidityParser.CatchClauseContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#catchClause.
    def exitCatchClause(self, ctx:FuzzySolidityParser.CatchClauseContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#whileStatement.
    def enterWhileStatement(self, ctx:FuzzySolidityParser.WhileStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#whileStatement.
    def exitWhileStatement(self, ctx:FuzzySolidityParser.WhileStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#simpleStatement.
    def enterSimpleStatement(self, ctx:FuzzySolidityParser.SimpleStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#simpleStatement.
    def exitSimpleStatement(self, ctx:FuzzySolidityParser.SimpleStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#uncheckedStatement.
    def enterUncheckedStatement(self, ctx:FuzzySolidityParser.UncheckedStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#uncheckedStatement.
    def exitUncheckedStatement(self, ctx:FuzzySolidityParser.UncheckedStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#forStatement.
    def enterForStatement(self, ctx:FuzzySolidityParser.ForStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#forStatement.
    def exitForStatement(self, ctx:FuzzySolidityParser.ForStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#inlineAssemblyStatement.
    def enterInlineAssemblyStatement(self, ctx:FuzzySolidityParser.InlineAssemblyStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#inlineAssemblyStatement.
    def exitInlineAssemblyStatement(self, ctx:FuzzySolidityParser.InlineAssemblyStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#doWhileStatement.
    def enterDoWhileStatement(self, ctx:FuzzySolidityParser.DoWhileStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#doWhileStatement.
    def exitDoWhileStatement(self, ctx:FuzzySolidityParser.DoWhileStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#continueStatement.
    def enterContinueStatement(self, ctx:FuzzySolidityParser.ContinueStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#continueStatement.
    def exitContinueStatement(self, ctx:FuzzySolidityParser.ContinueStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#breakStatement.
    def enterBreakStatement(self, ctx:FuzzySolidityParser.BreakStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#breakStatement.
    def exitBreakStatement(self, ctx:FuzzySolidityParser.BreakStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#returnStatement.
    def enterReturnStatement(self, ctx:FuzzySolidityParser.ReturnStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#returnStatement.
    def exitReturnStatement(self, ctx:FuzzySolidityParser.ReturnStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#throwStatement.
    def enterThrowStatement(self, ctx:FuzzySolidityParser.ThrowStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#throwStatement.
    def exitThrowStatement(self, ctx:FuzzySolidityParser.ThrowStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#emitStatement.
    def enterEmitStatement(self, ctx:FuzzySolidityParser.EmitStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#emitStatement.
    def exitEmitStatement(self, ctx:FuzzySolidityParser.EmitStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#revertStatement.
    def enterRevertStatement(self, ctx:FuzzySolidityParser.RevertStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#revertStatement.
    def exitRevertStatement(self, ctx:FuzzySolidityParser.RevertStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#variableDeclarationStatement.
    def enterVariableDeclarationStatement(self, ctx:FuzzySolidityParser.VariableDeclarationStatementContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#variableDeclarationStatement.
    def exitVariableDeclarationStatement(self, ctx:FuzzySolidityParser.VariableDeclarationStatementContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#variableDeclarationList.
    def enterVariableDeclarationList(self, ctx:FuzzySolidityParser.VariableDeclarationListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#variableDeclarationList.
    def exitVariableDeclarationList(self, ctx:FuzzySolidityParser.VariableDeclarationListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#identifierList.
    def enterIdentifierList(self, ctx:FuzzySolidityParser.IdentifierListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#identifierList.
    def exitIdentifierList(self, ctx:FuzzySolidityParser.IdentifierListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#elementaryTypeName.
    def enterElementaryTypeName(self, ctx:FuzzySolidityParser.ElementaryTypeNameContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#elementaryTypeName.
    def exitElementaryTypeName(self, ctx:FuzzySolidityParser.ElementaryTypeNameContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#expression.
    def enterExpression(self, ctx:FuzzySolidityParser.ExpressionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#expression.
    def exitExpression(self, ctx:FuzzySolidityParser.ExpressionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#primaryExpression.
    def enterPrimaryExpression(self, ctx:FuzzySolidityParser.PrimaryExpressionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#primaryExpression.
    def exitPrimaryExpression(self, ctx:FuzzySolidityParser.PrimaryExpressionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#expressionList.
    def enterExpressionList(self, ctx:FuzzySolidityParser.ExpressionListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#expressionList.
    def exitExpressionList(self, ctx:FuzzySolidityParser.ExpressionListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#nameValueList.
    def enterNameValueList(self, ctx:FuzzySolidityParser.NameValueListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#nameValueList.
    def exitNameValueList(self, ctx:FuzzySolidityParser.NameValueListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#nameValue.
    def enterNameValue(self, ctx:FuzzySolidityParser.NameValueContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#nameValue.
    def exitNameValue(self, ctx:FuzzySolidityParser.NameValueContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionCallArguments.
    def enterFunctionCallArguments(self, ctx:FuzzySolidityParser.FunctionCallArgumentsContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionCallArguments.
    def exitFunctionCallArguments(self, ctx:FuzzySolidityParser.FunctionCallArgumentsContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#functionCall.
    def enterFunctionCall(self, ctx:FuzzySolidityParser.FunctionCallContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#functionCall.
    def exitFunctionCall(self, ctx:FuzzySolidityParser.FunctionCallContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyBlock.
    def enterAssemblyBlock(self, ctx:FuzzySolidityParser.AssemblyBlockContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyBlock.
    def exitAssemblyBlock(self, ctx:FuzzySolidityParser.AssemblyBlockContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyItem.
    def enterAssemblyItem(self, ctx:FuzzySolidityParser.AssemblyItemContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyItem.
    def exitAssemblyItem(self, ctx:FuzzySolidityParser.AssemblyItemContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyExpression.
    def enterAssemblyExpression(self, ctx:FuzzySolidityParser.AssemblyExpressionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyExpression.
    def exitAssemblyExpression(self, ctx:FuzzySolidityParser.AssemblyExpressionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyMember.
    def enterAssemblyMember(self, ctx:FuzzySolidityParser.AssemblyMemberContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyMember.
    def exitAssemblyMember(self, ctx:FuzzySolidityParser.AssemblyMemberContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyCall.
    def enterAssemblyCall(self, ctx:FuzzySolidityParser.AssemblyCallContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyCall.
    def exitAssemblyCall(self, ctx:FuzzySolidityParser.AssemblyCallContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyLocalDefinition.
    def enterAssemblyLocalDefinition(self, ctx:FuzzySolidityParser.AssemblyLocalDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyLocalDefinition.
    def exitAssemblyLocalDefinition(self, ctx:FuzzySolidityParser.AssemblyLocalDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyAssignment.
    def enterAssemblyAssignment(self, ctx:FuzzySolidityParser.AssemblyAssignmentContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyAssignment.
    def exitAssemblyAssignment(self, ctx:FuzzySolidityParser.AssemblyAssignmentContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyIdentifierOrList.
    def enterAssemblyIdentifierOrList(self, ctx:FuzzySolidityParser.AssemblyIdentifierOrListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyIdentifierOrList.
    def exitAssemblyIdentifierOrList(self, ctx:FuzzySolidityParser.AssemblyIdentifierOrListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyIdentifierList.
    def enterAssemblyIdentifierList(self, ctx:FuzzySolidityParser.AssemblyIdentifierListContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyIdentifierList.
    def exitAssemblyIdentifierList(self, ctx:FuzzySolidityParser.AssemblyIdentifierListContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyStackAssignment.
    def enterAssemblyStackAssignment(self, ctx:FuzzySolidityParser.AssemblyStackAssignmentContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyStackAssignment.
    def exitAssemblyStackAssignment(self, ctx:FuzzySolidityParser.AssemblyStackAssignmentContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#labelDefinition.
    def enterLabelDefinition(self, ctx:FuzzySolidityParser.LabelDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#labelDefinition.
    def exitLabelDefinition(self, ctx:FuzzySolidityParser.LabelDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblySwitch.
    def enterAssemblySwitch(self, ctx:FuzzySolidityParser.AssemblySwitchContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblySwitch.
    def exitAssemblySwitch(self, ctx:FuzzySolidityParser.AssemblySwitchContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyCase.
    def enterAssemblyCase(self, ctx:FuzzySolidityParser.AssemblyCaseContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyCase.
    def exitAssemblyCase(self, ctx:FuzzySolidityParser.AssemblyCaseContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyFunctionDefinition.
    def enterAssemblyFunctionDefinition(self, ctx:FuzzySolidityParser.AssemblyFunctionDefinitionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyFunctionDefinition.
    def exitAssemblyFunctionDefinition(self, ctx:FuzzySolidityParser.AssemblyFunctionDefinitionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyFunctionReturns.
    def enterAssemblyFunctionReturns(self, ctx:FuzzySolidityParser.AssemblyFunctionReturnsContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyFunctionReturns.
    def exitAssemblyFunctionReturns(self, ctx:FuzzySolidityParser.AssemblyFunctionReturnsContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyFor.
    def enterAssemblyFor(self, ctx:FuzzySolidityParser.AssemblyForContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyFor.
    def exitAssemblyFor(self, ctx:FuzzySolidityParser.AssemblyForContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyIf.
    def enterAssemblyIf(self, ctx:FuzzySolidityParser.AssemblyIfContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyIf.
    def exitAssemblyIf(self, ctx:FuzzySolidityParser.AssemblyIfContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#assemblyLiteral.
    def enterAssemblyLiteral(self, ctx:FuzzySolidityParser.AssemblyLiteralContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#assemblyLiteral.
    def exitAssemblyLiteral(self, ctx:FuzzySolidityParser.AssemblyLiteralContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#subAssembly.
    def enterSubAssembly(self, ctx:FuzzySolidityParser.SubAssemblyContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#subAssembly.
    def exitSubAssembly(self, ctx:FuzzySolidityParser.SubAssemblyContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#tupleExpression.
    def enterTupleExpression(self, ctx:FuzzySolidityParser.TupleExpressionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#tupleExpression.
    def exitTupleExpression(self, ctx:FuzzySolidityParser.TupleExpressionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#typeNameExpression.
    def enterTypeNameExpression(self, ctx:FuzzySolidityParser.TypeNameExpressionContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#typeNameExpression.
    def exitTypeNameExpression(self, ctx:FuzzySolidityParser.TypeNameExpressionContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#numberLiteral.
    def enterNumberLiteral(self, ctx:FuzzySolidityParser.NumberLiteralContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#numberLiteral.
    def exitNumberLiteral(self, ctx:FuzzySolidityParser.NumberLiteralContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#identifier.
    def enterIdentifier(self, ctx:FuzzySolidityParser.IdentifierContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#identifier.
    def exitIdentifier(self, ctx:FuzzySolidityParser.IdentifierContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#hexLiteral.
    def enterHexLiteral(self, ctx:FuzzySolidityParser.HexLiteralContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#hexLiteral.
    def exitHexLiteral(self, ctx:FuzzySolidityParser.HexLiteralContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#overrideSpecifier.
    def enterOverrideSpecifier(self, ctx:FuzzySolidityParser.OverrideSpecifierContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#overrideSpecifier.
    def exitOverrideSpecifier(self, ctx:FuzzySolidityParser.OverrideSpecifierContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#stringLiteral.
    def enterStringLiteral(self, ctx:FuzzySolidityParser.StringLiteralContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#stringLiteral.
    def exitStringLiteral(self, ctx:FuzzySolidityParser.StringLiteralContext):
        pass


    # Enter a parse tree produced by FuzzySolidityParser#eos.
    def enterEos(self, ctx:FuzzySolidityParser.EosContext):
        pass

    # Exit a parse tree produced by FuzzySolidityParser#eos.
    def exitEos(self, ctx:FuzzySolidityParser.EosContext):
        pass



del FuzzySolidityParser