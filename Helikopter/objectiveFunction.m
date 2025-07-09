function error = objectiveFunction(params)
    k1=params(1);
    k2=params(2);
    assignin('base', 'k1', k1);
    assignin('base', 'k2', k2);

    % Simulate the model
    out1=sim('TekmaModel');  
    simulatedResponse = rad2deg(out1.fi.Data);
   % simulatedTime = out1.fi.Time;

    % Load real parameters
    load('signali');  
    realResponse = ynaprave.Data; 
   % realTime = out.izhod.Time;

    % Compute error
    error = sum((realResponse - simulatedResponse).^2);   
    disp(error)
end
