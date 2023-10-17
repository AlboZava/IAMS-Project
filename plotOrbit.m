% 3D orbit plot
%
% plotOrbit(a, e, i, OM, om, th0, thf, dth, mu)
%
% ---------------------------------------------------------------------
% Input arguments:
% a             [1x1]   semi-major axis             [km]
% e             [1x1]   eccentricity                [-]
% i             [1x1]   inclination                 [rad]
% OM            [1x1]   RAAN                        [rad]
% om            [1x1]   pericenter anomaly          [rad]
% th0           [1x1]   initial true anomaly        [rad]
% thf           [1x1]   final true anomaly          [rad]
% dth           [1x1]   true anomaly                [rad]
% mu            [1x1]   gravitational parameter     [km^3 / s^2]
%
% ---------------------------------------------------------------------

function plotOrbit(a, e, i, OM, om, th0, thf, dth, mu)

n = (thf - th0) / dth;
thv = linspace(th0, thf, n);
rr = zeros(3, n);

for j = 1 : n

    [rr(:, j), ~] = par2car(a, e, i, OM, om, thv(j), mu);
end
%disp(rr)


plot3(rr(1, :), rr(2, :), rr(3, :))
hold on
earth_sphere('km')