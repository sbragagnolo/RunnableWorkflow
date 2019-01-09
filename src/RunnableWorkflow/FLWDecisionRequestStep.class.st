Class {
	#name : #FLWDecisionRequestStep,
	#superclass : #FLWStep,
	#category : #'RunnableWorkflow-Tasks'
}

{ #category : #'as yet unclassified' }
FLWDecisionRequestStep >> output [
	^ #branch
]

{ #category : #'as yet unclassified' }
FLWDecisionRequestStep >> run: anActivation on: aBLCRunner [
	^ aBLCRunner runDecisionRequestStep: self on: anActivation
]
