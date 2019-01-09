Class {
	#name : #FLWFlowRunner,
	#superclass : #Object,
	#instVars : [
		'environment',
		'workflow',
		'frame',
		'debuggingMode'
	],
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #'as yet unclassified' }
FLWFlowRunner >> afterExecution: aMethod for: responsible [
	" pass "
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> beDebuggable [
	debuggingMode := true. 
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> beforeExecution: aMessage for: responsible [
	debuggingMode
		ifTrue: [ Breakpoint new
				node: (responsible class lookupSelector: aMessage) ast;
				once;
				install ]
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> deployBranchingResult: bool on: aBLCActivation [
	self assert: (bool isKindOf: Boolean) description: 'The return of ' , aBLCActivation step task , ' must be boolean!'.
	aBLCActivation propertyAt: #branch put: bool
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> deployResult: aResult at: anEnvironmentSelector for: aBLCActivation [
	environment deploy: aResult at: anEnvironmentSelector
]

{ #category : #running }
FLWFlowRunner >> hasRunningActivations [
	^ self state ~= #Finished
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> informNonDeployableResult: aResult for: aBLCActivation [
	" pass "	
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> initialize [
	super initialize.
	debuggingMode := false
]

{ #category : #'environment resolutions' }
FLWFlowRunner >> resolveActor: aSymbol [
	^ environment at: aSymbol
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> resolveSelectorToExecuteOn: responsible for: aStep [
	^ responsible
		flwResolveSelector:
			(FLWSelector new
				task: aStep task;
				deployment: aStep deployment;
				yourself)
]

{ #category : #running }
FLWFlowRunner >> run [
	self subclassResponsibility 
]

{ #category : #running }
FLWFlowRunner >> run: aProcess [
	^ self run: aProcess workflow on: aProcess runtime
]

{ #category : #running }
FLWFlowRunner >> run: aWorkflow on: anEnvironment [
	environment := anEnvironment.
	workflow := aWorkflow.
	frame := workflow executeInNewFrame.
	self run.
]

{ #category : #visitor }
FLWFlowRunner >> runActivation: anActivation [
	^ anActivation step run: anActivation on: self
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> runCreationRequestStep: aBLCTaskCreationRequestStep on: aBLCActivation [
	| responsible input task |
	" a creation request may use information from the running environment, including previous executions. Surely it does not need to modify any state  "
	responsible := environment resolveActor: aBLCTaskCreationRequestStep responsible.
	input := environment resolveReadonlyBound: aBLCTaskCreationRequestStep input.
	task := self resolveSelectorToExecuteOn: responsible for: aBLCTaskCreationRequestStep.
	self beforeExecution: task for: responsible.
	self deployResult: (responsible perform: task withArguments: input) at: aBLCTaskCreationRequestStep output for: aBLCActivation.
	self afterExecution: task for: responsible
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> runDecisionRequestStep: aBLCTaskDecisionRequestStep on: aBLCActivation [
	| responsible input task |
	" a creation request may use information from the running environment, including previous executions. Surely it does not need to modify any state  "
	responsible := environment resolveActor: aBLCTaskDecisionRequestStep responsible.
	input := environment resolveReadonlyBound: aBLCTaskDecisionRequestStep input.
	task := self resolveSelectorToExecuteOn: responsible for: aBLCTaskDecisionRequestStep  .
	self beforeExecution: task for: responsible.
	self deployBranchingResult: (responsible perform: task withArguments: input) on: aBLCActivation.
	self afterExecution: task for: responsible
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> runNoResultRequestStep: aBLCTaskNoResultRequestStep on: aBLCActivation [
	| responsible input task |
	" a creation request may use information from the running environment, including previous executions. Surely it does not need to modify any state  "
	responsible := environment resolveActor: aBLCTaskNoResultRequestStep responsible.
	input := environment resolveReadonlyBound: aBLCTaskNoResultRequestStep input.
	task := self resolveSelectorToExecuteOn: responsible for: aBLCTaskNoResultRequestStep .
	self beforeExecution: task for: responsible.
	self informNonDeployableResult: (responsible perform: task withArguments: input) for: aBLCActivation.
	self afterExecution: task for: responsible. 
]

{ #category : #'as yet unclassified' }
FLWFlowRunner >> runTransformingRequestStep: aBLCTaskTransformingRequestStep on: aBLCActivation [
	| responsible input task |
	" a creation request may use information from the running environment, including previous executions. Surely it does not need to modify any state  "
	responsible := environment resolveActor: aBLCTaskTransformingRequestStep responsible.
	input := environment resolveTransformingBound: aBLCTaskTransformingRequestStep input.
	task := self resolveSelectorToExecuteOn: responsible for: aBLCTaskTransformingRequestStep.
	self beforeExecution: task for: responsible.
	self deployResult: (responsible perform: task withArguments: input) at: aBLCTaskTransformingRequestStep output for: aBLCActivation.
	self afterExecution: task for: responsible.
]

{ #category : #visitor }
FLWFlowRunner >> state [
	^ frame workList running ifEmpty: [ #Finished ] ifNotEmpty: [ frame workList running first step ]
]
