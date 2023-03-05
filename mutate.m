function mutationChildren = mutate(parents, options, nvars,... 
FitnessFcn, state, thisScore, thisPopulation, valueArray, scale, num, f)

toMutate = thisPopulation(parents,:);
[chNum, len] = size(toMutate);
m = initpop(chNum, len, valueArray);
mutNum = fix(rand(chNum,1)*(nvars/(f*num)) +1);
for i = 1:chNum
    mutated = toMutate(chNum, :);
    %%mutNum = fix(rand()*(nvars/(f*num)) +1);
    mutPos = fix(rand(1, mutNum(chNum))*(nvars-1)+1);
    mutated(1, mutPos) = m(chNum, mutPos);
    if FitnessFcn(mutated) < FitnessFcn(toMutate(chNum,:))
        toMutate(chNum,:) = mutated;
    end
end
mutationChildren = toMutate;
end

