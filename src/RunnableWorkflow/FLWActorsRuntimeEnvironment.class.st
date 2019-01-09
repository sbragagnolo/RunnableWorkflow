Class {
	#name : #FLWActorsRuntimeEnvironment,
	#superclass : #FLWRuntimeEnvironment,
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #initialization }
FLWActorsRuntimeEnvironment >> deployActor: anActor forRole: aRole [
	super deployActor: anActor uiactor forRole: aRole 
]
