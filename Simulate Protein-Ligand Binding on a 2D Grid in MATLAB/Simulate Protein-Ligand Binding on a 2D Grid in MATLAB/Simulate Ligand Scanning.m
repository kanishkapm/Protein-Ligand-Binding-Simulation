[maxAffinity, linearIndex] = max(proteinSurface(:));
[row, col] = ind2sub(size(proteinSurface), linearIndex);
fprintf('Best binding site at row %d, column %d with affinity %.2f\n', row, col, maxAffinity);