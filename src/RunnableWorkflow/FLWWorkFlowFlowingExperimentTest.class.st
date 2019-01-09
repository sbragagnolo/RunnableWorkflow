Class {
	#name : #FLWWorkFlowFlowingExperimentTest,
	#superclass : #FLWWorkFlowTests,
	#category : #'RunnableWorkflow-Tests'
}

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> setUp [
	super setUp.	
	FLWContractingFlowConfigurator new doConfigureExperiment: workflow .
]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testAfterRequireGrantThereIsFinished [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self go.
	self go.
	self go. 
	self takeYesBranch .
	self go.
	self go.
	self go.
	self assert: frame workList runningSteps size equals: 0.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testContractAcceptanceFalseAfterRejection [
	self startSession.
	self go.
	self go.
	self takeNoBranch .
	self go.
	self go.
	
	self assert: frame workList runningSteps size equals: 0.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testContractAcceptanceFalseGoesToRejection [
	self startSession.
	self go.
	self go.
	self takeNoBranch .
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #Customer.
	self assert: frame workList runningSteps first task equals: #RejectsContract.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testContractAcceptanceTrueGoesToSecondPhase [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #Customer.
	self assert: frame workList runningSteps first task equals: #SignContract.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testCreationContractGoesToContractAcceptance [
	self startSession.
	self go.
	self go.
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #Customer.
	self assert: frame workList runningSteps first task equals: #IfAcceptsContract.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testRequiresContractGoesToCreationContract [
	self startSession.
	self go.
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #ContractManager.
	self assert: frame workList runningSteps first task equals: #CreateContract.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testSecondPhaseAsksForPayment [
	self startSession.
	self go.
	self go.
	self takeYesBranch.
	self go.
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #PaymentManager.
	self assert: frame workList runningSteps first task equals: #BillCustomer
]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testSecondPhasePayment [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self go.
	self go.
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #Customer.
	self assert: frame workList runningSteps first task equals: #Pay.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testSecondPhasePaymentArrivesToAcceptance [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self go.
	self go.
	self go. 
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #PaymentManager.
	self assert: frame workList runningSteps first task equals: #IfAcceptsPayment.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testSecondPhasePaymentArrivesToAcceptanceIfFalseGoesRejectPayment [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self go.
	self go.
	self go. 
	self takeNoBranch .
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #PaymentManager.
	self assert: frame workList runningSteps first task equals: #RejectPayment.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testSecondPhasePaymentArrivesToAcceptanceIfTrueRequiresActivation [
	self startSession.
	self go.
	self go.
	self takeYesBranch .
	self go.
	self go.
	self go. 
	self takeYesBranch .
	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #PaymentManager.
	self assert: frame workList runningSteps first task equals: #RequireGrantAccessService.

]

{ #category : #running }
FLWWorkFlowFlowingExperimentTest >> testStartsRequiringContract [
	self startSession.

	self assert: frame workList runningSteps size equals: 1.
	self assert: frame workList runningSteps first responsible equals: #Customer.
	self assert: frame workList runningSteps first task equals: #RequiresService.

]
