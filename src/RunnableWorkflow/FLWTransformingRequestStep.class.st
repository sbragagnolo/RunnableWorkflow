Class {
	#name : #FLWTransformingRequestStep,
	#superclass : #FLWCreationRequestStep,
	#category : #'RunnableWorkflow-Tasks'
}

{ #category : #visiting }
FLWTransformingRequestStep >> run: anActivation on: aBLCRunner [
	^ aBLCRunner runTransformingRequestStep: self on: anActivation
]
