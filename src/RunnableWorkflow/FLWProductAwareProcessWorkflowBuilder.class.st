Class {
	#name : #FLWProductAwareProcessWorkflowBuilder,
	#superclass : #Object,
	#instVars : [
		'steps',
		'workflow',
		'start',
		'task',
		'input',
		'responsible'
	],
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #construction }
FLWProductAwareProcessWorkflowBuilder class >> on: aWfBlockChainWorkflow [
	^ self new
		workflow: aWfBlockChainWorkflow;
		yourself
]

{ #category : #adding }
FLWProductAwareProcessWorkflowBuilder >> addStep: step [
	self previousStep addOutgoingEdgeFor: step.
	steps add: step.
	^ step
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> build [
	^ workflow
]

{ #category : #branching }
FLWProductAwareProcessWorkflowBuilder >> generateBranchFor: aBlock at: aBranchingPoint [
	| builder |
	builder := self class new.
	builder start: aBranchingPoint.
	builder workflow: workflow.
	aBlock value: builder.
	^ builder steps first
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> initialize [
	super initialize.
	steps := OrderedCollection new.

]

{ #category : #creating }
FLWProductAwareProcessWorkflowBuilder >> newStepOfClass: aClass [
	^ workflow newStepOfClass: aClass
]

{ #category : #building }
FLWProductAwareProcessWorkflowBuilder >> nextPutStepNamed: aString [
	| step |
	step := workflow newStepNamed: aString.
	self addStep: step.
	^ step
]

{ #category : #building }
FLWProductAwareProcessWorkflowBuilder >> previousStep [
	^ steps ifEmpty: [ self start ] ifNotEmpty: [ steps last ]
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> start [
	^ start ifNil: [ start := workflow start ]
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> start: aStartStep [
	start ifNotNil: [ self error: 'There is already a start value ' ].
	start := aStartStep 
]

{ #category : #convenience }
FLWProductAwareProcessWorkflowBuilder >> startingWith: anActorSelector with: anInputSelector by: aTaskSelector producing: aResultSelector [ 
	^ self then: anActorSelector with: anInputSelector does: aTaskSelector producing: aResultSelector 
	

]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> steps [
	^ steps
]

{ #category : #convenience }
FLWProductAwareProcessWorkflowBuilder >> then: anActor with: anInputSelector decides: aDivergingStepName ifTrue: aNameOrBlockForTrue ifFalse: aNameOrBlockForFalse [
	| branchPoint trueBranch falseBranch library |
	branchPoint := workflow newDecisionStep.
	branchPoint
		responsible: anActor;
		input: anInputSelector;
		task: aDivergingStepName.
	self addStep: branchPoint.
	trueBranch := self generateBranchFor: aNameOrBlockForTrue at: branchPoint.
	falseBranch := self generateBranchFor: aNameOrBlockForFalse at: branchPoint.
	library := WfWorkflowLibrary new.
	branchPoint atOutgoingEdgeFor: trueBranch putCondition: (library branchConditionWithValue: true).
	branchPoint atOutgoingEdgeFor: falseBranch putCondition: (library branchConditionWithValue: false).
	^ workflow
]

{ #category : #convenience }
FLWProductAwareProcessWorkflowBuilder >> then:  anActorSelector with: anInputSelector does: aTaskSelector [
	| step |
	step := workflow newResultlessRequest.
	step responsible: anActorSelector.
	step input: anInputSelector.
	step task: aTaskSelector.
	self addStep: step.
	^ step
]

{ #category : #'as yet unclassified' }
FLWProductAwareProcessWorkflowBuilder >> then: anActorSelector with: anInputSelector does: aTaskSelector producing: aResultSelector [
	| step |
	step := workflow newCreationStep.
	step responsible: anActorSelector.
	step input: anInputSelector.
	step task: aTaskSelector.
	step output: aResultSelector.
	self addStep: step.
	^ step
]

{ #category : #convenience }
FLWProductAwareProcessWorkflowBuilder >> then: anActorSelector with: anInputSelector does: aTaskSelector transformingInto: aResultSelector [ 
| step |
	step := workflow newTransformingStep.
	step responsible: anActorSelector.
	step input: anInputSelector.
	step task: aTaskSelector.
	step output: aResultSelector.
	self addStep: step.
	^ step
]

{ #category : #convenienc }
FLWProductAwareProcessWorkflowBuilder >> thenFinally: anActorSelector with: anInputSelector does: aTaskSelector [
	^ self then: anActorSelector with: anInputSelector does: aTaskSelector
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> workflow [
	^ workflow
]

{ #category : #accessing }
FLWProductAwareProcessWorkflowBuilder >> workflow: aWfBlockChainWorkflow [
	workflow := aWfBlockChainWorkflow.
]
