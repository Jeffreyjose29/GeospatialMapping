# Geospatial Mapper
## Repository Aim



## Rayshader



<p align="center" width="100%"><img src="https://jeremymack-lu.github.io/rviz/images/rayshader_hex.png" alt="Data Visualization with R" style="width:150px;height:170px" /></p>



**Rayshader** is an open source package for producing 2D and 3D data visualizations in R. **Rayshader** uses elevation data in a base R matrix and a combination of raytracing, hillshading algorithms, and overlays to generate stunning 2D and 3D maps. In addition to maps, **Rayshader** also allows the user to translate **ggplot2** objects into beautiful 3D data visualizations.

The models can be rotated and examined interactively or the camera movement can be scripted to create animations. Scenes can also be rendered using a high-quality pathtracer, **rayrender**. The user can also create a cinematic depth of field post-processing effect to direct the user’s focus to important regions in the figure. The 3D models can also be exported to a 3D-printable format with a built-in STL export function, and can be exported to an OBJ file.

Rayshader can be used for two purposes: both creating hillshaded maps and 3D data visualizations plots. First, let’s look at rayshader’s mapping capabilities.

### Installation In R

```R
# To install the latest version from Github
# install.packages("devtools")
devtools::install_github("tylermorganwall/rayshader")
devtools::install_github("tylermorganwall/rayrender")
```

The following libraries are required on Ubuntu:

```Ubuntu
libpng-dev libjpeg-dev libfreetype6-dev libglu1-mesa-dev libgl1-mesa-dev pandoc zlib1g-dev libicu-dev libgdal-dev gdal-bin libgeos-dev libproj-dev
```

**For more information on Rayshader, please check out the official [Github documentation](https://github.com/tylermorganwall/rayshader) from Tyler Morgan Wall.**

## Data Sources

