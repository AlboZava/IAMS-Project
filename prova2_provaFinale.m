
%% INITIAL ORBIT CHARACTERISATION

rr1 = [-7644.9912 -2301.1555 4389.2204];
vv1 = [-1.4060 -4.8280 -4.2270];
mu = 398600;

[a1, e1, i1, OM1, om1, th1] = car2par(rr1, vv1, mu);

hh1 = cross(rr1, vv1);
r1 = norm(rr1);
ee1 = cross(vv1, hh1) / mu - rr1 / r1;

%% FINAL ORBIT CHARACTERISATION

a2 = 13980.0;
e2 = 0.2893;
i2 = 0.7784;
OM2 = 0.3553;
om2 = 1.3480;
th2 = 1.8860;

[rr2, vv2] = par2car(a2, e2, i2, OM2, om2, th2, mu);

hh2 = cross(rr2, vv2);
r2 = norm(rr2);
ee2 = cross(vv2, hh2) / mu - rr2 / r2;

%% PLOT

th0 = 0;
thf = 2 * pi;
dth = 0.01;

quiver3(0,0,0, ee1(1), ee1(2), ee1(3), 2 * 1e5, 'c')
hold on
quiver3(0,0,0, ee2(1), ee2(2), ee2(3), 5 * 1e4, 'm')

plotOrbit(a1, e1, i1, OM1, om1, th0, thf, dth, mu)
plotOrbit(a2, e2, i2, OM2, om2, th0, thf, dth, mu)

opts.Units = 'km';
opts.FaceAlpha = 0.5;
planet3D('Earth', opts);                                                    % Addon required: Planet3D
light('Position',[1,-1,0]);
grid on;
plot3(rr1(1), rr1(2), rr1(3), 'o')
plot3(rr2(1), rr2(2), rr2(3), 'o')
plotTransferOrbit(a1, a2, e1, e2, i1, i2, OM1, OM2, om1, om2, mu, 'pa')
%legend('e1', 'e2', 'Initial orbit', 'Final orbit', '', 'Initial point', 'Final point', ...
%    'Transfer orbit')

%% bitangent 'pa'
[DeltaVp, omf, theta] = changeOrbitalPlane(a1, e1, i1, OM1, om1, i2, OM2, mu);

%[DeltaV1, DeltaV2, Deltat] = bitangentTransfer(a1, e1, a2, e2, 'pa', mu);

[rr_cp, vv_cp] = par2car(a1, e1, i1, OM1, omf, theta, mu);

hh_cp = cross(rr_cp, vv_cp);
r_cp = norm(rr_cp);
ee_cp = cross(vv_cp, hh_cp) / mu - rr_cp / r_cp;

quiver3(0,0,0, ee_cp(1), ee_cp(2), ee_cp(3), 2 * 1e5, 'r')
