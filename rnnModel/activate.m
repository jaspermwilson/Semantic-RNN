function [outputActs,hiddenActs,repsItemsActs,repsAttributesActs]=...
         activate(model,items,relations,attributes,contextActs)

% Logical multiplier used to cancel inputs when not needed in forward pass
repsItemsActs = (sum(items)~=0).*logistic(model.items_repsItemsWeights*items+model.biasRepsItems); 

repsAttributesActs = (sum(attributes)~=0).*logistic(model.attributes_repsAttributesWeights*...
                     attributes+model.biasRepsAttributes);

% Activation function tanh used to allow hiddenActs to be negative as well, (-1,1)
hiddenActs = tanh(model.repsItems_hiddenWeights*repsItemsActs+model.repsAttributes_hiddenWeights*...
             repsAttributesActs+model.rels_hiddenWeights*relations+model.contexts_hiddenWeights*...
             contextActs+model.biasHidden); 
         
outputActs = logistic(model.outputWeights*hiddenActs+model.biasOutput); 

end