function [ R, offset ] = fit_Resistance( V, I )
%FIT_RESISTANCE Fit IV curve with a linear fit + offset
StartCoeffs = [(V(end)-V(1))/(I(end)-I(1)),mean(V)];
fitobject = fit(I(:), V(:), 'R*x + b', 'StartPoint', StartCoeffs);
R = fitobject.R;
offset = fitobject.b;
end

