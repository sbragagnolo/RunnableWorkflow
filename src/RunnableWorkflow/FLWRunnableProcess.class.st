Class {
	#name : #FLWRunnableProcess,
	#superclass : #Object,
	#instVars : [
		'workflow',
		'runtime'
	],
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #'as yet unclassified' }
FLWRunnableProcess class >> forActors [
	^ self new
		runtime: FLWActorsRuntimeEnvironment new;
		yourself
]

{ #category : #'as yet unclassified' }
FLWRunnableProcess class >> forRegularUsage [
	^ self new
		runtime: FLWRuntimeEnvironment new;
		yourself
]

{ #category : #accessing }
FLWRunnableProcess >> runtime [
	^ runtime
]

{ #category : #accessing }
FLWRunnableProcess >> runtime: aFLWRuntimeEnvironment [ 
	runtime := aFLWRuntimeEnvironment
]

{ #category : #'documents builder' }
FLWRunnableProcess >> useContractBasedDocumentBuilder: aBLCDocumentBuilder [
	runtime roles valuesDo: [ :actor | actor useContractBasedDocumentBuilder: aBLCDocumentBuilder ]
]

{ #category : #accessing }
FLWRunnableProcess >> workflow [
	^ workflow
]

{ #category : #accessing }
FLWRunnableProcess >> workflow: aFLWProcessWorkflow [ 
	workflow := aFLWProcessWorkflow
]
