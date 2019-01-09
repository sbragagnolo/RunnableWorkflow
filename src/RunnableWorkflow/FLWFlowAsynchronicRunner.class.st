Class {
	#name : #FLWFlowAsynchronicRunner,
	#superclass : #FLWFlowRunner,
	#category : #'RunnableWorkflow-Runner'
}

{ #category : #running }
FLWFlowAsynchronicRunner >> continue [
	self hasRunningActivations
		ifTrue: [ frame workList running first acceptRunner: self ]
]

{ #category : #running }
FLWFlowAsynchronicRunner >> deployBranchingResult: aResult on: aBLCActivation [
	aResult
		onSuccessDo: [ :value | 
			super deployBranchingResult: value on: aBLCActivation.
			aBLCActivation complete.
			self continue ];
		onFailureDo: [ :fail | fail pass ]
]

{ #category : #running }
FLWFlowAsynchronicRunner >> deployResult: aResult at: anEnvironmentSelector for: aBLCActivation [
	aResult
		onSuccessDo: [ :value | 
			super deployResult: value at: anEnvironmentSelector for: aBLCActivation.
			aBLCActivation complete.
			self continue ];
		onFailureDo: [ :fail | fail pass ]
]

{ #category : #running }
FLWFlowAsynchronicRunner >> informNonDeployableResult: aResult for: aBLCActivation [
	aResult
		onSuccessDo: [ :value | 
			aBLCActivation complete.
			super informNonDeployableResult: value for: aBLCActivation.
			self continue ];
		onFailureDo: [ :fail | fail pass ]
]

{ #category : #running }
FLWFlowAsynchronicRunner >> run [ 
	self continue
]
