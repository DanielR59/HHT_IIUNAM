function [mag t w hif nW omegaMax] = hilbertSpectrum(varargin)
imf = varargin{1};
Ts = varargin{2};  %Sampling Period
nW = varargin{3};  % Frequency resolution
if( nargin >= 4 )
    hif = varargin{4};
end
if( nargin == 5 )
    tf = varargin{5};
    t = 1 : round( tf/Ts);
else
    t = 1: size(imf,1);
end

% Hilbert transform of IMFs
idx = t;
%h = hilbert([imf-repmat(mean(imf),size(imf,1),1);zeros(size(imf))]);
h = hilbert( [imf ; zeros(size(imf))] );
h = h(idx,:);

% variable amplitudes and instantaneous frequencies
amp = abs(h);
phase = unwrap(angle(h));

% phase average (or not) for smooth spectogram
flen = 3;
filtr = ones(1,flen)/flen; % phase averaging filter
if flen == 1
filtr = [0 1 0]; % no phase averaging filter
end
phase = filtfilt(filtr,1,phase);
phase = filtfilt(filtr,1,phase);

omega = abs(diff(phase))/(2*pi*Ts);
omega = [omega(1,:); omega];

% mandatory frequency cuts
 if( nargin < 4 )
     hif = 1 / (2 * Ts );  % <<--- It could be a parameter
end
% 
% lo = find(omega < lof);
 hi = find(omega > hif);
% 
% omega(lo) = lof;
 omega(hi) = hif;
% amp(lo) = 0;
 amp(hi) = 0;

% create a frequency scale and index it
omegaMin = min(omega(:));
omegaMax = max(omega(:));

omegaN = (omega - omegaMin) / (omegaMax - omegaMin) ;

widx = round( (nW-1)* omegaN ) + 1;

w = linspace(0,omegaMax,nW);
% t = linspace(t0,tf,length(t));
t = linspace( 0, Ts*(length(t)-1), length(t) );

% output the hilbert spectrum matrix

%[b,k,j] = unique(repmat(shiftdim(t),size(widx,2),1));
% More effective and clear piece of code
m = size(widx,2);  % Number of IMFs
tPos = (1 : length(t))';
timeVector = tPos;
for i = 2 : m
    timeVector = [timeVector ; tPos];  
end
mag     = sparse(   reshape(widx,size(widx,1)*size(widx,2),1) ,timeVector,...
                               reshape(amp,size(amp,1)*size(amp,2),1), ...
                               nW , length(t) );