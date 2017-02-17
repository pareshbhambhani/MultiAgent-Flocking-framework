function mainfunc()

% load or generate settings
if exist('presets/Settings.mat', 'file') == 2
    if sum(strcmp(who('-file', 'presets/Settings.mat'), 'settings')) == 1
        load('presets/Settings.mat', 'settings');
    else
        settings = createDefaultSettings();
    end
else
    settings = createDefaultSettings();
end

% generates simulationObj (agents and in future obstacles) in depending on settings
simulationObj = createSimulationObj(settings);

% set time for simulation and plot
simulationObj = resetSimulationObj(simulationObj);

% Open up the figure
figure2 = figure(2);

% create avi-file
if (settings.captureBool)
    fileName = ['videos/record_', datestr(now,'yyyy-mm-dd_HH-MM-SS'), '.mp4'];
    videoObj = VideoWriter(fileName,'MPEG-4');
    open(videoObj);
end

% plot everything
plotObj = plotInit(simulationObj, settings, figure2);

% create timerfunction
period = settings.period; %Time interval between timerFcn calls
num_tasks = settings.iteration; %Number of times to repeat timerFcn
timerFcn = @(~,~) timerFunction();

timerObj = timer('TimerFcn', timerFcn, ...
    'ExecutionMode', 'fixedRate', ...
    'Period', period, 'TasksToExecute', num_tasks, ...
    'BusyMode' , 'queue');


%counter
counter = 0;

%Start timer
start(timerObj);

%Pause for tasks to execute
pause(num_tasks*period);

%Stop timer
stop(timerObj);

if (settings.captureBool)
    close(videoObj);
end

%Delete timer
delete(timerObj);

%Nested timer function to use the objects without passing any variables
%TIMERFUNCTION calls the updateAgent function and plots the new matrix

clear all; %Clear workspace at end

function timerFunction()
    tic;
    
    %Capture Video
    if (settings.captureBool)
        writeVideo(videoObj, getframe(figure2));
    end
    
    %Get agent steps and update plot
    simulationObj = agentsStep(simulationObj, settings);
    plotUpdate(plotObj,simulationObj,settings);
    drawnow;
    
    % Display agents position and vel and iterations for debugging
    %disp(simulationObj.agents);
    counter = counter +1;
    t_iter_end = toc;
    fprintf('Iteration time = %f \n', t_iter_end);
    fprintf('Counter = %d \n', counter);
end
end
