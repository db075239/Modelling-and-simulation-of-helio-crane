% Odpri prvi .fig in pridobi podatke
fig1 = openfig('StaticnaaNarascajoca.fig', 'invisible');
ax1 = gca; % pridobi osi prve figure
lines1 = findall(ax1, 'Type', 'line'); % pridobi vse črte (podatke)

% Odpri drugi .fig in pridobi podatke
fig2 = openfig('StaticnaModelaOPTI.fig', 'invisible');
ax2 = gca; % pridobi osi druge figure
lines2 = findall(ax2, 'Type', 'line'); % pridobi vse črte (podatke)

% Odpri drugi .fig in pridobi podatke
% fig3 = openfig('ModelStatOpti.fig', 'invisible');
% ax3 = gca; % pridobi osi druge figure
% lines3 = findall(ax3, 'Type', 'line'); % pridobi vse črte (podatke)

% Ustvari nov graf
figure;
hold on; % Omogoči risanje več linij na isti graf
for i = 1:length(lines1)
    plot(lines1(i).XData, lines1(i).YData, 'DisplayName', ['Staticna karakteristika Naprave']);
end
for i = 1:length(lines2)
    plot(lines2(i).XData, lines2(i).YData, 'DisplayName', 'Staticna karakteristika Modela ');
end
% for i = 1:length(lines3)
%     plot(lines3(i).XData, lines3(i).YData, 'DisplayName', 'Staticna karakteristika Modela po optimizaciji ');
% end
hold off;

% Dodaj legendo in oznake
legend show;
legend("Location","SouthEast");
xlabel("Napetost[V]");
ylabel("fi[°]");
grid on;



