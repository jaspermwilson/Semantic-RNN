%%

% Testing training for multiple lrs
[model_00001, results_00001] = trainModel(2500,0.00001);
[model_0001, results_0001] = trainModel(2500,0.0001);
[model_001, results_001] = trainModel(2500,0.001);
[model_005, results_005] = trainModel(2500,0.005);
[model_01, results_01] = trainModel(2500,0.01);
[model_05, results_05] = trainModel(2500,0.05);

% Graphing SSE for all models
figure(1)
plot(results_00001.SSE)
hold on
plot(results_0001.SSE)
plot(results_001.SSE)
plot(results_005.SSE)
plot(results_01.SSE)
plot(results_05.SSE)
title('SSE for models with varying learning rates');
xlabel('Epoch');
ylabel('SSE');
legend('0.00001','0.0001','0.001','0.005','0.01','0.05');
hold off

%%

% Choosing the best model to analyze
model = model_01; results = results_01;

%%

% Graphing the evolution of SSE
figure(2)
plot(results.SSE)
hold on
ylabel('SSE')
xlabel('Epoch')
title('Evolution of SSE during RNN training for lr = 0.01')
hold off

%%

% Setting the repsItems matrices
repsItems_250 = results.repsActs{1,1};
repsItems_1000 = results.repsActs{1,2};
repsItems_2500 = results.repsActs{1,3};

% Making the repsItems bar graphs
load semantic_data_text.mat

