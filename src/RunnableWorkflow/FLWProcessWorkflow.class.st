Class {
	#name : #FLWProcessWorkflow,
	#superclass : #WfWorkflow,
	#category : #'RunnableWorkflow-Kernel'
}

{ #category : #UID }
FLWProcessWorkflow >> id [
	^ self hash
]

{ #category : #'creation - experiment 2' }
FLWProcessWorkflow >> newCreationStep [
	^ self newStepOfClass: FLWCreationRequestStep
]

{ #category : #convenience }
FLWProcessWorkflow >> newDecisionStep [
	^ self newStepOfClass: FLWDecisionRequestStep
]

{ #category : #convenience }
FLWProcessWorkflow >> newResultlessRequest [
	^ self newStepOfClass: FLWNoResultRequestStep 
]

{ #category : #convenience }
FLWProcessWorkflow >> newTransformingStep [
	^ self newStepOfClass: FLWTransformingRequestStep
]

{ #category : #accessing }
FLWProcessWorkflow >> steps [
	^ steps flatCollect: [ :s | {s} , (s outgoingEdges collect: [ :a | a to ]) ]
]
