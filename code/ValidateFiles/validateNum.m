function [ sucess ] = validateNum( num, style, valueRange,  rowRange, columnRange)
%VALIDATENUM validates if NUM is of desired format
%   STYLE  -  'double' or 'int'
%   VALUERANGE - desired range of values [min, max] min <= num <= max
%   ROWRANGE, COLUMNRANGE - size(num) <= [rowRange, columnRange]
%
%   if one of the conditions above is not validated, sucess will be false
%   otherwise it will be true
% see also: VALIDATESTR

if any(size(num) < [rowRange(1), columnRange(1)])...
        || any(size(num) > [rowRange(2), columnRange(2)])
    if (rowRange(1) == 0) || (columnRange(1) == 0)
        if numel(num) ~= 0
            sucess = false;
            return;
        end
    else
        sucess = false;
        return;
    end
end
if any(~isreal(num(:)))
    sucess = false;
    return;
elseif any(islogical(num(:)))
    sucess = false;
    return;
elseif any(ischar(num(:)))
    sucess = false;
    return;
elseif any(isnan(num(:)))
    sucess = false;
    return;
elseif any(isinf(num(:)))
    sucess = false;
    return;
elseif any(num(:) < valueRange(1)) || any(num(:) > valueRange(2))
            sucess = false;
            return;  
elseif strcmp(style, 'double') 
    sucess = true;
    return;
elseif strcmp(style, 'int')
    if any(rem(num(:), 1) ~= 0)
        sucess = false;
        return;
    else
        sucess = true;
        return;
    end    
end


end