figure(3)
% row 1
subplot(8,3,1); bar(repsItems_250(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 250'); ylabel([semitems{1}]);
subplot(8,3,2); bar(repsItems_1000(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 1000');
subplot(8,3,3); bar(repsItems_2500(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 2500');

% rows 2-8
l = 2;
for i = 6:3:24
    
    subplot(8,3,i-2); bar(repsItems_250(:,l)); set(gca,'XTick',[], 'YTick', []); ylabel([semitems{l}]);
    subplot(8,3,i-1); bar(repsItems_1000(:,l)); set(gca,'XTick',[], 'YTick', []);
    subplot(8,3,i); bar(repsItems_2500(:,l)); set(gca,'XTick',[], 'YTick', []);
    l = l+1;
    
end
hold off

%%

% Setting the repsAttributes matrices
repsAttributes_250 = results.repsActs{2,1};
repsAttributes_1000 = results.repsActs{2,2};
repsAttributes_2500 = results.repsActs{2,3};

% Making the repsAttributes bar graph for repsAttributes 1-15 (IS A)
load semantic_data_text.mat

figure(4)
% row 1
subplot(15,3,1); bar(repsAttributes_250(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 250'); ylabel([semattributes{1}]);
subplot(15,3,2); bar(repsAttributes_1000(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 1000');
subplot(15,3,3); bar(repsAttributes_2500(:,1)); set(gca,'XTick',[], 'YTick', []); title('Epoch 2500');

% rows 2-15
j = 2;
for i = 6:3:45
    
    subplot(15,3,i-2); bar(repsAttributes_250(:,j)); set(gca,'XTick',[], 'YTick', []); ylabel([semattributes{j}]);
    subplot(15,3,i-1); bar(repsAttributes_1000(:,j)); set(gca,'XTick',[], 'YTick', []);
    subplot(15,3,i); bar(repsAttributes_2500(:,j)); set(gca,'XTick',[], 'YTick', []);
    j = j+1;
    
end
hold off

% Making the repsAttributes bar graph for repsAttributes 16-21 (IS)

figure(5)
% row 16
subplot(5,3,1); bar(repsAttributes_250(:,16)); set(gca,'XTick',[], 'YTick', []); title('Epoch 250'); ylabel([semattributes{16}]);
subplot(5,3,2); bar(repsAttributes_1000(:,16)); set(gca,'XTick',[], 'YTick', []); title('Epoch 1000');
subplot(5,3,3); bar(repsAttributes_2500(:,16)); set(gca,'XTick',[], 'YTick', []); title('Epoch 2500');

% rows 17-21
j = 17;
for i = 6:3:15
    
    subplot(5,3,i-2); bar(repsAttributes_250(:,j)); set(gca,'XTick',[], 'YTick', []); ylabel([semattributes{j}]);
    subplot(5,3,i-1); bar(repsAttributes_1000(:,j)); set(gca,'XTick',[], 'YTick', []);
    subplot(5,3,i); bar(repsAttributes_2500(:,j)); set(gca,'XTick',[], 'YTick', []);
    j = j+1;
    
end
hold off

% Making the repsAttributes bar graph for repsAttributes 22-26 (CAN)

figure(6)
% row 22
subplot(4,3,1); bar(repsAttributes_250(:,22)); set(gca,'XTick',[], 'YTick', []); title('Epoch 250'); ylabel([semattributes{22}]);
subplot(4,3,2); bar(repsAttributes_1000(:,22)); set(gca,'XTick',[], 'YTick', []); title('Epoch 1000');
subplot(4,3,3); bar(repsAttributes_2500(:,22)); set(gca,'XTick',[], 'YTick', []); title('Epoch 2500');

% rows 23-26
j = 23;
for i = 6:3:12
    
    subplot(4,3,i-2); bar(repsAttributes_250(:,j)); set(gca,'XTick',[], 'YTick', []); ylabel([semattributes{j}]);
    subplot(4,3,i-1); bar(repsAttributes_1000(:,j)); set(gca,'XTick',[], 'YTick', []);
    subplot(4,3,i); bar(repsAttributes_2500(:,j)); set(gca,'XTick',[], 'YTick', []);
    j = j+1;
    
end
hold off

% Making the repsAttributes bar graph for repsAttributes 27-36 (HAS)

figure(7)
% row 27
subplot(9,3,1); bar(repsAttributes_250(:,27)); set(gca,'XTick',[], 'YTick', []); title('Epoch 250'); ylabel([semattributes{27}]);
subplot(9,3,2); bar(repsAttributes_1000(:,27)); set(gca,'XTick',[], 'YTick', []); title('Epoch 1000');
subplot(9,3,3); bar(repsAttributes_2500(:,27)); set(gca,'XTick',[], 'YTick', []); title('Epoch 2500');

% rows 28-36
j = 28;
for i = 6:3:27
    
    subplot(9,3,i-2); bar(repsAttributes_250(:,j)); set(gca,'XTick',[], 'YTick', []); ylabel([semattributes{j}]);
    subplot(9,3,i-1); bar(repsAttributes_1000(:,j)); set(gca,'XTick',[], 'YTick', []);
    subplot(9,3,i); bar(repsAttributes_2500(:,j)); set(gca,'XTick',[], 'YTick', []);
    j = j+1;
    
end
hold off

%%

% PCA for repsItems
scorei_250 = pca(repsItems_250);
scorei_1000 = pca(repsItems_1000);
scorei_2500 = pca(repsItems_2500);

% Graphing for each Epoch stage
figure(8)
scatter(scorei_250(:,1),scorei_250(:,2),'fill');
hold on
labelpoints(scorei_250(:,1),scorei_250(:,2),semitems,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for item representations at 250 epochs');
hold off

figure(9)
scatter(scorei_1000(:,1),scorei_1000(:,2),'fill');
hold on
labelpoints(scorei_1000(:,1),scorei_1000(:,2),semitems,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for item representations at 1000 epochs');
hold off

figure(10)
scatter(scorei_2500(:,1),scorei_2500(:,2),'fill');
labelpoints(scorei_2500(:,1),scorei_2500(:,2),semitems,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for item representations at 2500 epochs');
hold off

%%

% PCA for repsAttributes
scorea_250 = pca(repsAttributes_250);
scorea_1000 = pca(repsAttributes_1000);
scorea_2500 = pca(repsAttributes_2500);

% Graphing for each Epoch stage
figure(11)
scatter(scorea_250(:,1),scorea_250(:,2),'fill');
hold on
labelpoints(scorea_250(:,1),scorea_250(:,2),semattributes,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for attribute representations at 250 epochs');
hold off

figure(12)
scatter(scorea_1000(:,1),scorea_1000(:,2),'fill');
hold on
labelpoints(scorea_1000(:,1),scorea_1000(:,2),semattributes,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for attribute representations at 1000 epochs');
hold off

figure(13)
scatter(scorea_2500(:,1),scorea_2500(:,2),'fill');
hold on
labelpoints(scorea_2500(:,1),scorea_2500(:,2),semattributes,'N',0.05);
xlabel('First component');
ylabel('Second component');
title('PCA for attribute representations at 2500 epochs');
hold off

%%

% Evaluating change of activation for increasing noise for different weights
load semdata.mat
model_itemless = model;
model_attributeless = model;
model_neither = model;
mean = 0;
idxs = [695 727 791 823 900];
noises = [0,1,2,3,4,5,6];
idxs_string = ["Canary can grow?", "Canary can move?", "Canary can fly?", "Canary can sing?", "Pine has leaves?"];
for k = 1:5
    for j = 1:7
        total_itemless = 0;
        total_attributeless = 0;
        noise = noises(j);
        for i = 1:100
            %itemless
            model_itemless.items_repsItemsWeights = model.items_repsItemsWeights+normrnd(mean, noise, size(model.items_repsItemsWeights));
            
            [error,outputActs,hiddenActs3,hiddenActs2,hiddenActs1,repsItemsActs,repsAttributesActs]=...
            forwardPass(model_itemless,semdata.items(:,idxs(k)),semdata.relations(:,idxs(k)),semdata.attributes(:,idxs(k)),semdata.output(idxs(k)));
            total_itemless = total_itemless + outputActs;
            
            %attributeless
            model_attributeless.attributes_repsAttributesWeights = model.attributes_repsAttributesWeights+normrnd(mean,noise,size(model.attributes_repsAttributesWeights));
            
            [error,outputActs,hiddenActs3,hiddenActs2,hiddenActs1,repsItemsActs,repsAttributesActs]=...
            forwardPass(model_attributeless,semdata.items(:,idxs(k)),semdata.relations(:,idxs(k)),semdata.attributes(:,idxs(k)),semdata.output(idxs(k)));
            total_attributeless = total_attributeless + outputActs;
            
        end
        mean_total_itemless(k,j) = total_itemless/100;
        mean_total_attributeless(k,j) = total_attributeless/100;
    end
end

figure(14)
plot(noises,mean_total_itemless');
hold on
title('Output activation of different questions with increasing item noise');
xlabel('Noise (std of randnorm)');
ylabel('Output activation');
legend(idxs_string);
hold off

figure(15)
plot(noises,mean_total_attributeless');
hold on
title('Output activation of different questions with increasing attribute noise');
xlabel('Noise (std of randnorm)');
ylabel('Output activation');
legend(idxs_string);
hold off

%%

% Running the model 10 times to get mean descriptive statistics
for i = 1:10
    [model_loop, results_loop] = trainModel(2500,0.01);
    SSEs(i) = results_loop.SSE(2500);
    [error,outputActs,hiddenActs3,hiddenActs2,hiddenActs1,repsItemsActs,repsAttributesActs]=forwardPass(model,semdata.items,semdata.relations,semdata.attributes,semdata.output);
    BCEs(i) = mean(abs(round(outputActs)-output));
end
mean_SSE = mean(SSEs);
mean_BCE = mean(BCEs);
