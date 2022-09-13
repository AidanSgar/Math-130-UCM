close all

exponentBits = 2
mantissaBits = 3

possibleExp = [];
for i = 0:2^exponentBits-1
    possibleExp = [possibleExp,2^i];
end

possibleExp = [-flip(possibleExp),possibleExp];
possibleMantissaDec = 0:2^mantissaBits-1;
possibleMantissaBi = int2bit(possibleMantissaDec,mantissaBits);
possibleMantissa = [];

for j = 1:2^mantissaBits
    temp = 0;
    for i = 1:mantissaBits
        temp = temp + (possibleMantissaBi(i,j))*((1/2)^(i-1));
    end
    possibleMantissa = [possibleMantissa,temp];
end

possibleValues = [];

for i = 1:2^(exponentBits+1)
    possibleValues = [possibleValues,possibleMantissa.*possibleExp(i)];
end

possibleValues = sort(possibleValues);
possibleValues = unique(possibleValues,'stable')

scatter(possibleValues,zeros(length(possibleValues)),"filled")
