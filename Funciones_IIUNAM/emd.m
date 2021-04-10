function imf = emd(x,sdl)
% Empiricial Mode Decomposition (Hilbert-Huang Transform)
% imf = emd(x)
% Func : findpeaks
x   = transpose(x(:));
imf = [];
while ~ismonotonic(x)
   x1 = x;
   sd = Inf;
   while  ~isimf(x1) || (sd > sdl)
      s1 = getspline(x1);
      s2 = -getspline(-x1);
      x2 = x1-((s1+s2)/2);
      sd = sum((x1-x2).^2)/sum(x1.^2); 
      if( x1 == x2 ) 
          break;
      end
      x1 = x2;
   end      
   imf{end+1} = x1;
   x = x-x1;
end
imf{end+1} = x;

% FUNCTIONS
function u = ismonotonic(x)
u1 = length(findpeaks(x))*length(findpeaks(-x));
if u1 > 0, u = 0;
else      u = 1; end

function u = isimf(x)
N  = length(x);
u1 = sum(x(1:N-1).*x(2:N) < 0);
u2 = length(findpeaks(x))+length(findpeaks(-x));
if abs(u1-u2) > 1, u = 0;
else u = 1; end

function s = getspline(x)
N = length(x);
p = findpeaks(x);

% SPECIAL EXTREMA
% This maxima is added to avoid extrema spikes on IMFs
% Beginning of signal
if( x(1) > x(2) )
    p = [1 p];        %Add new extrema
end
%End of signal
if( x( N ) > x( N-1 ) )
    p = [p N];
end

if( length(p) > 1 ) 
    %s = spline([1 p N],[x(1) x(p) x(N)],1:N);
    %s = spline([0 p N+1],[0 x(p) 0],1:N);
    s = spline(p,x(p),1:N);    
else
    s = 0;  %% monotonic funcion
end


% %To plot
% 
% while ~ismonotonic(x)
%    x1 = x;
%    sd = Inf;
%    while  ~isimf(x1) || (sd > sdl)
%       s1 = getspline(x1);
% %       p1 = findpeaks(x1);
%       s2 = -getspline(-x1);
% %       p2 = findpeaks(-x1);
%       x2 = x1-(s1+s2)/2;
%       sd = sum((x1-x2).^2)/sum(x1.^2);
% %       xaux = x1;
%       x1 = x2;
%    end
%    
% %    c = linspace(0,(N-1)*0.24,N);
% %    figure
% %    hold on
% %    plot(c,xaux,c,s1,c,s2);
% %    plot(0.24.*(p1-1),xaux(p1),'*r',0.24.*(p2-1),xaux(p2),'*b'),grid;
% %    hold off  