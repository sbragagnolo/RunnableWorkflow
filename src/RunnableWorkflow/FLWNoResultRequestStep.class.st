Class {
	#name : #FLWNoResultRequestStep,
	#superclass : #FLWStep,
	#category : #'RunnableWorkflow-Tasks'
}

{ #category : #visiting }
FLWNoResultRequestStep >> run: anActivation on: aBLCRunner [
	^ aBLCRunner runNoResultRequestStep: self on: anActivation
]
