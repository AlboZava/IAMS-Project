% transformation from cartesian coordinates to Keplerian coordinates
%
% [a, e, i, OM, om, th] = car2par(rr, vv, mu)
%
% ---------------------------------------------------------------------
% Input arguments:
% rr            [3x1]   position vector             [km]  
% vv            [3x1]   velocity vector             [km/s]
% mu            [1x1]   gravitational parameter     [km^3 / s^2]
%
% ---------------------------------------------------------------------
% Output arguments:
% a             [1x1]   semi-major axis             [km]
% e             [1x1]   eccentricity                [-]
% i             [1x1]   inclination                 [rad]
% OM            [1x1]   RAAN                        [rad]
% om            [1x1]   pericenter anomaly          [rad]
% th            [1x1]   true anomaly                [rad]
%
% ---------------------------------------------------------------------


function [a, e, i, OM, om, th] = car2par(rr, vv, mu)
kk = [0 0 1];

r = norm(rr);
v = norm(vv);

eps = 1/2 * v^2 - mu / r;                                                   % Specific mechanical energy

a = -mu / (2 * eps); 

hh = cross(rr, vv);                                                         % Specific angular momentum vector
h = norm(hh);

ee = cross(vv, hh) / mu - rr / r;                                           % Eccentricity vector
e = norm(ee);

i = acos(hh(3) / h);

%i = i * 180 / pi;

kh = cross(kk,hh);
NN = kh / norm(kh);

if(NN(2) < 0)                                                               % RAAN
    OM = 2 * pi - acos(NN(1));
else
    OM = acos(NN(1));
end

%OM = OM * 180 / pi;

if(ee(3) < 0)                                                               % Pericenter anomaly
    om = 2 * pi - acos((dot(NN, ee)) / e);
else
    om = acos((dot(NN, ee)) / e);
end

%om = om * 180 / pi;

vr = (dot(vv, rr)) / r;

if(vr < 0)                                                                  % True anomaly
    th = 2 * pi - acos(dot(rr, ee) / (r * e));
else
    th = acos(dot(rr, ee) / (r * e));
end

%th = th * 180 / pi;
