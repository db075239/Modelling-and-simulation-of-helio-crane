function simulatedResponse = simulateSimulinkModel(x)
    
    % Postavite vrednosti u radni prostor
    assignin('base', 'k1', x(1));  % Parametar 1
    assignin('base', 'k2', x(2));  % Parametar 2
    assignin('base', 'k3', x(3));  % Parametar 3
    assignin('base', 'f0', x(4));  % Parametar 4
    assignin('base', 'J', x(5));   % Parametar 5
    
    
    % simulacija
    simOut = sim('modelX');
    
    simulatedResponse = simOut.fi.Data; 
    
end