Class {
	#name : #FLWWorkFlowBuildingExperiment2Test,
	#superclass : #FLWWorkFlowTests,
	#category : #'RunnableWorkflow-Tests'
}

{ #category : #running }
FLWWorkFlowBuildingExperiment2Test >> setUp [
	super setUp.	
	FLWContractingFlowConfigurator new doConfigureExperiment: workflow .
	
]

{ #category : #running }
FLWWorkFlowBuildingExperiment2Test >> testWorkflow [
]
