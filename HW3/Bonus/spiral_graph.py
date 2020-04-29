import math
import numpy as np

PI = math.pi

def spirograph_generate(loops_value, radius_value, dell):
    x_coord = 34.021225
    y_coord = -118.289162
spiral_grap
    multi_pi = PI * 18
    point_values = np.arange(0.0, multi_pi, 0.1)
    
    points = []

    for pt in point_values:
        add_value = loops_value + radius_value
        div_value = radius_value / loops_value
        added_div_value = 1 + radius_value / loops_value

        xcoord = (add_value) * math.cos((div_value) * pt) - dell * math.cos((added_div_value) * pt)
        ycoord = (add_value) * math.sin((div_value) * pt) - dell * math.sin((added_div_value) * pt)
        latitude = xcoord + x_coord
        longitude = ycoord + y_coord
        print(xcoord, ycoord)

        points.append((latitude, longitude))

    return points

def kml_generate(points):
    start = """<Placemark>
    <styleUrl>#z1</styleUrl><Point><coordinates>"""
    end = """</coordinates></Point>
    </Placemark>"""
    with open('new_kml.txt', 'w') as openfile:
        for xc, yc in points:
            openfile.write(start+str(yc)+","+str(xc)+end)


if __name__ == '__main__':
    radius_value = 0.0001
    dell = 0.0003
    loops_value = 0.0008   
    points = spirograph_generate(loops_value, radius_value, dell)
    kml_generate(points)
