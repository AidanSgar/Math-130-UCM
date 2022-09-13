close all

exponentBits = 2
mantissaBits = 3

possibleExp = [];
for i = 0:2^exponentBits-1
    possibleExp = [possibleExp,2^i];
end

possibleExp = [-flip(possibleExp),possibleExp];

possibleMan = []
for i = 0:2^mantissaBits-1
    possibleMan = [possibleMan,2^(-mantissaBits)*i];
end

possibleValues = [];

for i = 1:2^(exponentBits+1)
    possibleValues = [possibleValues,(1.+possibleMan).*possibleExp(i)];
end

possibleValues = sort(possibleValues);
possibleValues = unique(possibleValues,'stable')

plot(possibleValues)
