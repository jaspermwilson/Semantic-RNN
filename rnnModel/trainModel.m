function [model, results] = trainModel(nrEpochs, lr)

% Loading model and data
model = initModel;
load semdata.mat

% Initializing error vectors
results.SSE = zeros(1,nrEpochs);
error = zeros(1,length(semdata.output));

% Initializing repsActs matrix cell
results.repsActs = cell(2,3);
k = 1;

% Setting the learning rate if not specified
if exist('lr','var') == 0
    lr = 0.01; 
end

for E = 1:nrEpochs
    
    for i = 1:length(semdata.output)
        
        % Forward pass computation for all times
        [error(i),outputActs,hiddenActs3,hiddenActs2,hiddenActs1,repsItemsActs,repsAttributesActs]=...
        forwardPass(model,semdata.items(:,i),semdata.relations(:,i),semdata.attributes(:,i),semdata.output(i));
                            
        % Backprop; the derivative of tanh(x) is 1-tanh^2(x)
        delta_h2o = (2*error(i).*outputActs.*(1-outputActs))*hiddenActs3';
       
        grad = (model.outputWeights'*(2*error(i)).*outputActs.*(1-outputActs));       
        
        delta_ar2h = grad.*(1-hiddenActs3.^2)*repsAttributesActs';
        
        delta_rel2h = (model.contexts_hiddenWeights'*(grad.*(1-hiddenActs3.^2))...
                      .*(1-hiddenActs2.^2))*semdata.relations(:,i)';

        delta_ir2h = (model.contexts_hiddenWeights'*(model.contexts_hiddenWeights'*(grad.*...
                     (1-hiddenActs3.^2)).*(1-hiddenActs2.^2)).*(1-hiddenActs1.^2))*repsItemsActs';

        delta_a2ar = (model.repsAttributes_hiddenWeights'*(grad.*(1-hiddenActs3.^2)).*...
                     (1-repsAttributesActs.^2))*semdata.attributes(:,i)';
                 
        delta_i2ir = (model.repsItems_hiddenWeights'*(model.contexts_hiddenWeights'*...
                     (model.contexts_hiddenWeights'*(grad.*(1-hiddenActs3.^2)).*(1-hiddenActs2.^2)).*...
                     (1-hiddenActs1.^2)).*(1-repsItemsActs.^2))*semdata.items(:,i)';
                 
        delta_c2h = (grad.*(1-hiddenActs3.^2))*hiddenActs2'+(model.contexts_hiddenWeights'*(grad.*...
                    (1-hiddenActs3.^2)).*(1-hiddenActs2.^2))*hiddenActs1'+ (model.contexts_hiddenWeights'*...
                    ((model.contexts_hiddenWeights'*(grad.*(1-hiddenActs3.^2))).*...
                    (1-hiddenActs2.^2)).*(1-hiddenActs1.^2))*(0.5*ones(model.nrContexts,1))';
               
        delta_bh = (grad.*(1-hiddenActs3.^2))+(model.contexts_hiddenWeights'*(grad.*...
                   (1-hiddenActs3.^2)).*(1-hiddenActs2.^2))+(model.contexts_hiddenWeights'*...
                   ((model.contexts_hiddenWeights'*(grad.*(1-hiddenActs3.^2))).*...
                   (1-hiddenActs2.^2)).*(1-hiddenActs1.^2));
        
        % Updating weights 
        model.outputWeights = model.outputWeights-lr.*delta_h2o;
        
        model.repsItems_hiddenWeights = model.repsItems_hiddenWeights-lr.*delta_ir2h;
        
        model.repsAttributes_hiddenWeights = model.repsAttributes_hiddenWeights-lr.*delta_ar2h;
        
        model.rels_hiddenWeights = model.rels_hiddenWeights-lr.*delta_rel2h;
        
        model.items_repsItemsWeights = model.items_repsItemsWeights-lr.*delta_i2ir;
        
        model.attributes_repsAttributesWeights = model.attributes_repsAttributesWeights-lr.*delta_a2ar;
        
        model.contexts_hiddenWeights = model.contexts_hiddenWeights-lr.*delta_c2h;
        
        % Updating biases
        model.biasOutput = model.biasOutput - lr.*(2*error(i).*outputActs.*(1-outputActs));
        
        model.biasHidden = model.biasHidden - lr.*delta_bh;
        
        model.biasRepsItems = model.biasRepsItems-lr.*(model.repsItems_hiddenWeights'*...
                              (model.contexts_hiddenWeights'*(model.contexts_hiddenWeights'*...
                              (grad.*(1-hiddenActs3.^2)).*(1-hiddenActs2.^2)).*(1-hiddenActs1.^2)).*...
                              (1-repsItemsActs.^2));
                          
        model.biasRepsAttributes = model.biasRepsAttributes-lr.*(model.repsAttributes_hiddenWeights'*...
                                   (grad.*(1-hiddenActs3.^2)).*(1-repsAttributesActs.^2));
        
    end
    
    % Updating SSE vector
    results.SSE(E) = sum(error.^2);
    
    % Calculating activations at 250, 1000, & 2500 Epochs
    if E == 250 || E == 1000 || E == 2500
        
        results.repsActs{1,k} = logistic(model.items_repsItemsWeights*eye(8)+model.biasRepsItems);
        results.repsActs{2,k} = logistic(model.attributes_repsAttributesWeights*...
                                eye(36)+model.biasRepsAttributes);
        k = k+1;
        
    end
     
end
    
end

