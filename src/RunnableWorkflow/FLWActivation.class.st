Class {
	#name : #FLWActivation,
	#superclass : #WfActivation,
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #visitor }
FLWActivation >> acceptRunner: aBLCRunner [ 
	^ aBLCRunner runActivation: self 
]

{ #category : #accessing }
FLWActivation >> result [
	^ self propertyAt: #result 
]

{ #category : #convenicence }
FLWActivation >> result: aResult [
	self propertyAt: #result put: aResult
]

{ #category : #accessing }
FLWActivation >> task [
	self shouldBeImplemented.
]
