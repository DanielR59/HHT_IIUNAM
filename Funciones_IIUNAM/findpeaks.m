function n = findpeaks(x)
% Find peaks.
% n = findpeaks(x)

n    = find(diff(diff(x) > 0) < 0);
u    = find(x(n+1) > x(n));
n(u) = n(u)+1;

% % SPECIAL EXTREMA
% % This maxima is added to avoid extrema spikes on IMFs
% % Beginning of signal
% if( x(1) > x(2) )
%     n = [ 1 n];        %Add new extrema
% end
% %End of signal
% l = size( x , 2 );
% if( x( l ) > x( l-1 ) )
%     n = [n l];
% end



