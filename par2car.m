% Transformation from Keplerian parameters to cartesian coordinates
%
% [rr, vv] = par2car(a, e, i, OM, om, th, mu)
%
% ---------------------------------------------------------------------
% Input arguments:
% a             [1x1]   semi-major axis             [km]
% e             [1x1]   eccentricity                [-]
% i             [1x1]   inclination                 [rad]
% OM            [1x1]   RAAN                        [rad]
% om            [1x1]   pericenter anomaly          [rad]
% th            [1x1]   true anomaly                [rad]
% mu            [1x1]   gravitational parameter     [km^3 / s^2]
%
% ---------------------------------------------------------------------
% Output arguments:
% rr            [3x1]   position vector             [km]  
% vv            [3x1]   velocity vector             [km/s]
%
% ---------------------------------------------------------------------

function [rr, vv] = par2car(a, e, i, OM, om, th, mu)

ROM = [cos(OM) sin(OM) 0;                                                   % Rotation of Ω around k
      -sin(OM) cos(OM) 0;
       0 0 1];

Ri = [1 0 0;                                                                % Rotation of i around i'
      0 cos(i) sin(i);
      0 -sin(i) cos(i)];

Rom = [cos(om) sin(om) 0;                                                   % Rotazione di 𝜔 intorno a k''
       -sin(om) cos(om) 0;
       0 0 1];

T_PF = Rom * Ri * ROM;                                                      % Total rotation matrix

p = a * (1 - e^2);
r = p / (1 + e * cos(th));

rr_t = r * [cos(th) sin(th) 0]';                                            %
                                                                            %
vv_t = sqrt(mu / p) * [-sin(th) e+cos(th) 0]';                              % Vector [rr_t, vv_t] (state vector in PF)

rr = T_PF' * rr_t;
vv = T_PF' * vv_t;

