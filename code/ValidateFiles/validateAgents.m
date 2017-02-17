function [ validatedBool ] = validateAgents( agents )
%VALIDATEAGENTS validates if agent matrix is of right format

if validateNum(agents, 'double', [-inf,inf], [0, inf], [4,4])
    validatedBool = true;
    return
end
validatedBool = false;

end

