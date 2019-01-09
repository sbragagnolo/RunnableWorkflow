Class {
	#name : #FLWMockedActor,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'RunnableWorkflow-Tests'
}

{ #category : #'as yet unclassified' }
FLWMockedActor >> blcResolveSelector: aSelector [
	^ aSelector = #CreatesContract
		ifTrue: [ #bla: ]
		ifFalse: [ #bla ]
]

{ #category : #'as yet unclassified' }
FLWMockedActor >> doesNotUnderstand: aMessage [
	messages add: aMessage.
	^ aMessage
]

{ #category : #initialization }
FLWMockedActor >> initialize [
	super initialize .
	messages := OrderedCollection new .
]

{ #category : #initialization }
FLWMockedActor >> messages [
	^ messages
]
