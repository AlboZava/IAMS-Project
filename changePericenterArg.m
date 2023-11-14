% Change of pericenter argument maneuver
%
% [deltav,thi,thf]=changePericenterArg(a,e,omi,omf,mu)
%
% ---------------------------------------------------------------
% Input arguments
% a         [1x1]    semi-major axis                 [km]
% e         [1x1]    eccentricty                     [-]
% omi       [1x1]    initial pericenter anomaly      [rad]
% omf       [1x1]    final pericenter anomaly        [rad]
% mu        [1x1]    gravitational parameter         [km^3/s^2]
%
% ---------------------------------------------------------------
% Output arguments 
% deltav    [1x1]   maneuver impulse                 [km/s]
% thi       [2x1]   initial true anomalies           [rad]
% thf       [2x1]   final true anomalies             [rad]


function [deltav,thi,thf]=changePericenterArg(a,e,omi,omf,mu)

deltaom=abs(omf-omi);

thi=[deltaom/2 2*pi-deltaom/2];
thf=[pi+deltaom/2 pi-deltaom/2];

p=a*(1-e^2);
deltav=2*sqrt(mu/p)*e*sin(deltaom/2);


