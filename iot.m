                                                                                                     %% Initialize
clear;
clc;
disp('***************************');
disp('Clean up binary file');

system('make clean');

%% Compile C++ files
disp('***************************');
disp('Start Compile C++ files');
system('make');
disp('End Compile C++ files');

DataPath = "../data/";

Dir1 = dir("../data/");

nSUB = 8;
RecDay = 7;


subACCdata   = zeros(8,7);
subBVPdata    = zeros(8,7);
subGSRdata    = zeros(8,7);

inIDX1 = 1;
disp('***************************')
disp('Starting Parse the PPG, ACC, GSR Data');
for i = 1 : size(Dir1)
    SUB = dir(strcat(DataPath,Dir1(i).name));
    if Dir1(i).name == ".DS_Store"
        continue;
    elseif Dir1(i).name == "."
        continue;
    elseif Dir1(i).name == ".."
        continue;
    end
    inIDX2 = 1;
    for j = 1 : size(SUB)
        DAY = dir(strcat(SUB(j).folder,'/',SUB(j).name));
        if SUB(j).name == ".DS_Store"
            continue;
        elseif SUB(j).name == "."
            continue;
        elseif SUB(j).name == ".."
            continue;
        end
        
        datatype = 'ACC';
        
        ACCData = dir(strcat(DAY(1).folder,'/',datatype));
        numdata = length(ACCData) - 2;
      
        meanACC = 0;
        
        for k = 1 : size(ACCData)
            if ACCData(k).name == ".DS_Store"
                continue;
            elseif ACCData(k).name == "."
                continue;
            elseif ACCData(k).name == ".."
                continue;
            end
            system(strcat("./IoT ",ACCData(k).folder,'/',ACCData(k).name));
            pause(1);
            load('./db/dACC.db');
            meanACC = meanACC + dACC;
        end
        
        meanACC   = meanACC   / numdata;
        
        subACCdata(inIDX1,inIDX2)   = meanACC;                
        
        datatype = 'BVP';
        
        BVPData = dir(strcat(DAY(1).folder,'/',datatype));
        numdata = length(BVPData) - 2;
        
        meanLFHF = 0;
        
        for k = 1 : size(BVPData)
            if BVPData(k).name == ".DS_Store"
                continue;
            elseif BVPData(k).name == "."
                continue;
            elseif BVPData(k).name == ".."
                continue;
            end
            system(strcat("./IoT ",BVPData(k).folder,'/',BVPData(k).name));
            pause(1);
            load('./db/LFHF.db');
            meanLFHF = meanLFHF + LFHF;
        end
        
        meanLFHF = meanLFHF / numdata;
        
        subBVPdata(inIDX1,inIDX2) = meanLFHF;


        
        datatype = 'GSR';
        
        GSRData = dir(strcat(DAY(1).folder,'/',datatype));
        numdata = length(GSRData) - 2;
        
        meanGSR = 0;
        
        for k = 3 : size(GSRData)
            if GSRData(k).name == ".DS_Store"
                continue;
            elseif GSRData(k).name == "."
                continue;
            elseif GSRData(k).name == ".."
                continue;
            end
            system(strcat("./IoT ",GSRData(k).folder,'/',GSRData(k).name));
            pause(1);
            load('./db/gsr.db');
            meanGSR = meanGSR + gsr;
        end
        
        meanGSR = meanGSR / numdata;
        
        subGSRdata(inIDX1,inIDX2) = meanGSR;
        
        inIDX2 = inIDX2 + 1;
    end
    inIDX1 = inIDX1 + 1;
end
disp('***************************');
disp('Finish Parse PPG, ACC, GSR data');

load('response.txt');
RE = reshape(response,[8,7]);
%% Post Processing
disp('***************************');
disp('Start Prediction');


normACCdata = normalize(subACCdata);
normBVPdata = normalize(subBVPdata);
normGSRdata = normalize(subGSRdata);

Feature = normACCdata + normBVPdata + normGSRdata;

for i = 1 : 8
    p(i,:) = polyfit(Feature(i,:),RE(i,:),1);
end
% 
% x1 = linspace(min(min(Feature)),max(max(Feature)));
% for i = 1 : 8
%     y1(i,:) = polyval(p(i,:),x1);
% end
% for i = 1 : 8 
%     figure(i);
%     plot(Feature(i,:),RE(i,:),'o')
%     hold on;
%     plot(x1,y1(i,:))
%     hold off;
% end

accu = zeros(8,1);
for i = 1 : 8
    dailyaccu = zeros(7,1);
    for j = 1 : 7
        dailyaccu(j) = (40 - abs(RE(i,j) - (Feature(i,j) * p(i,1) + p(i,2))))/40 * 100;
    end
    accu(i) = nanmean(dailyaccu);
end
disp('***************************');
disp('Accuracy : ');
disp(nanmean(accu));
