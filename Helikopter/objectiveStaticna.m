function error = objectiveStaticna(params)
    k1 = params(1);
    k2 = params(2);
    assignin('base', 'k1', k1);
    assignin('base', 'k2', k2);
    
    % Zaženi Simulink model
    simOut = sim('modelStaticna');
    
    % Preberi rezultat simulacije
    simulatedResponse = simOut.fi.data;  % Prilagodi ime signala na izhod modela
    
    % Naloži podatke naprave
    load('StaticnaNaprave.mat');
    realResponse = YY1; % Dejanske vrednosti naprave
    realTime = time_YY1; % Nimamo tegaa
    
    % Interpoliraj simuliran signal na časovne točke dejanskega signala
    simTime = simOut.fi.time; % Časovne točke simuliranega odziva
    interpolatedSimResponse = interp1(simTime, simulatedResponse, realTime, 'linear');
    
    % Izračunaj napako
    error = sum((interpolatedSimResponse - realResponse).^2);
    disp(error);
end
