# Procedural-Generation
This program produces 3-dimensional vertices for shape/sphere generation. 

Must have the Parallel Computing Toolbox installed

All terrain texture image files from: https://www.solarsystemscope.com/textures/

Perlin noise function modified from: https://gist.github.com/OrganicIrradiation/2a927ab7f9cfeb1bff78

## Known Issues

Texture image mapping is not finished.

Using a high resolution setting could cause the program to crash (out of RAM), this crash should be avoided if possible.

Generations using the CPU seem to be much quicker than using the GPU, this should not happen and needs to be fixed.

This program is supposed to have an export option to save a generation, this function still needs added.

In its current state,a lot of the code needs to be revised and cleaned up. Remove global variables.

## Future

Implement a higher level of control of the noise

Add different kinds of noise: ridges, craters, valleys, etc.

Create a more efficient function for creating Perlin noise, as this one is very slow.
