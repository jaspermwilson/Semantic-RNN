function model = initModel

model.nrItems = 8;
model.nrRepsItems = 8; 
model.nrRelations = 4; 
model.nrAttributes = 36;
model.nrRepsAttributes = 36;
model.nrHiddens = 12; 
model.nrContexts = model.nrHiddens;
model.nrOutputs = 1;

% Randomization of weights set to (-1,1) to minimize possibility of domination
model.outputWeights = -1+2*rand(model.nrOutputs, model.nrHiddens); 
model.rels_hiddenWeights = -1+2*rand(model.nrHiddens,model.nrRelations); 
model.repsItems_hiddenWeights = -1+2*rand(model.nrHiddens,model.nrRepsItems); 
model.items_repsItemsWeights = -1+2*rand(model.nrRepsItems, model.nrItems); 
model.repsAttributes_hiddenWeights = -1+2*rand(model.nrHiddens,model.nrRepsAttributes); 
model.attributes_repsAttributesWeights = -1+2*rand(model.nrRepsAttributes,model.nrAttributes);
model.contexts_hiddenWeights = -1+2*rand(model.nrHiddens, model.nrContexts);

model.biasOutput = -1+2*rand(model.nrOutputs,1); 
model.biasHidden = -1+2*rand(model.nrHiddens,1); 
model.biasRepsItems = -1+2*rand(model.nrRepsItems,1); 
model.biasRepsAttributes = -1+2*rand(model.nrRepsAttributes,1);

end
