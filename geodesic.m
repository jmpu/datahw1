% 4.2 geodesic function
function geod = geodesic(G, geod)
    for row = 1:8
        for col = 1:8
        %      graphshortestpath(G,s,t) G is required to be sparse matrix,
        %      sparse(D1) a saving-room representation...
           [PATH,D] = shortestpath(G,row,col,'Method','positive');
%             disp(D);
%             disp(PATH);
            geod(row,col)= length(PATH)-1;
        end
    end
end
