function colors = GenerateColorMap(minHue, maxHue, Sat, Value, nbColors)
arguments
        minHue = 85;
        maxHue = 360;
        Sat = 1;
        Value = 1;
        nbColors = 10;
end
    colors = zeros(nbColors, 1, 3);
    minHue = minHue / 360;
    maxHue = maxHue / 360;
    delta = (maxHue - minHue);
    if nbColors ~= 1
        delta = (maxHue - minHue)/(nbColors-1);
    end
    for i = 1:nbColors
            hsv = [(delta)*(i-1) + (minHue), Sat, Value];
            colors(i, 1, :) = hsv2rgb(hsv);
    end

end