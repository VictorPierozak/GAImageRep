function xoverKids = crossover(parents, options, nvars, FitnessFcn, ...
    unused,thisPopulation, scale, num)

toCross = thisPopulation(parents,:);
[~,parNum] = size(parents);
offsprings = zeros(parNum/2, nvars);

j = 1;
for i = 1:2:parNum
f1 = FitnessFcn(toCross(i,:));
f2 = FitnessFcn(toCross(i+1,:));
prob1 = 1- f1/(f1+f2);
prob2 = 1 - f2/(f1+f2);
heritanceVec = rand(nvars,1) + (prob1-prob2)/2;
offsprings(j, heritanceVec > 0.5) = toCross(i, heritanceVec > 0.5);
offsprings(j, heritanceVec <= 0.5) = toCross(i+1, heritanceVec <= 0.5);
end

xoverKids = offsprings;

end

