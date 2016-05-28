function [Displacements] = GetDbnDisplacements(current_dir)

for i = 1 : 25,
    i

    x = sprintf('%s/PosYoung%d.txt', current_dir, i);
    pos1 = load(x);

    x = sprintf('%s/PosOld%d.txt', current_dir, i);
    pos2 = load(x);

    displacements = GetDisplacements(pos1, pos2);
    if i == 1,
        Displacements = displacements;
    else
        Displacements = [Displacments; displacements];
    end
    
end