"
The task is a step in the workflow. It differs with a regular step on the fact that is able to fetch an executable object (message)
"
Class {
	#name : #FLWStep,
	#superclass : #WfStep,
	#instVars : [
		'input',
		'task',
		'responsible',
		'deployment'
	],
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #accessing }
FLWStep >> deployment [
	^ deployment ifNil: [ deployment := #default ]
]

{ #category : #accessing }
FLWStep >> input [
	^ input
]

{ #category : #accessing }
FLWStep >> input: aString [
	input := aString
]

{ #category : #accessing }
FLWStep >> name [
	^ self printString
]

{ #category : #accessing }
FLWStep >> parameters [
	^ input
]

{ #category : #accessing }
FLWStep >> responsible [
	^ responsible
]

{ #category : #accessing }
FLWStep >> responsible: aString [ 
	responsible := aString asSymbol
	
]

{ #category : #accessing }
FLWStep >> run: anActivation on: aBLCRunner [
	self subclassResponsibility
]

{ #category : #accesisng }
FLWStep >> task [
	^ task
]

{ #category : #accessing }
FLWStep >> task: aString [ 
	task := aString asSymbol
]

{ #category : #accessing }
FLWStep >> text [
	^ ' BLCTask. Inspect if you need data :) '
]
