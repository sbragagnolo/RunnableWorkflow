Class {
	#name : #FLWContractingFlowConfigurator,
	#superclass : #Object,
	#category : #'RunnableWorkflow-Tests'
}

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
