Class {
	#name : #FLWWorkFlowTests,
	#superclass : #TestCase,
	#instVars : [
		'workflow',
		'frame'
	],
	#category : #'RunnableWorkflow-Tests'
}

{ #category : #running }
FLWWorkFlowTests >> go [
	frame workList running first complete
]

{ #category : #running }
FLWWorkFlowTests >> setUp [
	super setUp.	
	workflow := FLWProcessWorkflow new.
]

{ #category : #running }
FLWWorkFlowTests >> startSession [
	frame := workflow executeInNewFrame
]

{ #category : #running }
FLWWorkFlowTests >> takeNoBranch [
	frame workList running first propertyAt: #branch put: false.
	self go
]

{ #category : #running }
FLWWorkFlowTests >> takeYesBranch [
	frame workList running first propertyAt: #branch put: true.
	self go
]
