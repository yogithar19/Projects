clearvars;
% Open noisy speech file and read data
fileID1 = fopen('Yogitha Reddy - speech_noisy.txt', 'r');
x = fscanf(fileID1, '%f');
fclose(fileID1);
Fs=8000;

len = floor(20*Fs/1000); % Frame size in samples
if rem(len,2)==1, len=len+1; end  % Making the frame size even adding one if odd

overlap = 50; % window overlap in percent of frame size
len1 = floor(len*overlap/100); %Number of overlap samples
len2 = len-len1;  %No of samples to shift

win     = hanning(len); % Hanning window is created
nFFT       = len;
Nframes    = floor(length(x)/len1)-1;
x_old      = zeros(len1,1);
alpha         = 0.98;

noise_mean = zeros(nFFT,1);
xfinal     = zeros(Nframes*len2,1);

%finding noise estimate using first 10 samples
j = 1;
for k = 1:10
   noise_mean = noise_mean+abs(fft(win.*x(j:j+len-1),nFFT));
   j = j+len;
end

noise_mu = noise_mean/5;
noise_mu2 = noise_mu.^2;

% Processing 
for n = 1:Nframes 
    insign = win.*x(k:k+len-1);
    %Implementing STFT
    spec  = fft(insign,nFFT);   
    
    sig   = abs(spec); % compute the magnitude
    sig2  = sig.^2;
    theta = angle(spec);    
   
    postsnr = sig2./noise_mu2;  % post SNR

    if n==1
        apriori = alpha+(1-alpha)*max(postsnr-1,0);
    else
        apriori = alpha*(xk_prev./noise_mu2)+ (1-alpha)*max(postsnr-1,0);
    end

    gain = apriori./(1+apriori);
    xk_prev = gain.*sig2;

    enhancedspeecht = ifft(gain.*spec,nFFT);
    %enhancedspeechf = real(enhancedspeecht);
    
	xi = enhancedspeecht;

    % --- Reconstructing - Overlap and add ---------------
    xfinal(k:k+len1-1) = x_old(1:len1) + xi(1:len1);
    x_old = xi(len1+1:len);
    k = k + len2;
end

xfinal = xfinal*3; %Amplification

%figure;
%spectrogram(xfinal,hanning(256),128,512,8000,'yaxis')
sound(x,8000);
pause(60);
sound(xfinal,8000);

%[pxx,f] =pwelch(xfinal,1024,512,[],8000);
%plot (f,10*log10(pxx));
