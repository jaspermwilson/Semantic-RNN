function [error,outputActs,hiddenActs3,hiddenActs2,hiddenActs1,repsItemsActs,repsAttributesActs]=...
         forwardPass(model,items,relations,attributes,output)

% Initializing first context layer
initContext = 0.5*ones(model.nrContexts,1);

% Forward pass for each time
[~, hiddenActs1, repsItemsActs, ~] = activate(model,items,0*relations,0*attributes,initContext);

[~, hiddenActs2, ~, ~] = activate(model,0*items,relations,0*attributes,hiddenActs1);

[outputActs, hiddenActs3, ~, repsAttributesActs] = activate(model,0*items,0*relations,attributes,hiddenActs2);

% Basic difference error for backprop calculation
error = outputActs-output;

end