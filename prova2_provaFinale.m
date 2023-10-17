% punto iniziale:
% prima orbita

rr = [-7644.9912 -2301.1555 4389.2204];
vv = [-1.4060 -4.8280 -4.2270];
mu = 398600;

[a1, e1, i1, OM1, om1, th1] = car2par(rr, vv, mu);

% plot orbita

th0 = 0;
thf = 360;
dth = 0.01;

plotOrbit(a1, e1, i1, OM1, om1, th0, thf, dth, mu)

% punto finale:
% seconda orbita

a = 13980.0;
e = 0.2893;
i = 0.7784;
OM = 0.3553;
om = 1.3480;
th = 1.8860;
mu = 398600;

[rr, vv] = par2car(a, e, i, OM, om, th, mu);

%plot orbita:
th0 = 0;
thf = 360;
dth = 0.01;

plotOrbit(a, e, i, OM, om, th0, thf, dth, mu)


%
%   TEST
%