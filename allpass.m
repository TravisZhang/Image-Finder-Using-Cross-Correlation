function y = allpass(x, k, g, ploton)
    % Forward extension length is determined for you
    if abs(g) >= 1      % signal blows up
        fwdxpd = (k-1) + 10*k;
    else                % signal decays below 1%
        fwdxpd = (k-1) + ceil(-2/log10(abs(g)));
    end
    zerosfwd = zeros(fwdxpd,1);

    % Q: Consider the correct way to extend the x signal backwards so x[n-k]
    %  can be referenced for all n=0,1,2,... - what length?
    %%%% FILL IN THE VALUE BELOW: %%%%
    zerosbkwd = zeros( k ,1);                 

    xext = [zerosbkwd ; x(:); zerosfwd];
    extlen = length(xext);

    % Produce the output y, assuming 0 initial condition:
    yext = zeros(extlen,1);
    
    %%%% WRITE CODE BELOW: %%%%%
    %   Fill in yext(i) until the end of the array.
    for n = (k+1):extlen
        yext(n)=xext(n-k)-g*yext(n-k)+g*xext(n);
    end
%     ylen1 = length(yext);
    % Recover the signal starting from n = 0 - i.e. MATLAB indexing 1 for x:
    %%%% FILL IN THE VALUE BELOW: %%%%
    irec = k;

    x = xext(irec:end);
    y = yext(irec:end);
    ylen = length(y);
    if ploton
        figure(102); 
        subplot(121); stem(0:ylen-1, x); xlim([0 ylen-1]);
        subplot(122); stem(0:ylen-1, y); xlim([0 ylen-1]);
    end
end
