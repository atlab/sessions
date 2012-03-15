function backupSubjectData(subjectId)

tables = {'Subjects', 'Sessions', 'SessionsIgnore', 'SessionsCleanup', 'EphysTypes', ...
    'Ephys', 'EphysIgnore', 'Stimulation', 'StimulationIgnore', ...
    'EphysStimulationLink', 'StimulationSync', 'BehaviorTraces'};
backupTables('acq', tables, subjectId);
   
tables = {'Mua', 'Lfp'};
backupTables('cont', tables, subjectId);

tables = {'Methods', 'Params', 'Sets', 'Electrodes'};
backupTables('detect', tables, subjectId);

tables = {'Methods', 'Params', 'Sets', 'SetsCompleted', 'Electrodes', ...
    'TetrodesMoGAutomatic', 'TetrodesMoGManual', 'TetrodesMoGFinalize', ...
    'TetrodesMoGUnits', 'TetrodesMoGLink', 'MultiUnit'};
backupTables('sort', tables, subjectId);


function backupTables(schema, tables, subjectId)

for i = 1:numel(tables)
    eval(sprintf('%s = fetch(%s.%s & struct(''subject_id'', %d), ''*'');', ...
        tables{i}, schema, tables{i}, subjectId));
end
save(schema, tables{:})
