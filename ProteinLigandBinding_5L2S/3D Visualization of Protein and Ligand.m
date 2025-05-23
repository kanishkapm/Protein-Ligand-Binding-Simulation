% 3D scatter plot of protein and ligand atoms
proteinZ = [proteinAtoms.Z]';
ligandZ = [ligandAtoms.Z]';

figure;
scatter3(proteinX, proteinY, proteinZ, 10, 'b', 'filled');
hold on;
scatter3(ligandX, ligandY, ligandZ, 50, 'r', 'filled');
xlabel('X (Å)');
ylabel('Y (Å)');
zlabel('Z (Å)');
title('3D Structure: Protein and Ligand (5L2S)');
legend('Protein Atoms', 'Ligand Atoms');
grid on;
axis tight;
view(45, 30); % Adjust camera angle

% 🔽 Add this to save the figure as PNG
drawnow;
exportgraphics(gcf, '3D_structure_protein_ligand_5L2S.png', 'Resolution', 300);