function CleanWorkspace(CloseAll)
arguments
    CloseAll = false;
end
    clc;
    if CloseAll
        all_fig = findall(0, 'type', 'figure');
        close(all_fig);
    end
end

