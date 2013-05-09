function sortKeys = createSortSet(detectKeys, sortMethod)
% Create clustering sets for given detection set.
%   sortKeys = createSortSet(detectKeys) creates clustering sets for all
%   detectKeys. The sort_method_num from EphysTypes is used.
%
%   sortKeys = createSortSet(detectKeys, sortMethod) creates clustering
%   sets with a non-default sort method.
%
% AE 2011-11-11

sortKeys = fetch(detect.Params(detectKeys));
if nargin < 2 || isempty(sortMethod)
    sortMethods = num2cell(fetchn(acq.Ephys(detectKeys) * acq.EphysTypes, 'sort_method_num'));
    [sortKeys.sort_method_num] = deal(sortMethods{:});
else
    [sortKeys.sort_method_num] = deal(fetch1(sort.Methods(struct('sort_method_name', sortMethod)), 'sort_method_num'));
end
inserti(sort.Params, sortKeys);
