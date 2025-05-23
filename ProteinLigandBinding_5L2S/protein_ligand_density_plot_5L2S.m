% Read and visualize protein-ligand structure from 5L2S

% Step 1: Read PDB structure
pdbStruct = pdbread('5l2s.pdb');

% Step 2: Extract atom data
atoms = pdbStruct.Model.Atom;

% Step 3: Display available fields (optional debug)
disp('Available fields in atom structure:');
disp(fieldnames(atoms(1)));

% Step 4: Use resName to separate protein and ligand
% Common residues are standard amino acids (e.g., ALA, GLY, LYS)
% ABL = ligand in 5L2S (Abemaciclib)
ligandResName = 'ABL';

ligandIdx = strcmp({atoms.resName}, ligandResName);
proteinIdx = ~ligandIdx;

ligandAtoms = atoms(ligandIdx);
proteinAtoms = atoms(proteinIdx);

% Step 5: Extract XYZ coordinates
proteinX = [proteinAtoms.X]';
proteinY = [proteinAtoms.Y]';

ligandX = [ligandAtoms.X]';
ligandY = [ligandAtoms.Y]';

% Step 6: Define grid for 2D density
gridSize = 50;
xRange = linspace(min(proteinX), max(proteinX), gridSize);
yRange = linspace(min(proteinY), max(proteinY), gridSize);

% Step 7: Create 2D histogram (density plot)
proteinDensity = histcounts2(proteinX, proteinY, xRange, yRange);

% Step 8: Plot heatmap and ligand
figure;
imagesc(xRange, yRange, proteinDensity');
set(gca, 'YDir', 'normal');
colorbar;
title('Protein Atom Density with Ligand (5L2S)');
xlabel('X coordinate (Å)');
ylabel('Y coordinate (Å)');
hold on;

plot(ligandX, ligandY, 'r*', 'MarkerSize', 8);
legend('Protein Density', 'Ligand Atoms');
hold off;

exportgraphics(gcf, 'protein_ligand_density_5L2S.png', 'Resolution', 300);
