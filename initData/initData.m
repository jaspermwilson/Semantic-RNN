% Initializing the training data. Inputs include items, relations, and
% attributes; thus, 8 * 4 * 36 = 1152 possible combinations. 
% How to find output: 4*(item_num-1)+32*(attribute_num-1)+relation_num

% Initializing item input matrix
for i = 1:8
    item(i,4*(i-1)+1:4*(i-1)+4) = ones(1,4);
end
items = repmat(item,1,36);
semdata.items = items;

% Initializing relations input matrix
relations = [];
for i = 1:288
    relations = [relations, eye(4)];
end
semdata.relations = relations;

% Initializing attributes input matrix
for i = 1:36
    attributes(i,32*(i-1)+1:32*(i-1)+32) = ones(1,32);
end
semdata.attributes = attributes;

% Initializing binary (yes 1, no 0) output matrix
output = zeros(1,1152);
% Keeping count: n = 1 | living thing, plant
for i = 1:12
    output(1,4*(i-1)+1) = 1;
end
% n = 64 | animal
for i = 1:4
    output(1,4*(i-1)+80+1) = 1;
end
% n = 96 | tree
for i = 1:2
    output(1,4*(i-1)+96+1) = 1;
end
% n = 128 | flower
for i = 1:2
    output(1,4*(i-1)+136+1) = 1;
end
% n = 160 | bird
for i = 1:2
    output(1,4*(i-1)+176+1) = 1;
end
% n = 192 | fish
for i = 1:2
    output(1,4*(i-1)+216+1) = 1;
end
% n = 224 | individual items
k = 0;
for i = 1:8
    output(1,32*(i-1)+224+k+1) = 1;
    k = k+4;
end
% n = 480 | pretty
for i = 1:2
    output(1,4*(i-1)+489+1) = 1;
end
% n = 512 | big
for i = 1:2
    output(1,4*(i-1)+513+1) = 1;
end
% n = 544 | living
for i = 1:8
    output(1,4*(i-1)+545+1) = 1;
end
% n = 576 | green 
output(1,578) = 1;
% n = 608 | red
output(1,618) = 1;
output(1,626) = 1;
output(1,638) = 1;
% n = 640 | yellow
output(1,654) = 1;
for i = 1:2
    output(1,4*(i-1)+662) = 1;
end
% n = 672 | grow
for i = 1:8
    output(1,4*(i-1)+675) = 1;
end
% n = 704 | move
for i = 1:4
    output(1,4*(i-1)+723) = 1;
end
% n = 736 | swim
for i = 1:2
    output(1,4*(i-1)+763) = 1;
end
% n = 768 | fly
for i = 1:2
    output(1,4*(i-1)+787) = 1;
end
% n = 800 | sing
output(1,823) = 1;
% n = 832 | skin
for i = 1:4
    output(1,4*(i-1)+852) = 1;
end
% n = 864 | roots
for i = 1:4
    output(1,4*(i-1)+864+4) = 1;
end
% n = 896 | leaves
for i = 1:3
    output(1,4*(i-1)+896+8) = 1;
end
% n = 928 | bark
for i = 1:2
    output(1,4*(i-1)+928+4) = 1;
end
% n = 960 | branch
for i = 1:2
    output(1,4*(i-1)+960+4) = 1;
end
% n = 992 | petals
for i = 1:2
    output(1,4*(i-1)+992+8+4) = 1;
end
% n = 1024 | wings
for i = 1:2
    output(1,4*(i-1)+1024+16+4) = 1;
end
% n = 1056 | feathers
for i = 1:2
    output(1,4*(i-1)+1056+16+4) = 1;
end
% n = 1088 | gills
for i = 1:2
    output(1,4*(i-1)+1088+24+4) = 1;
end
% n = 1120 | scales
for i = 1:2
    output(1,4*(i-1)+1120+24+4) = 1;
end
% n = 1152
semdata.output = output;

save('semdata.mat','semdata');


