# Collection of Autolisp utility functions

Bunch of Autolisp routines to aid in day to day drafting tasks

## Table of contents

- [Layer Utils](#layerutils)
- [Doc Utils](#docutils)
- [Layer Utils](#mathutils)
- [Doc Utils](#genutils)

## Layerutils


Various Layer related Utilities

## docutils

# FileName : autils_cad.lsp
Various AutoCAD Object and Document related Utilities

## (acad-version)
Retrives autocad version as float
* No arguments
returns: Float AutoCAD version number

## (acad-object)
Get AutoCAD.Application object pointer
* No arguments
returns: AutoCAD.Application pointer

## (acad-actdoc)
Get ActiveDocument pointer
* No arguments
returns: ActiveDocument pointer

## (acad-dwgname)
Get activedocument drawing name
* No arguments




## mathutils

Various Maths and geometry related Utilities

## (points-coliniar)
Test if three points are colineir or not
* three 3dpoints
* returns Boolean

## (points-polygon)
Test if a set of 3d points form a closed polygon
* a list of 3dpoints
* returns Boolean

## (point-within-vertices)
Test if one 3d point falls within the boundary formed by a set of points
* 1. a 3dpoint 
  2. a list of 3d points
* returns Boolean

## (vertices-coniside)
Test in a given list of vertices , if distance between any two consecutive vertices is lesser then a given threshold.
* 1. a list of 3dpoints
  2. threshold distance
* returns a list of dotted pairs ( vertice index . distance)

## (vertices-far-apart)
Test in a given list of vertices , if distance between any two consecutive vertices is more  then a given threshold.
* 1. a list of 3dpoints
  2. threshold distance
* returns a list of dotted pairs ( vertice index . distance)

## (polygon-overlap)
Test if a polygon defined by a list of 3dpoints , overlaps or cuts another polygon formed using second list of 3dpoints
* 1. a list of 3dpoints
  2. a list of 3dpoints
* returns a list of list of 3dpoints , defining overlap area polygons










## genutils

Various General Utilities

## (polyline-vertexlist)
Returns a list of 3dpoints consisting of vertices of a polyline
* 1. a polyline entity

* returns a list 3dpoints , defining vertices of given polyline

