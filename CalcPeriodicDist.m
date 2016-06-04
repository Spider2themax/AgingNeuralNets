function dist = CalcPeriodicDist(pos1,pos2,L)

% Calculating absolute z distance
x = abs(pos1(1)-pos2(1));
y = abs(pos1(2)-pos2(2));
z = abs(pos1(3)-pos2(3));

% Ensuring periodic boundary conditions
if x > 100,
   x = L - x;
end
if y > 100,
   y = L - y;
end
if z > 100,
   z = L - z;
end

dist = sqrt(x*x + y*y + z*z);