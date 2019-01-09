Class {
	#name : #FLWCreationRequestStep,
	#superclass : #FLWStep,
	#instVars : [
		'output'
	],
	#category : #'RunnableWorkflow-Tasks'
}

{ #category : #accessing }
FLWCreationRequestStep >> output [
	^ output
]

{ #category : #accessing }
FLWCreationRequestStep >> output: aString [ 
	output := aString asSymbol 
]

{ #category : #visiting }
FLWCreationRequestStep >> run: anActivation on: aBLCRunner [
	aBLCRunner runCreationRequestStep: self on: anActivation 
]
