Class {
	#name : #FLWFlowSynchronicRunner,
	#superclass : #FLWFlowRunner,
	#category : #'RunnableWorkflow-Runner'
}

{ #category : #running }
FLWFlowSynchronicRunner >> run [
	[ self hasRunningActivations ] whileTrue: [ frame workList running do: [ :r | r acceptRunner: self ] ]
]

{ #category : #'as yet unclassified' }
FLWFlowSynchronicRunner >> runActivation: aBLCActivation [
	| result |
	result := super runActivation: aBLCActivation.
	aBLCActivation complete.
	^ result
]
