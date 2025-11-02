% Exercise 11 — FIR Types I–IV (single tiledlayout, slide-matched)
clear; clc; close all;

% Impulse responses
h1 = [1 2 3 4 4 3 2 1];     % Type I  (M even, symmetric)
h2 = [1 2 3 4 3 2 1];       % Type II (M odd,  symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1]; % Type III(M even, antisymmetric)
h4 = [-1 -2 -3 0  3 2 1];   % Type IV (M odd,  antisymmetric)
Hs   = {h1,h2,h3,h4};
tags = {'FIR1','FIR2','FIR3','FIR4'};

Nfft = 512;

% Layout: 4 rows × 4 cols (left 2 cols = Mag|Phase; right top 2x2 = Z-plane)
fig = figure('Color','w','Position',[60 60 1500 900]);
tl  = tiledlayout(fig,4,4,'TileSpacing','compact','Padding','compact');

tile = @(r,c) (r-1)*4 + c;   % helper to index tiles

% Left side: Magnitude & wrapped Phase
for i = 1:4
    h = Hs{i};
    [H, w] = freqz(h, 1, Nfft);
    mag = abs(H);
    ph  = angle(H); % wrapped to match slides

    % Magnitude in column 1
    ax1 = nexttile(tl, tile(i,1));
    plot(ax1, w/pi, mag, 'LineWidth', 1.3);
    grid(ax1,'on'); xlim(ax1,[0 1]);
    xlabel(ax1,'\omega/\pi'); ylabel(ax1,'|H|');
    title(ax1, sprintf('%s — Magnitude', tags{i}));

    % Phase (wrapped) in column 2
    ax2 = nexttile(tl, tile(i,2));
    plot(ax2, w/pi, ph, 'LineWidth', 1.3);
    grid(ax2,'on'); xlim(ax2,[0 1]);
    xlabel(ax2,'\omega/\pi'); ylabel(ax2,'Phase (rad)');
    title(ax2, sprintf('%s — Phase', tags{i}));
end

% Right side: Z-plane as a 2x2 block (rows 1–2, cols 3–4)
% FIR1: (1,3), FIR2: (1,4), FIR3: (2,3), FIR4: (2,4)
zp_pos = [tile(1,3), tile(1,4), tile(2,3), tile(2,4)];
for i = 1:4
    axz = nexttile(tl, zp_pos(i));
    zplane(Hs{i},1);
    axis(axz,'equal'); axis(axz,[-1.5 1.5 -1.5 1.5]); % square, consistent
    grid(axz,'on'); box(axz,'on');
    xlabel(axz,'Real'); ylabel(axz,'Imag');
    title(axz, tags{i});
end

% Optionally hide the unused lower-right tiles (rows 3–4, cols 3–4)
unused = [tile(3,3) tile(3,4) tile(4,3) tile(4,4)];
for k = unused
    ax = nexttile(tl,k);
    axis(ax,'off');
end

if exist('sgtitle','file')
    sgtitle(tl,'Exercise 11 — Results (Magnitude | Phase | Z-plane)');
end

% Save composite figure
saveas(fig,'exercise11_results.png');
