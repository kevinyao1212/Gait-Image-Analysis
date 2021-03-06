
%% Process all video files and save SitStand Test Event Intensty to sitStandProcessedDataMap.mat
% Note that all video names have to be the patient ID

path_videos_dir = './tempVideos'; % This is the dir contains all videos to be processed
path_save_dir = './tempProcessedFolder'; % This is the dir to save all processed data

% Create a new sitStandProcessedDataMap
% sitStandProcessedDataMap = containers.Map;

% Load the saved data first
savedDataMap = load('sitStandProcessedDataMap.mat');

files = dir(path_videos_dir);
fileIndex = find(~[files.isdir]);

% savedDataMap('12321') = AnalyzeSitStandRGB( path_rgb_video, path_save_dir );

% Load all movies in the directory
for i = 1:length(fileIndex)
    
    videoFileName = files(fileIndex(i)).name; 
    parsed = strsplit(videoFileName, '.');
    patientID = char(parsed(1));
    
    if isempty(patientID) == false % Make srue the file is valid
        path_rgb_video = strcat(strcat(path_videos_dir, '/'), videoFileName);
        path_patient_save_dir = strcat(strcat(path_save_dir, '/'), patientID);

        disp(strcat('======Processing pratient with ID: ', patientID)); % Display info

        % Save each analyzed sitStand event intensity to the data map
    %     try
        AnalyzeSitStandRGB( path_rgb_video, path_patient_save_dir );
        % Just to be safe, save the data to file
        %save('sitStandProcessedDataMap.mat' ,'savedDataMap');
    %     catch
    %         error(strcat('Error occurred when processing: ', videoFileName));
    %     end
    
    
    end
end


%% Load processed data above and graph them

% Each row contains a single person's data 
% Each column contains the scenario
y = [1 1 1; 
     2 2 2; 
     3 8 9; 
     2 11 12];
bar(y)
xticklabels({'S1','S2','S3','S4'});
legend('eyes closed', 'normal', 'whatever');
xlabel('Do whatever');
ylabel('Do whatever');
title('Do whatever');

