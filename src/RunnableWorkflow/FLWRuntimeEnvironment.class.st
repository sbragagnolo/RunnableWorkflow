Class {
	#name : #FLWRuntimeEnvironment,
	#superclass : #Object,
	#instVars : [
		'variables',
		'roles'
	],
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #initialization }
FLWRuntimeEnvironment >> actors: aDictionary [
	aDictionary keysAndValuesDo: [ :k :v | self deployActor: v forRole: k ]
]

{ #category : #deploying }
FLWRuntimeEnvironment >> deploy: aCollection at: aString [
	self flag: #WeShouldHaveItemsWithAuditory.
	" Like timestamp, workflow id, etc "
	variables at: aString put: aCollection
]

{ #category : #deploying }
FLWRuntimeEnvironment >> deployActor: anActor forRole: aRole [
	roles  at: aRole put: anActor
]

{ #category : #initialization }
FLWRuntimeEnvironment >> initialize [
	super initialize.
	variables := Dictionary new.
	roles := Dictionary new.
]

{ #category : #initialization }
FLWRuntimeEnvironment >> resolveActor: aSelector [
	^ roles at: aSelector
]

{ #category : #accessing }
FLWRuntimeEnvironment >> resolveReadonlyBound: aSelectorOrCollection [
	| symbols |
	symbols := aSelectorOrCollection isSymbol
		ifTrue: [ {aSelectorOrCollection} ]
		ifFalse: [ aSelectorOrCollection ].
	^ symbols collect: [ :s | variables at: s ifAbsent: [ roles at: s ifAbsent: [ self error: ' Invalid selector ' , s asString ] ] ]
]

{ #category : #resolving }
FLWRuntimeEnvironment >> resolveTransformingBound: aSelectorOrCollection [
	| symbols |
	symbols := aSelectorOrCollection isSymbol
		ifTrue: [ {aSelectorOrCollection} ]
		ifFalse: [ aSelectorOrCollection ].
	^ symbols collect: [ :s | (variables at: s ifAbsent: [ self error: ' Invalid selector ' , s asString ]) copy ]
]

{ #category : #accessors }
FLWRuntimeEnvironment >> roles [
	^ roles
]

{ #category : #initialization }
FLWRuntimeEnvironment >> useContractBasedDocumentBuilder: builder [
	roles valuesDo: [ :actor | actor useContractBasedDocumentBuilder: builder ]
]
