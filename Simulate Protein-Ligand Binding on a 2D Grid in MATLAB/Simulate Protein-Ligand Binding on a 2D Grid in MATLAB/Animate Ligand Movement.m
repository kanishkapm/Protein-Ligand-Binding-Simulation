figure;
imagesc(proteinSurface);
colorbar;
title('Ligand Scanning Protein Surface');
hold on;

for r = 1:gridSize
    for c = 1:gridSize
        plot(c, r, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'w');  % ligand marker
        pause(0.05);  % pause for animation effect
        if r ~= row || c ~= col
            plot(c, r, 'wo', 'MarkerSize', 10);  % erase previous marker by plotting white circle
        end
    end
end

% Highlight best binding site
plot(col, row, 'r*', 'MarkerSize', 15, 'LineWidth', 2);
hold off;