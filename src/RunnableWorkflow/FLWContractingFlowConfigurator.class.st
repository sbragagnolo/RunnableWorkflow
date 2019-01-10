Class {
	#name : #FLWContractingFlowConfigurator,
	#superclass : #Object,
	#category : #RunnableWorkflow
}

{ #category : #configuration }
FLWContractingFlowConfigurator class >> createSessionForExample [
	| session |
	FogCache reset.
	session := FogConnection createDefaultConnection session.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	^ session
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> customerData [
	^ {(#name -> 'Santiago Bragagnolo                            ').
	(#email -> 'santiagobragagnolo@gmail.com                     ')} asDictionary
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runEthereumExperiment2 [
	" self new runEthereumExperiment2 "

	<example>
	| process runner builder |
	process := FLWRunnableProcess forRegularUsage.
	builder := BLCEthereumDocumentBuilder new
		session: self createSessionForExample;
		yourself.
	process runtime
		actors:
			{(#Customer -> BLCCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process useContractBasedDocumentBuilder: builder.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runEthereumExperiment3 [
	" self new runEthereumExperiment3 "

	<example>
	| process runner builder |
	process := FLWRunnableProcess forRegularUsage.
	builder := BLCEthereumDocumentBuilder new
		session: self createSessionForExample;
		yourself.
	process runtime
		actors:
			{(#Customer -> BLCAutoCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process useContractBasedDocumentBuilder: builder.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runEthereumExperiment4 [
	" self new runEthereumExperiment4 "

	<example>
	| process runner builder |
	process := FLWRunnableProcess forRegularUsage.
	builder := BLCEthereumDocumentBuilder new
		session: self createSessionForExample;
		yourself.
	process runtime
		actors:
			{(#Customer -> BLCAutoRejectContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process useContractBasedDocumentBuilder: builder.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runEthereumExperiment5 [
	" self new runEthereumExperiment5 "

	<example>
	| process runner builder |
	process := FLWRunnableProcess forRegularUsage.
	builder := BLCEthereumDocumentBuilder new
		session: self createSessionForExample;
		yourself.
	process runtime
		actors:
			{(#Customer -> BLCAutBadPaymentContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process useContractBasedDocumentBuilder: builder.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runEthereumMagritteExperiment2 [
	" self new runExperiment2 "

	<example>
	| process runner builder |
	process := FLWRunnableProcess forRegularUsage.
	builder := BLCEthereumDocumentBuilder new
		session: self createSessionForExample;
		yourself.
	process runtime
		actors:
			{(#Customer -> BLCMagritteCustomer new).
			(#ContractManager -> BLCMagritteContractManager new).
			(#PaymentManager -> BLCMagrittePaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process useContractBasedDocumentBuilder: builder.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperiment2 [
	" self new runExperiment2 "

	<example>
	| process runner |
	process := FLWRunnableProcess forRegularUsage.
	process runtime
		actors:
			{(#Customer -> BLCCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperiment3 [
	" self new runExperiment3 "

	<example>
	| process runner |
	process := FLWRunnableProcess forRegularUsage.
	process runtime
		actors:
			{(#Customer -> BLCAutoCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperiment4 [
	" self new runExperiment4 "

	<example>
	| process runner |
	process := FLWRunnableProcess forRegularUsage.
	process runtime
		actors:
			{(#Customer -> BLCAutoRejectContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperiment5 [
	" self new runExperiment5 "

	<example>
	| process runner |
	process := FLWRunnableProcess forRegularUsage.
	process runtime
		actors:
			{(#Customer -> BLCAutBadPaymentContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperimentActor2 [
	" self new runExperimentActor2 "

	<example>
	| process runner |
	process := FLWRunnableProcess forActors.
	process runtime
		actors:
			{(#Customer -> BLCCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowAsynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperimentActor3 [
	" self new runExperimentActor3 "

	<example>
	| process runner |
	process := FLWRunnableProcess forActors.
	process runtime
		actors:
			{(#Customer -> BLCAutoCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowAsynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperimentActor4 [
	" self new runExperimentActor4 "

	<example>
	| process runner |
	process := FLWRunnableProcess forActors.
	process runtime
		actors:
			{(#Customer -> BLCAutoRejectContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowAsynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runExperimentActor5 [
	" self new runExperimentActor5 "

	<example>
	| process runner |
	process := FLWRunnableProcess forActors.
	process runtime
		actors:
			{(#Customer -> BLCAutBadPaymentContractCustomer new).
			(#ContractManager -> BLCContractManager new).
			(#PaymentManager -> BLCPaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowAsynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runMagritteActorExperiment2 [
	" self new runExperiment2 "

	<example>
	| process runner |
	process := FLWRunnableProcess forActors.
	process runtime
		actors:
			{(#Customer -> BLCMagritteCustomer new).
			(#ContractManager -> BLCMagritteContractManager new).
			(#PaymentManager -> BLCMagrittePaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowAsynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator class >> runMagritteExperiment2 [
	" self new runExperiment2 "

	<example>
	| process runner |
	process := FLWRunnableProcess forRegularUsage.
	process runtime
		actors:
			{(#Customer -> BLCMagritteCustomer new).
			(#ContractManager -> BLCMagritteContractManager new).
			(#PaymentManager -> BLCMagrittePaymentManager new).
			(#ServiceManager -> BLCServiceManager new)} asDictionary.
	process workflow: self new experimentProcessFlow.
	process runtime deploy: self customerData at: #CustomerData.
	runner := FLWFlowSynchronicRunner new.
	runner run: process
]

{ #category : #configuration }
FLWContractingFlowConfigurator >> doConfigureExperiment: aWorkflow [
	| builder |
	builder := FLWProductAwareProcessWorkflowBuilder on: aWorkflow.
	
	builder startingWith: #Customer with: #CustomerData by: #RequiresService producing: #OrderOfService;
	then: #ContractManager with: #OrderOfService does: #CreateContract producing: #UnsignedContract;
	then: #Customer with: #UnsignedContract decides: #IfAcceptsContract 
		ifTrue: [ : ifAcceptsContract |
			ifAcceptsContract then: #Customer with: #UnsignedContract does: #SignContract transformingInto: #SignedContract;
								  then: #PaymentManager with: #SignedContract does: #BillCustomer producing: #Invoice;
								  then: #Customer with:#Invoice does: #Pay producing: #PaymentNote;
								  then: #PaymentManager with: #PaymentNote decides: #IfAcceptsPayment 
									ifTrue: [ : ifAcceptsPayment | 
											ifAcceptsPayment then: #PaymentManager with: #PaymentNote does: #RequireGrantAccessService producing: #OrderOfServiceGranting;
												  then: #ServiceManager with: #OrderOfServiceGranting does: #GrantAccess producing: #GrantAccessReferral;
												  thenFinally: #Customer with: #GrantAccessReferral does: #NoteAccessGrant. 
									]ifFalse: [ :ifRejectsPayment | 
											ifRejectsPayment then: #PaymentManager with: #PaymentNote does: #RejectPayment producing: #RejectPaymentReferral;
													thenFinally: #Customer with: #RejectPaymentReferral does: #NotePaymentReject
				 					] 
	   ] ifFalse: [ : ifRejectsContract | 
			ifRejectsContract then: #Customer with: #UnsignedContract does: #RejectsContract producing: #RejectContractReferral; 
					thenFinally: #ContractManager with: #RejectContractReferral does: #NoteContractReject.
	
	].
	
]

{ #category : #configuration }
FLWContractingFlowConfigurator >> experimentProcessFlow [
	| flow |
	flow := FLWProcessWorkflow new.
	self doConfigureExperiment: flow.
	^ flow
]
